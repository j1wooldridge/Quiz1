class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    #@books = Book.all
    @books = Book.order("name").page(params[:page]).per(3)
  end

  def new 
    @books = Book.new              
  end

  def create
    current_user.books.create(place_params)
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :author, :genre, :pub_date)
  end
end
