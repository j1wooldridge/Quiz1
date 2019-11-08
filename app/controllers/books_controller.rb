class BooksController < ApplicationController
  def index
    #@books = Book.all
    @books = Book.order("name").page(params[:page]).per(3)
  end

  def new 
        @books = Book.new              
  end
end
