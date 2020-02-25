# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module HelloApp
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = %i[en vi]
    config.i18n.default_locale = :vi

    config.active_job.queue_adapter = :delayed_job
    config.exceptions_app = routes
  end
end
