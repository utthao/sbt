class Review < ApplicationRecord
  belongs_to :account
  belongs_to :tour
  has_many :comments, dependent: :destroy
end
