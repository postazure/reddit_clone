class AuthenticationController < ApplicationController
  def destroy
    session.clear
    redirect_to root_path, notice: "User signed out successfully"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to signin_path, alert:"Username / password combination is invalid"
    end
  end

end
