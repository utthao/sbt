class Category < ApplicationRecord
  has_many :tours, dependent: :destroy
  validates :name , presence: true, length: { maximum: 140 }
  enum status: {actived: 0, inactive: 1}
end
