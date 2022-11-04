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
      redirect_to blog_path(@blog.id)
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


  def update
    @blog = Blog.find(parmas[:id])
    if @blog.update(blog_params)
      flash[:notice] = 'ブログを更新しました'
      redirect_to blogs_path
    else
      render :new
    end
  end

  def destroy
    @blog = Blog.find(parmas[:id])
    @blog.destroy
    flash[:alert] = 'ブログを削除しました'
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
