class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params.require(:comment).permit(:content))
		@comment.user = current_user

		if @comment.save
			redirect_to @post
		end
	end

	def destroy
	end

end
