class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:current_user_id] = user.id
      redirect_to root_path, notice: 'You have successfully logged in.'
    else
      render :new, alert: 'failed to log in'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: 'You have successfully logged out.'
  end
end
