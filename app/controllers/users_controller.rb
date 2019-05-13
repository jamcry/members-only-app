class UsersController < ApplicationController
  def new
    redirect_to root_url, notice: "You already have an account!" if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "New account is created!"
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
