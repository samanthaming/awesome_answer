class WelcomeController < ApplicationController
  # we call instance methods defined in a controller "actions".
  # we need action in order to handle user requests
  def index

  end

  def about

  end

  def greet
    @name = params[:name]
  end
end
