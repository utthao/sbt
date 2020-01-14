module SessionsHelper

  def log_in account
    session[:account_id] = account.id
  end

  def current_account
    if session[:account_id]
      @current_account ||= Account.find_by(id: session[:account_id])
    end
  end

  def logged_in?
    session[:account_id].present?
  end

  def log_out
    session.delete(:account_id)
    @current_account = nil
  end

  def check_is_admin?
    current_account && current_account.admin?
  end
end
