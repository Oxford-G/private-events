module UsersHelper
  def start_session(user)
    if user
      session[:user_id] = user.id
      redirect_to user_path(current_user.id), notice: "User #{user.name} account signed up successfully!"
    else
      flash.now[:alert] = 'Username is invalid'
    end
  end
end
