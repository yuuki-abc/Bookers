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
    redirect_to book_path(book)
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    # ここでインスタンス変数で定義しておけば、render先でこの変数を使える。

    if @book.save
      redirect_to book_path(@book)
    else
      render action: :books
      # createアクション内で定義したインスタンス変数でbooks viewを開ける
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    # 命名規則は、モデル名_paramsが一般的。
    # paramsメソッドにはフォームから送られてきたデータが入る。
    params.require(:book).permit(:title, :body)
  end

end
