module SessionsHelper
  def log_in(user)
    session[:id] = user.id
  end

  # Returns the current logged-in user if any
  def current_user
    if user_id = session[:id]
      @current_user ||= User.find_by(id: user_id)
    elsif user_id = cookies.signed[:user_id]
      @current_user = User.find_by(id: user_id) if authenticated?
    end
  end

  def authenticated?
    if user = User.find_by(id: cookies.signed[:user_id])
      BCrypt::Password.new(user.remember_digest).is_password?(cookies[:remember_token])
    end
  end

  # Returns true if a user is logged in
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:id] = nil
    forget
  end

  def remember(user)
    user.create_remember_token
    cookies.permanent[:remember_token] = user.remember_token
    cookies.permanent.signed[:user_id] = user.id
    user.update_attribute(:remember_digest, User.digest(user.remember_token))
  end

  def forget
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
  end
end
