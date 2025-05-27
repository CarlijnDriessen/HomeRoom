class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :booking_date, presence: true
end
