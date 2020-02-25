# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# frozen_string_literal: true
# test capybara
# describe "GET 'index'" do
#     it "should be successful" do
#       user = Factory(:account)
#       visit login_path
#       fill_in "login", :with => account.login
#       fill_in "password", :with => account.password
#       click_button "Log in"
#       get 'index'
#       response.should be_success
#     end
#   end

# RSpec.describe Account, type: :model do
#   let(:empty_account){Account.new}
#   let(:build_account) do
#     Account.new email: Faker::Internet.email,
#                name: Faker::Name.name,
#                password: Faker::String.random(length: 6..12)
#   end

#   before condition: :simulation_account do
#       @thao = Account.create email: "thao@gmail.com", full_name: "Nguyen Thi Ut Thao",
#                          password: "123123"
#       @tai = Account.create email: "tai@gmail.com", full_name: "Pham Anh Tai",
#                           password: "123321"
#       @huy = Account.create email: "huy@gmail.com", full_name: "Ho Minh Huy",
#                          password: "123456"
#       @trung = Account.create email: "trung@gmail.com", full_name: "Do Nam Trung",
#                            password: "123123"
#   end

#   def invalid_string
#     "#{Faker::String.random(length: 100)}"
#   end

#   context "associations" do
#       it {should have_many(:tours).class_name("Tour")}
#       it {should have_many(:reviews).class_name("Review")}
#       it {should have_many(:comments).class_name("Comment")}
#       it {should have_many(:likes).class_name("Like")}
#       it {should have_many(:bookings).class_name("Booking")}
#   end

# context "validates" do
#   # it {should validate_presence_of :name}
#   it {should validate_presence_of :email}
#   it {should allow_value("#{Faker::Internet.email}").for :email}
#   # it {should_not allow_value(invalid_string).for :email}

#   it do
#     should define_enum_for(:role).
#       with_values(admin: 0, user: 1).
#       backed_by_column_of_type(:integer)
#   end

# it "when user is valid" do
#   expect(build_account).to be_valid
# end

#    it "when without name, email, password" do
#      expect(empty_account).to be_invalid
#    end
#  end

#  context "test before_save callback" do
#    it "should return email does not contain CAP letters" do
#      build_account.email = "ABCde@gmail.com"
#      build_account.save
#      build_account.email.should eq("abcde@gmail.com")
#    end
#  end
# end

# describe Account do
#   it "is valid with a name, email" do
#     account = Account.new(name: "Admin account", email: "admin@admin.com")
#     expect(account).to be_valid
#   end

#   it "is notvalid with a name, email is nill" do
#     account = Account.new
#     expect(account).to have(1).error_on(:name)
#   end
# end
# let(:account) {FactoryGirl.create :account}
# subject {account}

# context ".validate :" do
# before {account.save}
# it "has a valid factory" do
#   expect(account).to be_valid
# end

# context "when name empty" do
#   before {account.name = ""}
#   it {expect(account).to_not be_valid}
# end
# context "validates" do
#    it { should validate_presence_of(:name) }
#    it { should validate_uniqueness_of(:name).scoped_to(:tour_id) }
# end
