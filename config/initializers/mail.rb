ActionMailer::Base.default_options = {
  from: ENV['MAIL_FROM'],
  reply_to: ENV['MAIL_REPLY_TO']
}
if Rails.env.production?
  ActionMailer::Base.raise_delivery_errors = false # temp
  # ActionMailer::Base.delivery_method = :mailgun
  # ActionMailer::Base.mailgun_settings = {
  #   api_key: ENV['MAILGUN_API_KEY'],
  #   domain: ENV['MAILGUN_DOMAIN'],
  #   api_host: 'api.eu.mailgun.net' # Uncomment this line for EU region domains
  # }
  # ActionMailer::Base.smtp_settings = {
  #  port: '587',
  #  address: 'smtp.sendgrid.net',
  #  user_name: ENV['SENDGRID_USERNAME'],
  #  password: ENV['SENDGRID_PASSWORD'],
  #  domain: 'advodental.com',
  #  authentication: :plain
  # }
elsif Rails.env.test?
  ActionMailer::Base.delivery_method = :test
  ActionMailer::Base.raise_delivery_errors = true
else
  ActionMailer::Base.delivery_method = :letter_opener
  ActionMailer::Base.raise_delivery_errors = true
end
