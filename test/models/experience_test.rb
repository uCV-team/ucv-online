require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
  setup do
    @experience = experiences(:experience)
  end

  test 'company should be present' do
    @experience.company = ''
    assert_not @experience.valid?
  end

  test 'title should be present' do
    @experience.title = ''
    assert_not @experience.valid?
  end

  test 'website url should be valid' do
    @experience.website_url = 'http://.mydomain.com'
    assert_not @experience.valid?
  end
end
