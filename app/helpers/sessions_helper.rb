module SessionsHelper
  def log_in(user)
    session[:id] = user.id
  end

  # Returns the current logged-in user if any
  def current_user
    @current_user ||= User.find_by(id: session[:id]) if session[:id]
  end

  # Returns true if a user is logged in
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:id] = nil
  end
end
