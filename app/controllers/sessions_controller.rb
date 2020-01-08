class SessionsController < ApplicationController
  def index; end

  def create
    account = Account.find_by(email: params[:session][:email].downcase)
    if account && account.authenticate(params[:session][:password])
      if account.active_status==1
        log_in account
        params[:session][:remember_me] == '1' ? remember(account) : forget(account)
        redirect_back_or account
      else
        message  = t "accounts.accnotactived"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
