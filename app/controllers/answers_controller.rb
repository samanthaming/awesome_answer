class AnswersController < ApplicationController
  before_action :find_answer, only: [:destroy] ## need this for cancancan to work!
  before_action :authenticate_user, except: [:show, :index]
  before_action :authorize_user, only: [:destroy]


  def create
    @question = Question.friendly.find params[:question_id]
    answer_params = params.require(:answer).permit(:body)
    @answer = Answer.new answer_params
    @answer.question = @question
    @answer.user = current_user
    @comment = Comment.new

    respond_to do |format|
      if @answer.save
        # AnswersMailer.notify_question_owner(@answer).deliver_later
        format.html {redirect_to question_path(@question), notice: "Answer Created!"}

        ## b/c using slim, need to set layout: false, otherwise, application template would be included
        format.js { render :create_success, layout: false }
      else
        format.html{ render "/questions/show" }
        format.js { render :create_failure, layout: false }
      end
    end

  end

  def destroy
    # @answer = Answer.find params[:id]
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to question_path(params[:question_id]), notice: "Answer Deleted!" }
      format.js { render :destroy, layout: false }
    end

  end

  private

  def find_answer
    @answer = Answer.find params[:id] ## !need to be @answer for cancancan to work
  end

  def authorize_user
    unless (can? :manage, @answer) || (can? :destroy, @answer)
      redirect_to root_path, alert: "access denied!"
    end
  end

end
