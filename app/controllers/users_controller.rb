class UsersController < ApplicationController
  # before_filter :set_json_format
  return_json except: :show

  def friend
    current_user.friend!(User.find params[:id])
    # Send back an empty response - no content, just not an error
    #head :ok
    redirect_to :back, flash: {success: "User has been successfully friended!"}
  end

  def unfriend
    current_user.unfriend!(User.find params[:id])
    #head :ok
    redirect_to :back, flash: {success: "User has been successfully unfriended."}
  end

  def index
    @users = User.all
    # render :index
  end

  def friends
    @users = current_user.friends
    render :index
  end

  def show
    @user= User.find(params[:id])
  end
end
