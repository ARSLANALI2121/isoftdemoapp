class LikesController < ApplicationController
	before_action :find_blog
	before_action :find_like, only: [:destroy]

def create
  # if already_liked?
  #   flash[:notice] = "You can't like more than once"
  # else
	if params[:blog_id].present?
    @blog.likes.create(user_id: current_user.id)
		redirect_to blog_path(@blog)
		else
			@comment.likes.create(user_id: current_user.id)
			redirect_to blog_path(@comment.blog)
		end
end

	def destroy
		# if !(already_liked?)
			# flash[:notice] = "Cannot unlike"
		# else
			@like.destroy
		# end
		redirect_to blog_path(@blog)
	end

  private
  def find_blog
		if params[:blog_id].present?
			@blog = Blog.find(params[:blog_id])
			else
			@comment = Comment.find(params[:comment_id])
			end
  end

	# def find_blog
  #   @blog = Blog.find(params[:blog_id])
  # end

	def find_like
		@like = @blog.likes.find(params[:id])
 end
#  def already_liked?
# 	Like.where(user_id: current_user.id, blog_id:
# 	params[:blog_id]).exists?
# end


# def create
#   params[:like][:user_id] = current_user.id
#   @like = Like.new(like_params)
#   if @like.save
#     flash[:success] = 'Thanks for liking!'
#   else
#     flash[:alert] = @like.errors.full_messages.join(', ')
#   end
# end

# def destroy
#   @like = current_user.likes.find(params[:id])
#   @like.destroy
# end

# protected
# def like_params
#   params.require(:like).permit(:user_id, :reference_id, :reference_type)
# end

end
