class PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.text_search(params[:query])
    respond_with @posts
  end

  def show
    respond_with Post.find(params[:id])
  end

  def create
    respond_with Post.create(params[:post])
  end

  def update
    respond_with Post.update(params[:id], params[:post])
  end

  def destroy
    respond_with Post.destroy(params[:id])
  end
end
