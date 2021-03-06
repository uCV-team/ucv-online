require_relative 'boot'

require 'rails/all'
require_relative '../app/middleware/domain_redirection'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ucv
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # config.load_defaults 7.0

    config.time_zone = 'Rome'
    config.i18n.default_locale = :en
    config.i18n.available_locales = %i[en it]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # config.action_mailer.default_url_options = { host: ENV['APP_HOST'], port: ENV['APP_PORT'] }
    config.active_record.schema_format = :sql
    # Configuration for the application, engines, and railties goes here.
    config.middleware.use DomainRedirection
    config.asset_host = ENV['SERVER_URL']

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.

    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
