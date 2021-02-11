class UsersController < ApplicationController
  include UsersHelper
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_session(@user)
      # redirect_to @user, notice: 'You have successfully logged in.'
    else
      render :new, alert: 'user not valid'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
