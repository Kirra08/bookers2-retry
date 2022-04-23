class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:edit]
  def show
    @books = Book.find(params[:id])
    @user = User.find(@books.user_id)
    @book = Book.new
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end 
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end 

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(@book.user_id)
  end 
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user)
  end 
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end 
end
