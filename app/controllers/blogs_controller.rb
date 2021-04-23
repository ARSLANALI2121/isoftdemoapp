class BlogsController < ApplicationController
  before_action :set_params, only: [:edit, :show, :update, :destroy] 

  def index
    @blog = Blog.all
  end

  def new
    @blog = Blog.new()
  end

  def show
  end

  def edit
  end

  def create
    # byebug
    @blog = Blog.new(params_blog)
    @blog.user_id = current_user.id
    if @blog.save
      flash[:notice] = " Your Blog is created successfully "
      else
        flash[:alert] = " Their are some error in that information so we can't create this blog"
      end
      redirect_to blogs_path
  end

	def update
    # byebug
    @blog = Blog.find(params[:id])
		if @blog.update(params_blog)
			flash[:success]= "Post was successfully Updated."
      redirect_to blogs_path
			else
				flash[:error]= "Their is an Error is this information."
        render 'edit'
		end
	end

  private

  def set_params
    @blog = Blog.find(params[:id])
  end

  def params_blog
    params.require(:blog).permit(:title, :description, :image)
  end

end
