class UsersController < ApplicationController
  before_action :logged_in, only: [ :new, :create ]
  before_action :authenticate_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create

    @user = User.new user_params

    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "Thanks for signing up!"
    else
      render :new
    end

  end

  def index

  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find current_user.id
    if @user.update user_params
      redirect_to @user, notice: "Account Updated"
    else
      flash[:alert] = "Account Failed to Update!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def logged_in
    if user_signed_in?
      redirect_to users_path
    end
  end
end
