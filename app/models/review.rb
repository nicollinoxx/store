class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :email, :description, presence: true
end
