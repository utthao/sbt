require "rails_helper"

RSpec.describe Booking, type: :model do
  describe "Associations" do
    it "belongs to tour" do
      should belong_to :tour
    end
  end
  describe "Validates" do
    # it {should validate_presence_of(:start_time)}
    # it {should validate_presence_of(:end_time)}
    it {should validate_presence_of(:tour_id)}

    # context "custom validates" do
    #   let!(:booking){FactoryBot.create(:booking)}
    #   it "check status and exist" do
    #     booking.status = 0
    #     booking.save! context: :payment
    #     expect(booking).to have(0).errors
    #   end
    # end
  end
end
