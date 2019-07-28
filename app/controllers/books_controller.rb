class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.order('created_at DESC').limit(40)
    @ranking = Book.find(Review.group(:book_id).order('count(book_id) desc').limit(7).pluck(:Book_id))
    # book_ids = Book.group(:id).order('count_id DESC').limit(5).count(:id).keys
    # @ranking = book_ids.map { |id| Book.find(id) }
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
