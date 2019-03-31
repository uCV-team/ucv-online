Rails.application.configure do
  # Verifies that versions and hashed value of the package contents in the project's package.json
  config.webpacker.check_yarn_integrity = false
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = false
  config.active_storage.service = :local
  config.force_ssl = true
  config.log_level = :warn
  config.log_tags = [:request_id]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  # Paperclip config
  if ENV['AWS_S3_BUCKET_NAME']
    options = {
      storage: :s3,
      s3_protocol: 'https',
      bucket: ENV['AWS_S3_BUCKET_NAME'],
      s3_credentials: {
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        s3_signature_version: :v4
      },
      s3_region: ENV['AWS_REGION'],
      AWS_HOST_NAME: ENV['AWS_HOST_NAME'],
      path: ':class/:attachment/:id_partition/:style/:filename'
    }
    if ENV['AWS_ALIAS'].present?
      options[:s3_host_alias] = ENV['AWS_ALIAS'] # images.corsidia.com
      options[:url] = ':s3_alias_url'
    end
    config.paperclip_defaults = options
  end
end
