# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :account
  validates :account_id, presence: true
  validates :tour_id, presence: true
  validates :amount, presence: true, numericality: true

  enum status: { uncheck: 0, accepted: 1, denied: 2, canceled: 3 }
end
