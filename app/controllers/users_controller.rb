class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
  end

  def user_params
    params.require(:user).permit(:user)
  end
end