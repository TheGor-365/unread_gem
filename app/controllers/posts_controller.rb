class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
    
    return unless current_user

    @posts.each do |post|
      post.mark_as_read! for: current_user
    end
  end

  def show
    return unless current_user
    @post.mark_as_read! for: current_user
  end

  def edit; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save ? (redirect_to post_url(@post)) : (render :new)
  end

  def update
    @post.update(post_params) ? (redirect_to post_url(@post)) : (render :edit)
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
