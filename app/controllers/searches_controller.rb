class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = (params[:range])
    
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end 
  end 
  
  def search_tag
    @books = Book.looks_tag(params[:word])
    @user = current_user
    @book = Book.new
  end 
end
