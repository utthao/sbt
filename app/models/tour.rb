class Tour < ApplicationRecord

  belongs_to :account
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :account_id , presence: true
  validates :category_id , presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true
  validates :avg_rate, numericality: true
  validates :rate_amount, numericality: true
  validates :price, presence: true, numericality: true
  validates :start_day, presence: true
  validates :end_day, presence: true
  validate :valid_day
  #validate :validates_images
  accepts_nested_attributes_for :images

  # scope :search, ->(title){where "title LIKE ?", "%#{title}%"}
  # scope :newest, ->{order created_at: :desc}

  enum status: {unvisible: 0, visible: 1}

  private
  def valid_day
    errors.add(:valid_day, "Start day must be bigger than today and smaller than end day") if (start_day>end_day || start_day < Time.zone.today)
  end

  def validates_images
    unless images.present?
      errors.add(:presence_image, "Need image!")
    end
  end
end
