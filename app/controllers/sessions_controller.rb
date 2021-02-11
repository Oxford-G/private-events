class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      redirect_to user_path(current_user.id), notice: 'You have successfully logged in.'
    else
      render :new, alert: 'failed to log in'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'You have successfully logged out.'
  end
end
