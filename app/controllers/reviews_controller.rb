class ReviewsController < ApplicationController
  #before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  # def index
  #   @reviews = Review.all
  # end

  # GET /reviews/1
  # GET /reviews/1.json
  # def show
  #   @book = Book.find(params[:id])
  #   #@book_id = Book.find(params[:book_id])
  #   #@reviews = Review.all
  #   @review = Review.new
  # end

  # GET /reviews/new
  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
    #binding.pry
    #@books = Book.find(params[:id])
    #@reviews = Review.all
  end

  # GET /reviews/1/edit
  # def edit
  # end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.create(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to root_path , notice: '投稿完了しました' }
        format.json { render :index}#, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  # def update
  #   respond_to do |format|
  #     if @review.update(review_params)
  #       format.html { redirect_to @review, notice: 'Review was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @review }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @review.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  # def destroy
  #   @review.destroy
  #   respond_to do |format|
  #     format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_review
    #   @review = Review.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :rate, :review).merge(book_id: params[:book_id], user_id: current_user.id)
    end
end
