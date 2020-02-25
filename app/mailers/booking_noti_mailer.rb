# frozen_string_literal: true

class BookingNotiMailer < ApplicationMailer
  def booking_accepted(account, _tour_title, _tour_date)
    @account = account
    mail to: account.email, subject: t('booking.accepted')
  end

  def booking_denied(account, _tour_title, _tour_date)
    @account = account
    mail to: account.email, subject: t('booking.denied')
  end
end
