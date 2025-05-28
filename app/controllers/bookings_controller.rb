class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :accept, :reject]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.listing = @listing
    if @booking.save
      redirect_to listing_path(@listing), notice: 'Booking was successfully created.'
    else
      redirect_to listing_path(@listing), notice: 'Booking failed to create.'
    end
  end

  def edit
    @listing = @booking.listing
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path, notice: 'Booking was successfully updated.'
    else
      render :edit, alert: 'Error updating booking.'
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully deleted.'
  end

  def accept
    @booking.update(accepted: true)
    redirect_to dashboard_path(tab: params[:tab])
  end

  def reject
    @booking.update(accepted: false)
    redirect_to dashboard_path(tab: params[:tab])
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:comment, :booking_date)
  end

end
