class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def show

     @book=Book.new
     @user = User.find(params[:id])
     @books = @user.books
  end

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    else
    @user = current_user
    @books=Book.all
    render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @book=Book.new
    @user = current_user
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
       @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       if @user.save
       redirect_to user_path
       else
      render :edit
       end
  end

   private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end

end