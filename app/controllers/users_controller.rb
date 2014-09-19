class UsersController < ApplicationController
  # before_filter :set_json_format
  return_json except: [:show, :index]

  def friend
    friend = User.find params[:id]
    current_user.friend!(friend)
    # Send back an empty response - no content, just not an error
    #head :ok
    UserMailer.friend_email(friend).deliver
    redirect_to :back, flash: {success: "User has been successfully friended!"}
  end

  def unfriend
    unfriend = User.find params[:id]
    current_user.unfriend!(User.find params[:id])
    #head :ok
    UserMailer.unfriend_email(unfriend).deliver
    redirect_to :back, flash: {success: "User has been successfully unfriended."}
  end

  def index
    @users = User.includes(:friends)
  end

  def show
    @user = User.find(params[:id])
  end

  def friends
    @users = current_user.friends
    render :index
  end

  def show
    @user= User.find(params[:id])
  end
end
