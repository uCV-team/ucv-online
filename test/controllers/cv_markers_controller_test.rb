require 'test_helper'

class CvMarkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
    sign_in(@user)
  end
  test 'only published cvs within bounds to be shown' do
    id = @user.cv.id
    subdomain = @user.subdomain
    get cv_markers_path, params: { bounds: '[45, -79, 35, -69 ]' }

    data = JSON.parse(@response.body)
    valid_id = data['features'][0]['properties']['id']
    valid_subdomain = data['features'][0]['properties']['subdomain']

    assert_equal valid_id, id
    assert_equal valid_subdomain, subdomain

    assert_response :success
  end
end
