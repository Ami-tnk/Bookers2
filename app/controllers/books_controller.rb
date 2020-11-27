class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @books = Book.order("id")
      render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.order("id")
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
