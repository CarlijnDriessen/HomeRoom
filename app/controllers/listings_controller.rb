class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :activate, :deactivate]

  def index
    if params[:query].present?
      @listings = Listing
        .where.not(user: current_user)
        .where("title ILIKE :query OR description ILIKE :query OR category ILIKE :query", query: "%#{params[:query]}%")
    else
      @listings = Listing.where.not(user: current_user)
    end
  end


  def show
    @booking = Booking.new
    @bookings = @listing.bookings
    @user = current_user
    @owner = @listing.user
    @markers = [{
        lat: @listing.latitude,
        lng: @listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {listing: @listing}),
      }]
  end


  def new
    @listing = Listing.new
    @booking = Booking.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      @listings = Listing.all
      render :new, status: :unprocessable_entity
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
    redirect_to dashboard_path, notice: 'Listing was successfully deleted.'
  end

  def activate
    @listing.update(active: true)
    redirect_to dashboard_path(tab: params[:tab])
  end

  def deactivate
    @listing.update(active: false)
    redirect_to dashboard_path(tab: params[:tab])
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :category, :description, :price, :address, photos: [])
    # not including active for creating new, assume it's active as default.
  end

end
