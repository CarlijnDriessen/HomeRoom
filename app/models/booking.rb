class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :accepted, :booking_date, presence: true
end
