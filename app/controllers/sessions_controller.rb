class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: session_params[:name])
    if user
      session[:user_id] = user.id
      redirect_to user_path(current_user.id), alert: 'You have successfully logged in.'
    else
      flash.now[:alert] = 'This user doesn\'t exist'
      render :new, alert: 'failed to log in'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, alert: 'You have successfully logged out.'
  end
  def session_params
    params.require(:session).permit(:name)
  end
end