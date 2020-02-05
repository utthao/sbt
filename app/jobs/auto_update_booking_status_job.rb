class AutoUpdateBookingStatusJob < ApplicationJob
  queue_as :auto_update_booking_status_job

  def perform(id)
      booking = Booking.find_by id: id
      if booking.status == "uncheck"
        booking.status = "denied"
        booking.save
      end
  end
end
