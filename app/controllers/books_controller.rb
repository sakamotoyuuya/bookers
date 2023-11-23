class BooksController < ApplicationController


  def create
    # １. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:success] = "successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash.now[:alert] = "error"
      render :index
    end
  end

  def index
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
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path
  end
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path # 投稿一覧画面へリダイレクト
  end

private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end