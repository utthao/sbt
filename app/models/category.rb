class Category < ApplicationRecord
  has_many :tours, dependent: :destroy
  validates :name , presence: true, length: { maximum: 140 }
end
