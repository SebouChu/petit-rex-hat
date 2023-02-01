require "test_helper"

class Users::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  def test_update
    sign_in(seb)
    assert_equal "SebouChu", seb.nickname
    put user_registration_url, params: { user: { nickname: "Sebou", current_password: "aVeryS3cureP4ssw0rd!" } }
    assert_redirected_to(root_url)
    assert_equal "Sebou", seb.reload.nickname
  end
end
