class AccountsController < ApplicationController
  before_action :verify_admin, only: [:index, :destroy]
  # before_action :load_account, except: [:create]

  def index
    @accounts = Account.paginate page: params[:page],  per_page: Settings.size.page
  end

  def show; end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new account_params
    if @account.save
      log_in @account
      flash[:success] = t(".create_account")
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    @account = Account.find_by(params[:id])
    if @account.update_attributes(account_params)
      flash[:success] = t(".edit_account")
      redirect_to @account
    else
      render "edit"
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # def load_account
  #   @account = Account.find_by(params[:id])
  #   return if @account
  #   flash[:error] = t(".content_error")
  #   redirect_to :index
  # end

end
