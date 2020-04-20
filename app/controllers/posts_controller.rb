class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    @post.save
    flash[:notice] = "投稿に成功しました"
    redirect_to user_path(current_user.id)
  end
  
  
  def show
    @post = Post.find(id: params[:id])
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.image = params[:image]
    @post.content = params[:content]
    @post.update(post_params)
    redirect_to user_path(current_user.id)
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy(post_params)
    redirect_to user_path(current_user.id)
  end
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to user_path(current_user.id)
    end
  end
  
  
  private
  def post_params
    params.require(:post).permit(:image, :content)
  end


end
