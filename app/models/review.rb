class Review < ActiveRecord::Base
  belongs_to :product
  # Each review belongs to a product.
  belongs_to :user
  # Only belongs_to 1 things.

  validates :product, presence: true
  validates :user, presence: true
  validates :description, presence: true
  validates :rating, presence: true

end