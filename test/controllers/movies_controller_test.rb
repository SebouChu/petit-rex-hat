require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in(seb)
  end

  def test_index
    VCR.use_cassette(location) do
      get movies_url
      assert_response :success
    end
  end

  def test_show
    VCR.use_cassette(location) do
      get movie_url(movies(:interstellar))
      assert_response :success
    end
  end
end
