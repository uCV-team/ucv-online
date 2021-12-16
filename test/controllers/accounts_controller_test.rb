require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test 'get #destroy to delete account' do
    user = users(:john)
    passwordless_sign_in(user)
    assert_difference('User.count', -1) do
      assert_difference('Cv.count', -1) do
        delete account_path(user)
      end
    end
    assert_response :redirect
    assert_redirected_to root_path
  end
end
