class UsersController < ApplicationController

  def index
    @users = User.order('created_at DESC').limit(10)
  end

  def show
    user = User.find(params[:id])
    @book = user.books
    book_data
  end
end
