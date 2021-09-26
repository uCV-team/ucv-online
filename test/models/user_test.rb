require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:john)
  end

  test 'first_name should be present' do
    @user.first_name = ''
    assert_not @user.valid?
  end

  test 'last_name should be present' do
    @user.last_name = ''
    assert_not @user.valid?
  end

  test 'subdomain should be present' do
    @user.subdomain = ''
    assert_not @user.valid?
  end

  test 'subdomain should get created' do
    user = User.create(
      first_name: 'AbCdEf',
      last_name: 'xyz',
      email: 'abc@example.com',
      password: 'password'
    )
    assert user.valid?
    assert user.subdomain.present?
  end
end
