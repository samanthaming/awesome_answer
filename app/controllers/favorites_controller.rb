class FavoritesController < ApplicationController
  before_action :authenticate_user

  def create
    @question = Question.find params[:question_id]
    favorite = Favorite.new(question: @question, user: current_user)

    respond_to do |format|
      if favorite.save
        format.html { redirect_to @question, notice: "Favorited!" }
        format.js { render :create_success, layout: false }
      else
        format.html { redirect_to @question, alert: "Favorite Failed!" }
        format.js { render :create_failure, layout: false }
      end
    end
  end


  def destroy
    @question = Question.find params[:question_id]
    favorite = current_user.favorites.find params[:id]
    favorite.destroy

    respond_to do |format|
      format.html { redirect_to @question, notice: "Un-favorited!" }
      format.js { render :destroy, layout: false}
    end

  end

end
