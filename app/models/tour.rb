class Tour < ApplicationRecord
  belongs_to :account
  belongs_to :categorie
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :rattings, dependent: :destroy
  has_many :images, dependent: :destroy
end
