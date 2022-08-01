class BooksController < ApplicationController
 protect_from_forgery

 def index
  @books = Book.all
  @book = Book.new
 end

 def create
  # データを受け取り新規登録するためのインスタンス作成
  @book = Book.new(book_params)
  # モデルで返されたバリデーションの結果を、コントローラで検出する
  if @book.save
   # trueの場合、詳細画面（show）にリダイレクトする
   redirect_to book_path(@book.id)
  else
   # falseの場合、投稿一覧画面（index）を再表示する
   @books = Book.all
   render :index
  end
 end

 def show
 # レコード1件のみ取得するため、インスタンス変数名は単数形にする
  @book = Book.find(params[:id])
 end

 def edit
  @book = Book.find(params[:id])
 end

 def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
   # trueの場合、詳細画面（show）にリダイレクトする
   redirect_to book_path(book.id)
  else
   # falseの場合、編集画面（edit）を再表示する
   render :edit
  end
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