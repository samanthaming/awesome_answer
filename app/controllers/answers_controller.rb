class AnswersController < ApplicationController
  before_action :find_answer, only: [:destroy] ## need this for cancancan to work!
  before_action :authenticate_user, except: [:show, :index]
  before_action :authorize_user, only: [:destroy]


  def create
    @question = Question.find params[:question_id]
    answer_params = params.require(:answer).permit(:body)
    @answer = Answer.new answer_params
    @answer.question = @question
    @answer.user = current_user
    @comment = Comment.new

    respond_to do |format|
      if @answer.save
        # AnswersMailer.notify_question_owner(@answer).deliver_later
        format.html {redirect_to question_path(@question), notice: "Answer Created!"}
        format.js { render :create_success, layout: false }
      else
        # format.html{render "/questions/show"}
        # format.js {render :create_failure}
        # format.js { render js: "alert('Hello Rails');" }
      end
    end

  end

  def destroy
    # @answer = Answer.find params[:id]
    @answer.destroy
    redirect_to question_path(params[:question_id]), notice: "Answer Deleted!"
  end

  private

  def find_answer
    @answer = Answer.find params[:id] ## !need to be @answer for cancancan to work
  end

  def authorize_user
    unless (can? :manage, @answer) || (can? :destroy, @answer)
    # unless can? :manage, @answer
      redirect_to root_path, alert: "access denied!"
    end
  end

end
