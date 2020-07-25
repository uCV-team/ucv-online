require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  setup do
    @contact = contacts(:contact)
  end

  test 'name should be present' do
    @contact.name = ''
    assert_not @contact.valid?
  end

  test 'email should be valid' do
    @contact.email = 'john//example.com'
    assert_not @contact.valid?
  end
end
