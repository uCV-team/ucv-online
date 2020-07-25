require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  setup do
    @location = locations(:new_york)
  end

  test 'original address should be present' do
    @location.original_address = ''
    assert_not @location.valid?
  end

  # test 'radius should be greater than or equal to 0' do
  #   @location.radius = -1
  #   assert_not @location.valid?
  # end
end
