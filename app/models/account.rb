class Account < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  VALID_PHONE_REGEX = /\A[\d]{10,}\z/i.freeze

  attr_accessor :remember_token, :activation_token, :reset_token

  has_many :tours, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.name_in_users_max}
  validates :email, presence: true,
    length: {maximum: Settings.email_in_users_max},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :phone_number, format: {with: VALID_PHONE_REGEX}, allow_blank: true
  has_secure_password
  validates :password, presence: true, length:
    {minimum: Settings.password_min}, allow_nil: true
  validates :password, presence: true, length:
    {minimum: Settings.password_min}, on: :reset_password
  enum role: {admin: 0, user: 1}

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = Account.new_token
    update_attribute(:remember_digest, Account.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
