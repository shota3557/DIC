class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      flash[:notice] = "ブログを作成しました"
      redirect_to tasks_path
    else
      render :new
    end
  end


  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  
  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
