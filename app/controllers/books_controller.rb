class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)
    @book.save
    redirect_to book_path(@book.id), notice: "You have created book successfully."
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path(@book.id),notice:"Successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice:"successfully"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
