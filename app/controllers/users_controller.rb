class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:edit]
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end 

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end 
  
  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end 
end
