class LikesController < ApplicationController
  
  def create
    @post = Post.find_by(id: params[:id])
    @like = current_user.likes.new(post_id: params[:post_id])
    @like.save
    flash[:notice] = "いいねしました"
    @like_count = Like.where(post_id: params[:post_id]).count
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    flash[:notice] = "いいね解除しました"
    @like_count = Like.where(post_id: params[:post_id]).count
  end
  
end