require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  setup do
    @message = messages(:message)
    @user = users(:john)
  end

  test 'name should be present' do
    @message.name = ''
    assert_not @message.valid?
  end

  test 'email should be valid' do
    @message.email = 'john//example.com'
    assert_not @message.valid?
  end

  test 'update status to spam' do
    valid_params = {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      content: 'hello user. this is our email- respond@gmail.com',
      user_id: @user.id
    }
    new_message = Message.create(valid_params)
    assert_equal 'spam', new_message.status
  end
end
