class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render :create
    else
      render :new
    end
  end

  private

  def book_params
    params.permit(:presence_id, :mood_id, :body_temperature_id, :sleep_id, :breakfast, :comment1, :reason_id, :period_id, :comment2).merge(user_id: current_user.id)
  end

end
