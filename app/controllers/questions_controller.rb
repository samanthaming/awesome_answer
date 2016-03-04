class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:show, :index]
  before_action :authorize_user, only: [:edit, :update, :destroy]


  def new
    @question  = Question.new
  end

  def create
    @question = Question.new question_params
    @question.user = current_user

    if @question.save
      redirect_to question_path(@question), notice: "Question Created"
    else
      render :new
    end
  end

  def show
    # @question = Question.find params[:id]
    @question.view_count += 1
    @question.save
    @answer = Answer.new
  end

  def index
    @questions = Question.order("created_at DESC").page(params[:page])
  end

  def edit
    # @question = Question.find params[:id]
  end

  def update
    # @question = Question.find params[:id]

    if @question.update question_params
      redirect_to question_path(@question), notice: "Question Updated"
    else
      render :edit
    end
  end

  def destroy
    # @question = Question.find params[:id]
    @question.destroy
    redirect_to questions_path, alert: "Question Deleted"
  end

  private

  def question_params
    params.require(:question).permit([:title, :body, :category_id])
  end

  def find_question
    @question = Question.find params[:id]
  end

  def authorize_user
    unless can? :manage, @question
      redirect_to root_path, alert: "access denied!"
    end
  end

end
