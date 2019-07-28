class ProductsController < ApplicationController

  def index
    @books = Book.order('id ASC').limit(20)
  end

  def show
    @book = Book.find(params[:id])
  end
end