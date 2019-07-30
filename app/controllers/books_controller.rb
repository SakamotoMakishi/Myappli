class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.order('created_at DESC').limit(40)
    @ranking = Book.find(Review.group(:book_id).order('count(book_id) desc').limit(7).pluck(:Book_id))
    if user_signed_in?
      @total = current_user.books.all.count
      @last_book = current_user.books.last(1)
      book_week = current_user.books.group("MINUTE(created_at)").group("SECOND(created_at)").count
      book_month = current_user.books.group("HOUR(created_at)").group("MINUTE(created_at)").count
      @book_week = book_week.values.count
      @book_month = book_month.values.count
      #binding.pry
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.create(form_params)
    @book.save
    redirect_to root_path
  end

  private
  def form_params
    params.require(:book).permit(:title,:image,:review,).merge(user_id: current_user.id)
  end
end
