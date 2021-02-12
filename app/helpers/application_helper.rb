module ApplicationHelper
  def user_signed_in?
    !session[:current_user_id].nil?
  end

  def alerts
    if flash[:notice]
      render  'shared/notice'
    elsif flash[:alert]
      render  'shared/alert'
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_session
    redirect_to new_user_path, alert: 'Sign Up or Sign In to access this feature!' unless current_user
  end
end
