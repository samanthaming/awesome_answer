class FavoritesController < ApplicationController
  before_action :authenticate_user

  def create
    q = Question.find params[:question_id]
    favorite = Favorite.new(question: q, user: current_user)

    if favorite.save
      redirect_to q, notice: "Favorited!"
    else
      redirect_to q, alert: "Favorite Failed!"
    end
  end


  def destroy
    q = Question.find params[:question_id]
    favorite = current_user.favorites.find params[:id]
    favorite.destroy
    redirect_to q, notice: "Un-favorited!"
  end

end
