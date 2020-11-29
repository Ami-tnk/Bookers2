class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @user = User.find(current_user.id)
    @books = Book.all
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
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
