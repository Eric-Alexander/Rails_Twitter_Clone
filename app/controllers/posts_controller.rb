class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
  def create
      @post = current_user.posts.build(post_params)
      if @post.save
          flash[:success] = "Post created!"
          redirect_to root_url
      else
          @feed_items = []
          render 'static_pages/home'
      end
  end

  def destroy
      @post.destroy
      flash[:success] = "Post has been deleted."
      redirect_to request.referrer || root_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :picture)
  end
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
  end
end
