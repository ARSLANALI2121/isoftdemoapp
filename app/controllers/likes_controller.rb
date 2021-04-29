class LikesController < ApplicationController
	before_action :find_blog
	before_action :find_like, only: [:destroy]

def create
	if params[:blog_id].present?
    @blog.likes.create(user_id: current_user.id)
		redirect_to blog_path(@blog)
		else
			@comment.likes.create(user_id: current_user.id)
			redirect_to blog_path(@comment.blog)
		end
end

	def destroy
		if params[:blog_id].present?
		@like.destroy
		redirect_to blog_path(@blog)
		else
			@like.destroy
			redirect_to blog_path(@comment.blog)
		end
	end

  private
  def find_blog
		if params[:blog_id].present?
			@blog = Blog.find(params[:blog_id])
			else
			@comment = Comment.find(params[:comment_id])
		end
	end

	def find_like
		if params[:comment_id].present?
		@like = @comment.likes.find(params[:id])
		else
			@like = @blog.likes.find(params[:id])
		end
	end
#  def already_liked?
# 	Like.where(user_id: current_user.id, blog_id:
# 	params[:blog_id]).exists?
# end

end
