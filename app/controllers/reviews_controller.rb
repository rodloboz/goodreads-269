class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.book = @book
    @review.user = current_user

    if @review.save
      redirect_to book_path(@book, anchor: "#reviews")
    else
      render "books/show"
    end

  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
