class SessionsController < ApplicationController
  def new
    if session[:id].nil?
      @user = User.new
    else
      flash[:info] = "You are already logged in!"
      redirect_to root_url
    end
  end

  def create
    @user = User.find_by(email: login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      log_in @user
      flash[:success] = "LOGGED IN"
      redirect_to root_url
    else
      flash[:warning] = "Invalid email or password or even both!"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:info] = "You have logged out."
    redirect_to root_url
  end

  private

      def login_params
        params.require(:session).permit(:email, :password)
      end
end
