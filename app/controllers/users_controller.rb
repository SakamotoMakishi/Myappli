class UsersController < ApplicationController

  def index
  end

  def show
    user = User.find(params[:id])
    @book = user.books
    @total = current_user.books.all.count
    @last_book = current_user.books.last(1)
    book_week = current_user.books.group("DATE_FORMAT(created_at,'%Y-%m-%d %H:00:00')").count
    book_month = current_user.books.group("DATE_FORMAT(created_at,'%Y-%m-%d')").count
    @book_week = book_week.values.last
    @book_month = book_month.values.last
  end
end
