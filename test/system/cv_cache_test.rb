require 'test_helper'

class CvCacheTest < ApplicationSystemTestCase
  driven_by :selenium_chrome_headless

  setup do
    @user = users(:john)
  end

  test 'Cache displays CV correctly for edit, preview and show mode' do
    passwordless_sign_in(@user)

    visit cv_section_path(@user.subdomain)
    assert page.has_link?('Preview')
    assert page.has_link?('Unpublish')

    click_link('Preview')
    refresh

    assert page.has_link?('Exit preview')
    passwordless_sign_out

    visit cv_section_path(@user.subdomain)
    assert page.has_link?("Contact #{@user.first_name}")
    assert_not page.has_link?('Preview')
  end

  test 'Updated education is displayed instead of cached CVs education' do
    passwordless_sign_in(@user)

    visit cv_section_path(@user.subdomain)
    assert_text 'Learned a lot'

    @user.cv.educations.first.update(description: 'Studied about computers')
    refresh

    # Check whether the updated description is visible on CV show page
    # and not the description of eduction which is cached.
    assert_text 'Studied about computers'
  end

  test 'Updated experience is displayed instead of cached CVs experience' do
    passwordless_sign_in(@user)

    visit cv_section_path(@user.subdomain)
    assert_text 'Innovative software solutions'

    @user.cv.experiences.last.update(description: 'Digital marketing specialist')
    refresh

    # Check whether the updated description is visible on CV show page
    # and not the description of experience which is cached.
    assert 'Digital marketing specialist'
  end

  test 'Updated language is displayed instead of cached CVs language' do
    passwordless_sign_in(@user)

    visit cv_section_path(@user.subdomain)
    assert page.has_content?('B2')

    @user.cv.languages.last.update(level: 'c1')
    refresh

    # Check whether the updated description is visible on CV show page
    # and not the description of language which is cached.
    assert page.has_content?('C1')
  end
end
