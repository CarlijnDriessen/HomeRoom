class Review < ApplicationRecord
  belongs_to :listing

  validates :comment, :rating, presence: true
  validates :rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :rating, numericality: { only_integer: true, message: "must be a number" }
end
