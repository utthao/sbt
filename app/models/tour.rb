class Tour < ApplicationRecord
  belongs_to :account
  belongs_to :category
  has_many :reviews, dependent: :destroy
  validates :account_id , presence: true
  validates :category_id , presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :price, presence: true, numericality: true
  # validates :start_day, presence: true, datatype: :datetime
  # validates :end_day, presence: true, datatype: :datetime
end
