class UsersController < ApplicationController
  before_action :authorize_user_admin, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: "User updated succesfully"
    else
      render :show
    end
  end

  private
    def user_params
      params.require(:user).permit(:is_moderator)
    end

    def authorize_user_admin
      @user = User.find(params[:id])
      redirect_to @user unless current_user.is_admin
    end
end
