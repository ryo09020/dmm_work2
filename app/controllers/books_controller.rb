class BooksController < ApplicationController
  def new
  end

  def index
    @book=Book.new
    @books=Book.all
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
       flash[:notice] ='The book was successfully created.'
      redirect_to book_path(@book)
    else
      @books=Book.all
      render :index
    end

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
      flash[:notice] ='The book was successfully created.'
      redirect_to book_path(@book)
    else
      render :edit
    end


  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
