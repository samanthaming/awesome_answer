class Api::V1::QuestionsController < ApplicationController

  def index
    @questions = Question.order("created_at DESC").limit(10)
    render layout: false ## need this b/c using slim template
    # this will render /api/v1/questions/index.json.jbuilder

    # Alternative of not using jBuilder
    # render json: @questions
  end

  def show
    @question = Question.find params[:id]
    render layout: false ## need this b/c using slim template
    # /api/v1/questions/show.json.jbuilder

    # Alternative of not using jBuilder
    # render json: @question
  end

end
