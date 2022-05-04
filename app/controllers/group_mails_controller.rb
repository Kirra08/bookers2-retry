class GroupMailsController < ApplicationController
  def new
    @group_mail = GroupMail.new
    
  end
  
  def create
    @group_mail = GroupMail.new(group_mail_params)
    @group = Group.find(params[:group_id])
    @group_mail.group_id = @group.id
    @group_mail.save!
  end 

  def index
  end

  def edit
  end
  
  private
  def group_mail_params
    params.require(:group_mail).permit(:title, :body)
  end 
end
