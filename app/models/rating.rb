class Rating < ApplicationRecord
  belongs_to :tour
  belongs_to :account
end
