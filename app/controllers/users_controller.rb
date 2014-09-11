class UsersController < ApplicationController
  def friend
    current_user.friend!(User.find params[:id])
    head :ok
  end

  def unfriend
    current_user.unfriend!(User.find params[:id])
    head :ok
  end

  def index
    @users = User.all
  end

  def friends
    @users = current_user.friends
    render :index
  end
end
