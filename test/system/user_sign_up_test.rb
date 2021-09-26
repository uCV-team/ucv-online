require 'test_helper'

class UserSignUpTest < ApplicationSystemTestCase
  driven_by :selenium_chrome_headless

  setup do
    @user = users(:john)
  end

  test 'user can sign up' do
    manual_sign_up
    assert_current_path cv_section_path(User.last.subdomain)
  end
end
