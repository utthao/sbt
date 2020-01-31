class BookingNotiMailer < ApplicationMailer
  def booking_accepted(account, tour_title, tour_date)
    @account = account
    mail to: account.email, subject: t("booking.accepted")
  end

  def booking_denied(account, tour_title, tour_date)
    @account = account
    mail to: account.email, subject: t("booking.denied")
  end

end
