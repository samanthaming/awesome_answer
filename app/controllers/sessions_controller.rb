class SessionsController < ApplicationController

  def new

  end

  def create
    # b/c using a symbol in place of the first arugment in Simple Form,
    #  so params are now within [:session] <it can be whatever you name it>
    @user = User.find_by_email params[:session][:email]

    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to root_path, notice: "Signed in"
    else
      flash[:alert] = "Incorrect email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

end
