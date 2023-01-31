require "test_helper"

class Seasons::SuggestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get seasons_suggestions_new_url
    assert_response :success
  end

  test "should get create" do
    get seasons_suggestions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get seasons_suggestions_destroy_url
    assert_response :success
  end
end
