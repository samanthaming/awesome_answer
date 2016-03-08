class AnswersController < ApplicationController
  before_action :authenticate_user, except: [:show, :index]
  before_action :authorize_user, only: [:edit, :update, :destroy]


  def create
    @question = Question.find params[:question_id]
    answer_params = params.require(:answer).permit(:body)
    @answer = Answer.new answer_params
    @answer.question = @question
    @answer.user = current_user

    if @answer.save
      AnswersMailer.notify_question_owner(@answer).deliver_now
      redirect_to question_path(@question), notice: "Answer Created!"
    else
      render "/questions/show"
    end

  end

  def destroy
    answer = Answer.find params[:id]
    answer.destroy
    redirect_to question_path(params[:question_id]), notice: "Answer Deleted!"
  end

  private

  def authorize_user
    unless can? :manage, @answer
      redirect_to root_path, alert: "access denied!"
    end
  end

end
