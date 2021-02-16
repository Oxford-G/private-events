class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_session(@user)
      flash[:alert] = 'You have successfully signed up.'
    else
      render :new, alert: 'user not valid'
    end
  end

  def show
    # @user = User.find(params[:id])
    @invited_events = User.find(params[:id])
    @created_events = current_user.events
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
