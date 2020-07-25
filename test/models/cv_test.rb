require 'test_helper'

class CvTest < ActiveSupport::TestCase
  test 'about should not exceeded maximum length provided' do
    cv = cvs(:john_cv)
    cv.about = Faker::Lorem.paragraph(256..260)
    assert_not cv.valid?
  end

  test 'full_text_search with full keywords' do
    assert Cv.full_text_search('programming').any?
    assert Cv.full_text_search('cooking').any?
    assert Cv.full_text_search('friendly').any?

    assert Cv.full_text_search('bachelor').any?
    assert Cv.full_text_search('learned').any?
    assert Cv.full_text_search('ETH').any?

    assert Cv.full_text_search('english').any?
    assert Cv.full_text_search('b2').any?
  end

  test 'full_text_search with abbreviations' do
    assert Cv.full_text_search('prog').any?
    assert Cv.full_text_search('ski').any?
    assert Cv.full_text_search('friend').any?

    assert Cv.full_text_search('Ren').any?
    assert Cv.full_text_search('soft').any?
    assert Cv.full_text_search('dev').any?

    assert Cv.full_text_search('york').any?
    assert Cv.full_text_search('united sta').any?
  end

  test 'full_text_search with inexistent keywords' do
    assert_not Cv.full_text_search('guitar').any?
    assert_not Cv.full_text_search('bread').any?
    assert_not Cv.full_text_search('wine').any?
  end
end
