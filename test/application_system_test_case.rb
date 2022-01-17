require 'test_helper'
require 'support/i18n_helpers'
require 'support/wait_for_ajax'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include I18nHelpers
  include WaitForAjax

  Rack::Attack.enabled = false # disabling protection against brute-force attacks

  private

  def manual_sign_up
    visit new_users_registrations_path
    within(:css, 'form#new_user') do
      fill_in('user_first_name', with: 'newUser')
      fill_in('user_last_name', with: Faker::Name.last_name)
      fill_in('user_email', with: 'example@reply.com')
      click_button('register_user')
    end
  end
end
