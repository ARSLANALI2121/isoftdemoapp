class CommentsController < ApplicationController
	# load_and_authorize_resource :nested => :blog
	def edit
		# byebug
		@comment = Comment.find(params[:id])
		@blog = Blog.find(params[:blog_id])
	end

	def create
		# byebug
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "Comment successfully added"
			redirect_to blog_path(@blog)
		else
			render partial: "comments/form"
		end
	end

	def update
		@blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			flash[:success] = " Comment Edit Succesfully "
			redirect_to blog_path(@blog)
			else
				render 'edit'
			end
	end

	def destroy
		@blog = Blog.find(params[:blog_id])
		@comment = Comment.find(params[:id])
		if @comment.destroy
			redirect_to blog_path(@blog)
		end
	end
	private
	
		def comment_params
			params.require(:comment).permit(:comment, :images)
		end

end
