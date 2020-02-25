# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    account = Account.find_by(email: params[:account][:email].downcase)
    if account&.valid_password?(params[:account][:password])
      if account.active_status == 1
        super
      else
        message = t 'accnotactived'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to new_account_session_path
    end
  end

  def update
    super
  end

  def destroy
    super
  end
end
