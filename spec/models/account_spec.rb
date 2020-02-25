# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:empty_account){Account.new}
  let(:build_account) do
    Account.new email: Faker::Internet.email,
               name: Faker::Name.name,
               password: Faker::String.random(length: 6..12)
  end


  before condition: :simulation_account do
      @thao = Account.create email: "thao@gmail.com", full_name: "Nguyen Thi Ut Thao",
                         password: "123123"
      @tai = Account.create email: "tai@gmail.com", full_name: "Pham Anh Tai",
                          password: "123321"
      @huy = Account.create email: "huy@gmail.com", full_name: "Ho Minh Huy",
                         password: "123456"
      @trung = Account.create email: "trung@gmail.com", full_name: "Do Nam Trung",
                           password: "123123"
  end

  def invalid_string
    "#{Faker::String.random(length: 100)}"
  end

  context 'associations' do
    it { should have_many(:tours).class_name('Tour') }
    it { should have_many(:reviews).class_name('Review') }
    it { should have_many(:comments).class_name('Comment') }
    it { should have_many(:likes).class_name('Like') }
    it { should have_many(:bookings).class_name('Booking') }
  end

  context 'validates' do
    # it {should validate_presence_of :name}
    # it {should validate_length_of(:name).is_at_most(Settings.name_in_users_max)}
    it {should allow_value("#{Faker::Name.name}").for :name}
    # it {should_not allow_value("Somthing look like 💩").for :name}
    it {should validate_presence_of :email}
    # it {should validate_uniqueness_of(:email).scoped_to(:provider).case_insensitive}
    it {should validate_length_of(:email).is_at_most(Settings.email_in_users_max)}
    it {should allow_value("#{Faker::Internet.email}").for :email}
    # it {should_not allow_value(invalid_string).for :email}
    # it {should validate_uniqueness_of(:uid).scoped_to(:provider).allow_nil}
    it {should validate_presence_of(:password).allow_nil}
    it {should validate_presence_of(:password).on(:reset_password)}
    it {should validate_length_of(:password).is_at_least(Settings.password_min)}
    it {should validate_length_of(:password).is_at_least(Settings.password_min).on(:reset_password)}
    # it {should have_secure_password}
    # it {should validate_numericality_of(:wallet).is_greater_than_or_equal_to(0).allow_nil}
    # it {should allow_value(Faker::Number.number(digits: Faker::Number.within(range: 10..20))).for :phone}
    # it {should allow_value(nil).for :phone}
    # it {should_not allow_value(Faker::Alphanumeric.alpha(number: 1..20)).for :phone}
    # it {should_not allow_value(Faker::Number.number(digits: Faker::Number.within(range: 1..9))).for :phone}
    it do
      should define_enum_for(:role).
        with_values(admin: 0, user: 1).
        backed_by_column_of_type(:integer)
    end

    # it "when account is valid" do
    #   expect(build_account).to be_valid
    # end

     it "when without name, email, password" do
      expect(empty_account).to be_invalid
    end

    # context "test before_save callback" do
    #   it "should return email does not contain CAP letters" do
    #     build_account.email = "ABCde@gmail.com"
    #     build_account.save
    #     build_account.email.should eq("abcde@gmail.com")
    #   end
    # end

    # context ".digest + .new_token" do
    #   it "should be digest of token" do
    #     token = Account.new_token
    #     token_digest = Account.digest token
    #     BCrypt::Password.new(token_digest).is_password?(token).should eq true
    #   end
    # end

    # context "#remember" do
    #   it "should update correct remember_token" do
    #     build_account.remember
    #     token = build_account.remember_token
    #     digest = build_account.remember_digest
    #     BCrypt::Password.new(digest).is_password?(token).should eq true
    #   end
    # end

  # context "#authenticated?" do
  #   it "return true with correct token and digest" do
  #     token = SecureRandom.urlsafe_base64
  #     build_account.activation_digest = User.digest token
  #     build_account.authenticated?(:activation, token).should eq true
  #   end
  # end

  # context "#forget" do
  #   it do
  #     build_account.remember_digest = "abc"
  #     build_account.forget
  #     build_account.remember_digest.should eq nil
  #   end
  # end

  # context "#activate" do
  #   it "should return true" do
  #     build_account.activate.should eq true
  #   end
  # end

  # context "#send_activation_email" do
  #   it "should send one email" do
  #     build_account.activation_token = "abc"
  #     expect {build_account.send_activation_email}.to change {ActionMailer::Base.deliveries.count}.by 1
  #   end
  # end

  # context "#send_password_reset_email" do
  #   it "should send one email" do
  #     build_account.reset_token = "abc"
  #     expect {build_account.send_password_reset_email}.to change {ActionMailer::Base.deliveries.count}.by 1
  #   end
  # end

  # context "#create_reset_digest" do
  #   it {build_account.create_reset_digest.should eq true}
  # end

  # context "#password_reset_expired?" do
  #   it "return true when timeout" do
  #     build_account.reset_sent_at = (Settings.timeout_reset_password + 1).hours.ago
  #     build_account.password_reset_expired?.should eq true
  #   end

  #   it "return false when timein" do
  #     build_account.reset_sent_at = (Settings.timeout_reset_password - 1).hours.ago
  #     build_account.password_reset_expired?.should eq false
  #   end
  # end

  # context "#create_activation_digest" do
  #   it "should has activation_token attribute" do
  #     build_account.send :create_activation_digest
  #     build_account.activation_token.should_not be_empty
  #   end

  #   it "should has activation_digest attribute" do
  #     build_account.send :create_activation_digest
  #     build_account.activation_digest.should_not be_empty
  #   end
  # end
  end
end
