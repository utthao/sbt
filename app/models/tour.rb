class Tour < ApplicationRecord
  before_create :valid_day

  belongs_to :account
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :images
  validates :account_id , presence: true
  validates :category_id , presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :price, presence: true, numericality: true
  validates :start_day, presence: true
  validates :end_day, presence: true
  accepts_nested_attributes_for :images

  enum status: {unvisible: 0, visible: 1}

  def valid_day
    errors.add(:valid_day, "Start day must be bigger than today and smaller than end day") if start_day>end_day || start_day < Time.zone.today
  end
end
