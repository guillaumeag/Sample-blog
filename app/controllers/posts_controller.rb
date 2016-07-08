class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.published
  end

  # GET /post/1
  def show
    @post = Post.find(params[:id])
  end
end
