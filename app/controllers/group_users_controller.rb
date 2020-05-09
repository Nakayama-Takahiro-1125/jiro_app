class GroupUsersController < ApplicationController
  def edit
    @user = current_user
    @group = Group.find(group_id: params[:group_id])
  end
  
  def update
    
  end
end
