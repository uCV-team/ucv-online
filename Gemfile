source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
# ruby File.read('.ruby-version')

gem 'bootsnap', '>= 1.1.0', require: false
gem 'cancancan'
gem 'devise'
gem 'devise-i18n'
gem 'figaro'
gem 'friendly_id', '~> 5.4.0'
gem 'geocoder'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pg_search'
gem 'puma', '~> 4.3'
gem 'rails', '~> 7.0'
gem 'rails-i18n'
# gem 'slim-rails'
gem 'paperclip', git: 'https://github.com/Corsidia/paperclip', branch: 'rails-7-fixes'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker'
# Amazon S3
gem 'aws-sdk-s3'
gem 'kaminari'
gem 'maxminddb' # GeoLite2 City database for local IP geocoding
# Basic functionality
gem 'mailgun-ruby', '~>1.2.0'
gem 'recaptcha'
# PDF generation
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary-edge'
# editor
gem 'trix-rails', require: 'trix'
# Email unsubscribe
gem 'mailkick'
gem 'postmark-spam_check'

gem 'jsonapi-serializer'
gem 'money-rails', '~>1.12'
gem 'passwordless'
gem 'rack-attack'
gem 'rack-cors'
gem 'rack-timeout'
gem 'scenic'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'i18n-tasks', '~> 0.9.31'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 3.0'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'brakeman', require: false
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'reek', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'scss_lint', require: false
  gem 'slim_lint', require: false
end

group :test do
  gem 'capybara'
  gem 'capybara-selenium'
  gem 'factory_bot_rails'
  gem 'minitest-reporters', '~> 1.0.5'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :production do
  gem 'lograge'
  gem 'newrelic_rpm'
  gem 'wkhtmltopdf-heroku'
  # Error notification
  gem 'sentry-rails'
  gem 'sentry-ruby'
end
gem 'faker'
gem 'temple'
