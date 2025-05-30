class PagesController < ApplicationController

  def dashboard
    @listings = current_user.listings # Fetch all listings created by the current user
    @active_listings = current_user.listings.where(active: true) # Fetch active listings created by the current user
    @inactive_listings = current_user.listings.where(active: false) # Fetch inactive listings created by the current user

    @guest_pending_bookings = current_user.bookings.where(accepted: nil) # Fetch pending bookings made by the current user
    @guest_accepted_bookings = current_user.bookings.where(accepted: true) # Fetch accepted bookings made by the current user
    @guest_rejected_bookings = current_user.bookings.where(accepted: false) # Fetch rejected bookings made by the current user

    @host_pending_bookings = Booking.where(listing: @active_listings, accepted: nil) # Fetch pending bookings for active listings where the current user is the host
    @host_accepted_bookings = Booking.where(listing: @active_listings, accepted: true) # Fetch accepted bookings for active listings where the current user is the host
    @host_rejected_bookings = Booking.where(listing: @active_listings, accepted: false) # Fetch rejected bookings for active listings where the current user is the host

    @active_tab = params[:tab] || 'guest'
  end

  def past_bookings
    @past_bookings = current_user.bookings.where("booking_date < ?", Date.today)
    @review = Review.new
    @listing = @review.listing
  end
end
