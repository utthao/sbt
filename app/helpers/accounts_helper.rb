# frozen_string_literal: true

module AccountsHelper
  def current_bookings(id)
    @bookings = Booking.where(status: 1).where(account_id: id).count
  end

  def edit_account_active_status
    [{ id: 0, name: t('disable') },
     { id: 1, name: t('active') }]
  end

  def check_current_login(id)
    return true if current_account.id == id
  end

  def account_owner(id)
    if account_signed_in?
      if current_account.admin? || current_account.id == id
      else
        flash[:danger] = t('no_permit')
        redirect_to root_url
      end
    else
      flash[:danger] = t('no_permit')
      redirect_to root_url
    end
  end

  def gravatar_for(account, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(account.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: account.name, class: 'gravatar')
  end
end
