# frozen_string_literal: true

Devise.setup do |config|
  config.mailer = 'DeviseMailer'
  config.secret_key = ENV['SECRET_KEY_BASE']
  config.mailer_sender = ENV['MAIL_FROM']
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.pepper = ENV['SECRET_KEY_BASE']
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.timeout_in = 30.minutes
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.allow_unconfirmed_access_for = 1.day
end
