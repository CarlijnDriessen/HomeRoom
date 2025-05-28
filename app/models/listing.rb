class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :photos, presence: true, length: { minimum: 3, message: "You must attach atleast 3 photos" }
  validates :photos, length: { maximum: 5, message: "You can attach a maximum of 5 photos" }
  validates :title, :category, :description, :price, presence: true
  validates :description, length: { minimum: 120, too_short: "%{count} characters is the minimum required" }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
