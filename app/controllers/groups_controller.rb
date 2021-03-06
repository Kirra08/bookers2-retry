class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.save
    
    redirect_to groups_path
  end 

  def index
    @groups = Group.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = current_user
    @book = Book.new
    @group = Group.find(params[:id])
    @group_mail = GroupMail.new
  end

  def edit
    @group = Group.find(params[:id])
    if @group.owner_id != current_user.id
      redirect_to groups_path
    end 
  end 
  
  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to groups_path
  end 
  
  def create_event
    @group_mail = GroupMail.new
  end 
  
  private
  def group_params
    params.require(:group).permit(:name,:introduction,:image)
  end 
end
