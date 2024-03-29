class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    #バリデーション実装の為if
    if @book.save
    
    redirect_to book_path(@book.id)
    flash[:notice]='You have created book successfully.'
    else
    render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice]='You have updated book successfully.'
    else
    render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
    
  end
  
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to books_path
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
