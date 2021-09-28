require 'test_helper'

class CvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
    sign_in(@user)
  end

  test 'GET #show returns a success response' do
    get cv_section_path(@user.subdomain)
    assert_response :success
  end

  test 'only predefined sections can be edited' do
    get edit_cv_section_path(section: 'summary'), xhr: true
    assert_response :success

    get edit_cv_section_path(section: 'personal_info'), xhr: true
    assert_response :redirect
    assert_redirected_to cv_section_path(@user.subdomain)
  end

  test 'cv should only get updated with valid attributes' do
    valid_params = { cv: { about: 'This is a new description' } }
    put cv_path(valid_params), xhr: true
    assert_response :success
    assert_template :update

    about = Faker::Lorem.paragraph(256..260)
    invalid_params = { cv: { about: about } }
    put cv_path(invalid_params), xhr: true
    assert_response :success
    assert_template 'cvs/errors'
  end

  # accessibility tests

  test 'logged in user can only read other user\'s published Cvs' do
    # logged in as john
    other_cv = cvs(:john_cv_2)
    other_user = other_cv.user

    # can read other user's published cv
    get cv_section_path(other_user.subdomain)
    assert_response :success

    other_cv.published = false
    other_cv.save!

    # cannot read other user's unpublished cv
    get cv_section_path(other_user.subdomain)
    assert_response :redirect
  end

  test 'guest user can only read published Cvs' do
    logout
    cv = cvs(:john_cv_2)
    user = cv.user

    # can read user's published cv
    get cv_section_path(user.subdomain)
    assert_response :success

    cv.published = false
    cv.save!

    # cannot read user's unpublished cv
    get cv_section_path(user.subdomain)
    assert_response :redirect
  end

  test 'Cv can only be modified by its owner' do
    get edit_cv_section_path(section: 'summary'), xhr: true
    assert_response :success

    logout
    get edit_cv_section_path(section: 'summary'), xhr: true
    assert_response :redirect
  end
end
