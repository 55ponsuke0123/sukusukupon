class BooksController < ApplicationController
  #before_action :authenticate_user!, except: [:index]
  
  def index
  end

  def new
    @book = Book.new
  end

  def create
  end

end
