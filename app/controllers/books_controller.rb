class BooksController < ApplicationController
  def top
  end

  def books
    @books = Book.all
    @book = Book.new
    # redirect_to '/show' ☆☆☆☆☆☆☆☆☆☆
  end

  def show
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path, method: :get
  end

  def update
    book = Book.find(params[:id])
    book.update(blog_params)
    # redirect_to blog_path(blog) ☆☆☆☆☆☆☆☆☆☆
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    # redirect_to blogs_path ☆☆☆☆☆☆☆☆☆☆
  end

  private

  def book_params
    # 命名規則は、モデル名_paramsが一般的。
    params.require(:book).permit(:title, :body)
  end

end
