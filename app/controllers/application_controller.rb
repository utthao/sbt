class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  # before_action :authenticate_account!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include SessionsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: Account::DATA_TYPE_ACCOUNTS)
  end

end
