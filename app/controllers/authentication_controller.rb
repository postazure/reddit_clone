class AuthenticationController < ApplicationController
  def destroy
    session.clear
    redirect_to root_path, notice: "User signed out successfully"
  end

  def new
    @user = User.new
  end
end
