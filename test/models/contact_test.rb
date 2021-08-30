require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  setup do
    @contact = contacts(:contact)
    @user = users(:john)
  end

  test 'name should be present' do
    @contact.name = ''
    assert_not @contact.valid?
  end

  test 'email should be valid' do
    @contact.email = 'john//example.com'
    assert_not @contact.valid?
  end

  test 'update status to spam' do
    valid_params = {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      message: 'hello user. this is our email- respond@gmail.com',
      user_id: @user.id
    }
    new_contact = Contact.create(valid_params)
    assert_equal 'spam', new_contact.status
  end
end
