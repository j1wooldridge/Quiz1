class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @books = Book.order("name").page(params[:page]).per(3)
  end

  def new 
    @book = Book.new              
  end

  def create
    @book = current_user.books.create(book_params)
    redirect_to root_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
     @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    redirect_to root_path
  end

  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to root_path
end

  private

  def book_params
    params.require(:book).permit(:name, :description, :author, :genre, :pub_date)
  end
end
