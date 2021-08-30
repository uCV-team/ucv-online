require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
    sign_in(@user)
  end

  test 'GET #new returns a success response' do
    get new_contact_path, params: { contact: { user_id: @user.id } }, xhr: true
    assert_response :success
  end

  test 'contacts should only get created with valid attributes' do
    valid_params = { contact: {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      message: Faker::Lorem.paragraph,
      user_id: @user.id
    } }
    assert_difference('Contact.count') do
      post contacts_path(valid_params)
    end
    assert_response :redirect
    assert_redirected_to cv_section_path(@user.subdomain)

    invalid_params = { contact: {
      name: nil,
      email: nil,
      message: nil,
      user_id: @user.id
    } }
    assert_no_difference('Contact.count') do
      post contacts_path(invalid_params)
    end
    assert_response :redirect
    assert_redirected_to cv_section_path(@user.subdomain)
  end
end
