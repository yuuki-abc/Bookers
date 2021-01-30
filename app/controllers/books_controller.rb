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
    redirect_to book_path(book), notice: "Editing was successfully"
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    # ここでインスタンス変数で定義しておけば、render先でこの変数を使える。

    if @book.save
      redirect_to book_path(@book), notice: "Created successfully"
    else
      flash[:alert] = "error"
      # flashという名前の連想配列のnoticeというキーの値に、メッセージを代入
      render action: :books
      # createアクション内で定義したインスタンス変数でbooks viewを開ける
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Deleted successfully"
  end

  private

  def book_params
    # 命名規則は、モデル名_paramsが一般的。
    # paramsメソッドにはフォームから送られてきたデータが入る。
    params.require(:book).permit(:title, :body)
  end

end
