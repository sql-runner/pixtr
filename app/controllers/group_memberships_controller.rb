class GroupMembershipsController < ApplicationController

  def create
    group = Group.find(params[:id])
    group.users << current_user

    redirect_to group
  end

  def destroy
    @group = Group.find(params[:id])
    @group.users.delete(current_user)

    redirect_to @group

  end


end
