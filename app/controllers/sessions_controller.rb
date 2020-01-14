class SessionsController < ApplicationController

  def new
    return unless logged_in?
    redirect_to root_path
  end

  def create
    account = Account.find_by(email: params[:session][:email].downcase)
    if account && account.authenticate(params[:session][:password])
      log_in account
      redirect_to profile_path
    else
      flash.now[:danger] = t(".create_fail") # Not quite right!
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

