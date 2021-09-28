require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
    sign_in(@user)
  end

  test 'GET #new returns a success response' do
    get new_message_path, params: { message: { user_id: @user.id } }, xhr: true
    assert_response :success
  end

  test 'messages should only get created with valid attributes' do
    valid_params = { message: {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      content: Faker::Lorem.paragraph,
      user_id: @user.id
    } }
    assert_difference('Message.count') do
      post messages_path(valid_params)
    end
    assert_response :redirect
    assert_redirected_to cv_section_path(@user.subdomain)

    invalid_params = { message: {
      name: nil,
      email: nil,
      content: nil,
      user_id: @user.id
    } }
    assert_no_difference('Message.count') do
      post messages_path(invalid_params)
    end
    assert_response :redirect
    assert_redirected_to cv_section_path(@user.subdomain)
  end
end
