class GroupMailsController < ApplicationController
  def new
    @group_mail = GroupMail.new
    
  end
  
  def create
    @group_mail = GroupMail.new(group_mail_params)
    @group = Group.find(params[:group_id])
    @group_mail.group_id = @group.id
    @group_mail.save
    redirect_to edit_group_group_mail_path(@group,@group_mail)
  end 

  def index
    @group = Group.find(params[:group_id])
    @group_mails = GroupMail.where(group_id: @group)
  end

  def edit
    @group_mail = GroupMail.find(params[:id])
  end
  
  def destroy
    @group_mail = GroupMail.find(params[:id])
    @group_mail.destroy
  end
  
  def user_mail
    @groups = Group.all
  end 
  
  private
  def group_mail_params
    params.require(:group_mail).permit(:title, :body)
  end 
end
