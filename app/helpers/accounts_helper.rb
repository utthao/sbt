module AccountsHelper

  def current_bookings(id)
    @bookings = Booking.where(status: 1).where(account_id: id).count
  end

  def edit_account_active_status
    [{id: 0, name: t("disable")},
     {id: 1, name: t("active")}]
  end

  def check_current_login(id)
    return true if current_account.id == id
  end
end
