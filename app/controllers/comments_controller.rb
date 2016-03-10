class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy]
  before_action :authenticate_user

  def create
    @ans = Answer.find params[:answer_id]
    @question = @ans.question
    @answer = Answer.new
    @comment = Comment.new comment_params
    @comment.answer = @ans
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html{ redirect_to @question, notice: "Comment created" }
        format.js { render :create_success, layout: false }
      else
        format.html{ render "questions/show" }
        format.js{ render :create_failure, layout: false }
      end
    end
  end

  def destroy
    @comment.destroy
    @question = @comment.answer.question

    respond_to do |format|
      format.html { redirect_to @question, notice: "Comment Deleted!" }
      format.js { render :destroy, layout: false }
    end

  end

  private

  def find_comment
    @comment = Comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
