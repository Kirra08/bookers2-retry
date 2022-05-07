class UsersController < ApplicationController
  before_action :authenticate_user!
  
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
    if @user != current_user
      redirect_to user_path(current_user)
  end 
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
    else 
      render :edit
    end 
    
    def search_books
      user = User.find(params[:user_id])
      @books = user.books
      @book = Book.new
      if params[:created_at] ==""
        @serch_book = "日付を選択してください"
      else
        created_at = params[:created_at]
        @search_book = @books.where(['created_at LIKE ? ', "#{created_at}%"]).count
      end 
    end 
  end 
  
  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end 
end
