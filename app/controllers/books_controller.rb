class BooksController < ApplicationController

  def index
   @books = Book.all
   @book = Book.new
  end

  def create
   # データを受け取り新規登録するためのインスタンス作成
   book = Book.new(book_params)
   # データをデータベースに保存するためのsaveメソッド実行
   book.save
   # 詳細画面へリダイレクト
   redirect_to book_path(book.id)
  end

  def show
  # レコード1件のみ取得するため、インスタンス変数名は単数形にする
   @book = Book.find(params[:id])
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
   book = Book.find(params[:id])
   book.update(book_params)
   redirect_to book_path(book.id)
  end

  def destroy
   # データ（レコード）を1件削除
   book = Book.find(params[:id])
   # データ（レコード）を削除
   book.destroy
   # index投稿一覧へリダイレクト
   redirect_to '/books'
  end

 private
 # ストロングパラメータ
 def book_params
  params.require(:book).permit(:title, :body)
 end

end
