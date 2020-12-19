class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(current_user.id) #renderするのに必要
    @books = Book.all                  #renderするのに必要

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), success: "You have created book successfully."
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @comment = BookComment.new
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book.id), success: "You have updated book successfully."
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
