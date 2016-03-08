class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    answer = Answer.find params[:answer_id]
    @question = answer.question
    @answer = Answer.new
    @comment = Comment.new comment_params
    @comment.user = current_user

    if @comment.save
      redirect_to @question, notice: "Comment created"
    else
      flash[:alert] = "Comment not made"
      render "questions/show"
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
