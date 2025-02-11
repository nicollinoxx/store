class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :email, :description, presence: true

  validates_uniqueness_of :user_id, scope: :product_id
end
