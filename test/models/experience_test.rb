require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
  setup do
    @experience = experiences(:john_experience)
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
    @experience.website_url = '.mydomain'
    assert_not @experience.valid?
  end
  

  test 'website protocol is automatically added' do
    @experience.website_url = 'mydomain.tld'
    assert @experience.valid?
    assert @experience.website_url.start_with?('http')
  end
end
