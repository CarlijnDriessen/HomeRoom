class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
    @booking = Booking.new
    @bookings = @listing.bookings
    @user = current_user
    @owner = @listing.user
  end

  def new
    @listing = Listing.new
    @booking = Booking.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      @listings = Listing.all
      render "listings/index", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    @listing.save
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :category, :description, :price)
    # not including active for creating new, assume it's active as default.
  end

end
