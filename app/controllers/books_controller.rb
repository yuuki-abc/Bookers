class BooksController < ApplicationController

  def top
  end

  def books
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book), method: :get
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path, method: :get
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, method: :get
  end

  private

  def book_params
    # 命名規則は、モデル名_paramsが一般的。
    params.require(:book).permit(:title, :body)
  end

end
