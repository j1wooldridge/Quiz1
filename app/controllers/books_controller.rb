class BooksController < ApplicationController
  def index
    #@books = Book.all
    @books = Book.order("name").page(params[:page]).per(3)
  end

  def new 
    @books = Book.new              
  end

  def create
    Book.create(book_params)
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :author, :genre, :pub_date)
  end
end
