class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = Post.where(user_id: @user.id).all
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    @post.save
    redirect_to user_path(current_user.id)
  end
  
  
  private
  def post_params
    params.require(:post).permit(:image, :content)
  end

end


