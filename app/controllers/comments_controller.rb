class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create!(params[:comment])
		redirect_to posts_url		
	end
end
