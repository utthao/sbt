class AdminsController < ApplicationController
  layout "admins"
  before_action :logged_in_user, :check_is_admin

  def new; end
end
