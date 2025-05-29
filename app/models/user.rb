class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_one_attached :photo
  validate :photo_presence, on: :create

  validates :address, :first_name, :last_name, presence: true

  private

  def photo_presence
    errors.add(:photo, "must be attached") unless photo.attached?
  end
end
