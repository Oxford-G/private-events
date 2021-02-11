module ApplicationHelper
  def user_signed_in?
    !session[:current_user_id].nil?
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
