# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :review
  belongs_to :account
end
