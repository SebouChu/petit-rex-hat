require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  def test_home_as_anonymous
    get root_url
    assert_redirected_to(new_user_session_url)
  end

  def test_home_as_signed_in
    sign_in(seb)
    get root_url
    assert_response :success
  end
end
