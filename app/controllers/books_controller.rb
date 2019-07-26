class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.order('created_at DESC').limit(40)
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
