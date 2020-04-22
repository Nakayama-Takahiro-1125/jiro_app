class LikesController < ApplicationController
  before_action :set_variables
  
  def create
    @like = current_user.likes.new(post_id: params[:post_id])
    @like.save
    @like_count = Like.where(post_id: params[:post_id]).count
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    @like_count = Like.where(post_id: params[:post_id]).count
  end
  
  def set_variables
    @post = Post.find(params[:post_id])
  end
  
end