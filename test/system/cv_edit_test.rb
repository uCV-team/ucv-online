require 'test_helper'

class CvEditTest < ApplicationSystemTestCase
  driven_by :selenium_chrome_headless

  setup do
    @user = users(:john)
  end

  test 'User can see edit controls for Cv after login' do
    passwordless_sign_in(@user)

    visit cv_section_path(@user.subdomain)
    assert page.has_link?('Preview')
    assert page.has_link?('Unpublish')
  end

  test 'User can\'t see edit controls when Cv is in preview mode' do
    passwordless_sign_in(@user)

    visit cv_section_path(@user.subdomain)
    click_link('Preview')
    refresh
    assert_not page.has_link?('Preview')
    assert_not page.has_link?('Unpublish')
  end

  test 'Guest or other users(not owner) cannot see edit controls for Cv' do
    passwordless_sign_in(users(:john_user2))

    visit cv_section_path(@user.subdomain)
    assert_not page.has_link?('Preview')
    assert_not page.has_link?('Unpublish')

    passwordless_sign_out # for guest user
    visit cv_section_path(@user.subdomain)
    assert_not page.has_link?('Preview')
    assert_not page.has_link?('Unpublish')
  end
end
