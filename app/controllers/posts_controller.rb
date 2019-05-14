class PostsController < ApplicationController
  before_action :require_login, except: [:show, :index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "New post created."
      redirect_to @post
    else
      flash[:danger] = "Cannot create new post!"
      render 'new'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def index
    @posts = Post.all
  end

  private

      def post_params
        params.require(:post).permit(:title, :body)
      end

      # Redirects to home page if user is not logged in
      def require_login
        redirect_to root_url, notice: "You must be logged in for this action." if !logged_in?
      end
end
