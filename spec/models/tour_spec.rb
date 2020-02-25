require "rails_helper"

RSpec.describe Tour, type: :model do
  describe "Associations" do
    context 'associations' do
    it { should have_many(:reviews).class_name('Review') }
    it { should have_many(:bookings).class_name('Booking') }
    it "belongs to account" do
      should belong_to :account
    end
    it "belongs to category" do
      should belong_to :category
    end
  end

  # describe "Delegate" do
  #   it {should delegate_method(:name).to(:pitch).with_prefix(true)}
  #   it {should delegate_method(:name).to(:subpitch_type).with_prefix(true)}
  # end

  # describe "Validates" do
  #   it {is_expected.to validate_presence_of(:name)}
  #   it {is_expected.to validate_length_of(:name).is_at_most(50)}

  #   it {is_expected.to validate_length_of(:description).is_at_most(255)}

  #   it {is_expected.to validate_presence_of(:price_per_hour)}
  #   it {should validate_numericality_of(:price_per_hour)}

  #   it {is_expected.to validate_presence_of(:size)}
  #   it {is_expected.to validate_length_of(:size).is_at_most(50)}
  # end

  # describe "Scopes" do
  end
end
