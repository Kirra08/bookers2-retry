class GroupUsersController < ApplicationController
 
 def new
  group_user = GroupUser.new
 end 
   
 def create
  #group_user = GroupUser.new
  #group_user.user_id = current_user.id
  #group_user.group_id = Group.find(params[:group_id])
  @group = Group.find(params[:group_id])
  group_user = current_user.group_users.new(group_id: @group.id)
  group_user.save
  #binding.pry
 end 
 
 def destroy
  @group = Group.find(params[:group_id])
  group_user = current_user.group_users.find_by(group_id: @group.id)
  group_user.destroy
  #binding.pry
 end 

end
