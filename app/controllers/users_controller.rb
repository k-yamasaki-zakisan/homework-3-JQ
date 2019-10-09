class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @books = Book.all
  end

  def index
    # サイドのプロフィール用のユーザー指定
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end

  def edit
  	@user = User.find(params[:id])
    if @user.id != current_user.id
     redirect_to user_path(current_user.id)
    end

  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
       flash[:success_update]  = " successfully your update"
  	   redirect_to user_path(@user.id)
    else
      flash[:error1] = "errorです、５０文字以内にしてください"
      redirect_to user_path(@user.id)   
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

end
