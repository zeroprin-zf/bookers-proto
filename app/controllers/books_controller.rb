class BooksController < ApplicationController
  def index
    @books = Book.all#すべてのdbの全てのレコードを取得する
    @book = Book.new
  end

  def create
    #データを受け取り新規登録するためのインスタンスを作成。コントローラでしか使わないためローカル変数
    book = Book.new(book_params)#モデルのインスタンスを作成
    #データをデータベースに保存するためのsaveメソッド
    book.save#モデルインスタンスをデータベースに保存するDBに実際に保存される
    redirect_to book_path(book.id) #仮
  end

  def show
    @book = Book.find(params[:id]) #idが適した数字のレコードを取得
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
  end

  private #private コントローラの中でしか呼び出せない領域
  def book_params
    params.require(:book).permit(:title, :body)
  end
  #params formから送られてくるデータはparamsの中にある
  #require 送られてきたデータの中からモデル名を指定し、データを送り込む
  #permit requireで絞り込んだデータの中から、保存を許可するカラムを指定する
end
