class QuestionsController < ApplicationController

  def new
    @question  = Question.new
  end

  def create
    @question = Question.new question_params

    if @question.save
      redirect_to question_path(@question), notice: "Question Created"
    else
      render :new
    end
  end

  def show
    @question = Question.find params[:id]
  end

  def index
    @questions = Question.order("created_at DESC").page(params[:page])
  end

  def edit
    @question = Question.find params[:id]
  end

  def update
    @question = Question.find params[:id]

    if @question.update question_params
      redirect_to question_path(@question), notice: "Question Updated"
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find params[:id]
    @question.destroy
    redirect_to questions_path, alert: "Question Deleted"
  end

  private

  def question_params
    params.require(:question).permit([:title, :body])
  end

end
