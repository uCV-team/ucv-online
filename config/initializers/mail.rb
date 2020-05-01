ActionMailer::Base.default_options = {
  from: ENV['MAIL_FROM'],
  reply_to: ENV['MAIL_REPLY_TO']
}
# ActionMailer::Base.default_url_options = { host: ENV['APP_HOST'], port: ENV['APP_PORT'] }

if Rails.env.development?
  ActionMailer::Base.delivery_method = :letter_opener
  ActionMailer::Base.raise_delivery_errors = true
elsif Rails.env.test?
  ActionMailer::Base.delivery_method = :test
  ActionMailer::Base.raise_delivery_errors = true
elsif Rails.env.production?
  ActionMailer::Base.delivery_method = :mailgun
  ActionMailer::Base.mailgun_settings = {
    api_key: ENV['MAILGUN_API_KEY'],
    domain: ENV['MAILGUN_DOMAIN'],
    api_host: 'api.eu.mailgun.net' # Uncomment this line for EU region domains
  }
  # smtp_settings = {
  #   address: ENV['MAIL_HOST'],
  #   port: 587,
  #   alternative_port: 2525,
  #   domain: ENV['MAIL_DOMAIN'],
  #   user_name: ENV['MAIL_USERNAME'],
  #   password: ENV['MAIL_PASSWORD'],
  #   authentication: 'login',
  #   enable_starttls_auto: true
  # }
else # staging and other envs
  ActionMailer::Base.delivery_method = :letter_opener
  ActionMailer::Base.raise_delivery_errors = true
end
