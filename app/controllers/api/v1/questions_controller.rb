class Api::V1::QuestionsController < ApplicationController

  def index
    @questions = Question.order("created_at DESC").limit(10)
    # this will render /api/v1/questions/index.json.jbuilder

    # Update: b/c installed serializer, below use question_serializer.rb instead
    render json: @questions
  end

  def show
    @question = Question.find params[:id]
    # this will render /api/v1/questions/show.json.jbuilder

    # Update: b/c installed serializer, below use question_serializer.rb instead
    render json: @question
  end

end
