class BooksController < ApplicationController
  def show
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def edit
  end
end
