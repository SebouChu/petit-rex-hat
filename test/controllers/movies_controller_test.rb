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

  def test_search
    VCR.use_cassette(location) do
      get search_movies_url(query: "Sinister", season_id: seasons(:twentythree).id, format: :js), xhr: true
      assert_response :success
    end
  end

  def test_show
    VCR.use_cassette(location) do
      get movie_url(movies(:interstellar))
      assert_response :success
    end
  end

  def test_destroy
    assert_difference("Movie.count", -1) do
      delete movie_url(movies(:mon_inconnue))
      assert_redirected_to(movies_url)
    end
  end
end
