class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
  end
  
  def create
    if Group.create(group_params)
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end
  
  def index
    @groups = Group.all.order(updated_at: :desc)
  end
  
  def show
    @group = Group.find_by(id: params[:id])
    @group.users << current_user
    @groupposts = Grouppost.where(group_id: @group.id).all
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :user_id [])
  end
  
  def grouppost_params
    params.require(:grouppost).permit(:content)
  end
  
end
