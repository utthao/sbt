class Tour < ApplicationRecord
  belongs_to :account
  belongs_to :category
  has_many :reviews, dependent: :destroy
  validates :account_id , presence: true
  validates :category_id , presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :price, presence: true, numericality: true
  validates :start_day, presence: true
  validates :end_day, presence: true
  validate :valid_day

  def valid_day
    errors.add(:valid_day, "Start day must be bigger than today and smaller than end day") if start_day>end_day || start_day < Time.zone.today
  end
end
