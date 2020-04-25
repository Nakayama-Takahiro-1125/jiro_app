class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    @user = User.find(current_user.id)
    @user.exp_sum +=  @post.exp.to_i
    @user.level = @user.exp_sum.to_i / 50
    current_user.update(exp_sum: @user.exp_sum, level: @user.level)
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to posts_path
    else
      render "posts/index"
    end
    
  end
  
  def index
    @user = User.find(current_user.id)
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
    @like_count = Like.where(post_id: params[:post_id]).count
  end
  
  
  
  def show
    @post = Post.find_by(id: params[:id])
    @like_count = Like.where(post_id: @post.id).count
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
    @post.destroy
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
    params.require(:post).permit(:image, :content, :exp)
  end

end
