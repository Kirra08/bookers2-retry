class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @books = Book.find(params[:id])
    @user = User.find(@books.user_id)
    @book = Book.new
    @book_comment = BookComment.new
    impressionist(@books)
  end

  def index
    @user = current_user
    @book = Book.new
    #@books = Book.includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}
    @books = Book.find(Favorite.group(:book_id).where(created_at: Time.current.all_week).order('count(book_id) desc').pluck(:book_id))
    @zero_books = Book.where()
  end
  
  def new
    @book = Book.new
  end 
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else 
      @user = current_user
      @books = Book.all
      render :index
    end 
  end 

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end 
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] ="You have updated book successfully."
      redirect_to book_path()
    else
      render :edit
    end 
  end 
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end 
  
  def new_index
    @new_index = Book.all.order(created_at: :desc)
    @user = current_user
    @book = Book.new
  end 
  
  def star_index
    @star_index = Book.all.order(star: :desc)
    @user = current_user
    @book = Book.new
  end 
  
  def serch_result
  end 
  
  private
  def book_params
    params.require(:book).permit(:title,:body, :star, :tag)
  end 
end
