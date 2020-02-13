class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_locale
   locale = params[:locale].to_s.strip.to_sym
   I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
