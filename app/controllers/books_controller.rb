class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id), notice: "You have created book successfully."
  end

  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @book = Book.new
    @book = Book.find(params[:id])
    if @book.user.id == current_user.id
      @user = User.find(current_user.id)
    else
      @user = User.find(@book.user.id)
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
