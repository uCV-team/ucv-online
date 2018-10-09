require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Publicv
  class Application < Rails::Application
    config.load_defaults 5.2

    config.time_zone = 'Zurich'
    config.i18n.default_locale = :en
    config.action_mailer.default_url_options = { host: ENV['APP_HOST'], port: ENV['APP_PORT'] }
  end
end
