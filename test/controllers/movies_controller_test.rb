require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in(seb)
  end

  def test_index
    get movies_url
    assert_response :success
  end

  def test_show
    get movie_url(movies(:interstellar))
    assert_response :success
  end
end
