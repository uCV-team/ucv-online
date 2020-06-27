require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  setup do
    @language = languages(:english)
  end

  test 'language should be present' do
    @language.language = ''
    assert_not @language.valid?
  end

  test 'level should only include pre defined CEFR_LEVELS' do
    @language.level = 'ab1'
    assert_not @language.valid?
  end
end
