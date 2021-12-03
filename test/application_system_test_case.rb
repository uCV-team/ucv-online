require 'test_helper'
require 'support/i18n_helpers'
require 'support/wait_for_ajax'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers
  include I18nHelpers
  include WaitForAjax

  Rack::Attack.enabled = false # disabling protection against brute-force attacks

  private

  def manual_sign_in(email, password = 'supersecret')
    visit new_user_session_url
    within(:css, '#new_user') do
      fill_in('user_email', with: email)
      fill_in('user_password', with: password)
      click_button('user_log_in')
    end
  end

  def manual_sign_up
    visit new_user_registration_path
    within(:css, 'form#new_user') do
      fill_in('user_first_name', with: 'newUser')
      fill_in('user_last_name', with: Faker::Name.last_name)
      fill_in('user_email', with: 'example@reply.com')
      fill_in('user_password', with: 'secretpassword')
      fill_in('user_password_confirmation', with: 'secretpassword')
      click_button('register_user')
    end
  end
end
