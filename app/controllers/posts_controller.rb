class PostsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = params[:user_id]
    @post.category = params[:group1]
    @post.save
    redirect_to current_user
  end

  def update
  end

  def edit
  end

  def destroy
  end
  private
  def posts_params
    params.require(:post).permit(:user_id,:group1,:text)
  end
end
