require 'test_helper'

class UserSignInTest < ApplicationSystemTestCase
  driven_by :selenium_chrome_headless

  setup do
    @user = users(:john)
  end

  test 'user can sign_in' do
    passwordless_sign_in(@user)
    assert_current_path root_path
  end
end
