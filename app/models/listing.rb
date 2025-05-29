class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :photos, presence: true, length: { minimum: 3, message: "You must attach atleast 3 photos" }
  validates :photos, length: { maximum: 5, message: "You can attach a maximum of 5 photos" }
  validates :title, :category, :description, :price, presence: true
  validates :description, length: { minimum: 120, too_short: "%{count} characters is the minimum required" }
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validate :address_must_be_valid, presence

  private

  def address_must_be_valid
    if will_save_change_to_address?
      geocoded = Geocoder.search(address)
      if geocoded.empty?
        errors.add(:address, "Please enter a valid address")
      else
        result = geocoded.first
        if result.latitude.nil? || result.longitude.nil?
          errors.add(:address, "Please enter a valid address")
        elsif result.types.include?("country") || result.types.include?("administrative_area_level_1")
          errors.add(:address, "Please enter a more specific address")
        elsif result.latitude < -90 || result.latitude > 90 || result.longitude < -180 || result.longitude > 180
          errors.add(:address, "Please enter a valid address.")
        end
      end
    end
  end
end
