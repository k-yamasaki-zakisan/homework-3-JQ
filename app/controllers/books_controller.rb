class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @thebook = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id =  current_user.id
  	if @book.save
  	  redirect_to book_path(@book)
      flash[:success]  = "successfully"
    else
      flash[:error2] = "errorです、200文字以内にしてください"
      redirect_to books_path
    end    
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
       redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book)
       flash[:success]  = "successfully"
    else
      render action: :edit
    end
  end
  
  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
