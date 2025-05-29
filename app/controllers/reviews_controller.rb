class ReviewsController < ApplicationController
  before_action :set_listing, only: :create
  before_action :set_review, only: :destroy

def create
  @review = @listing.reviews.new(review_params)

  if @review.save
    redirect_to listing_path(@listing), notice: "Review was successfully created."
  else
    @past_bookings = current_user.bookings.where("booking_date < ?", Date.today)
    @booking = Booking.new
    redirect_to past_bookings_path, alert: "Failed to create review. Please check your input."
  end
end

  def destroy
    @review.destroy
    redirect_to listing_path(@review.listing), status: :see_other
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
