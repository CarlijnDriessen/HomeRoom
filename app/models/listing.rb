class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, :category, :description, :price, presence: true
  validates :description, length: { minimum: 120, too_short: "%{count} characters is the minimum required" }
end
