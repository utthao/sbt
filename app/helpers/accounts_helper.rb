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

   # Returns the Gravatar for the given user.
  def gravatar_for(account,  options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(account.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: account.name, class: "gravatar")
  end
end
