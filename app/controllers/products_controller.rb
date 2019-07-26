class ProductsController < ApplicationController

  def index
    @books = Book.order('id ASC').limit(40)
  end

  def show
    @book = Book.find(params[:id])
  end
end