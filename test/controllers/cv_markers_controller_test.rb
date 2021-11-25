require 'test_helper'

class CvMarkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
    sign_in(@user)
  end
  test 'only published cvs within bounds to be shown' do
    get cv_markers_path, params: { bounds: '[45, -79, 35, -69 ]' }

    data = JSON.parse(@response.body)
    assert_equal 3, data['data'].count

    assert_response :success
  end
end
