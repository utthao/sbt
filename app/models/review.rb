# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :account
  belongs_to :tour
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  enum status: { unvisible: 0, visible: 1 }
end
