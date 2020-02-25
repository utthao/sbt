# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tours, dependent: :destroy
  validates :name, presence: true, length: { maximum: 140 }, uniqueness: { case_sensitive: false }
  enum status: { unvisible: 0, visible: 1 }
end
