require "test_helper"

class Seasons::SuggestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in(seb)
  end

  def test_new
    get new_season_suggestion_url(seasons(:twentytwo))
    assert_response :success
  end

  def test_create
    season = seasons(:twentytwo)
    VCR.use_cassette(location) do
      assert_difference("Movie.count") do
        post season_suggestions_url(season), params: { season_suggestion: { movie_tmdb_identifier: 545611 } }
        assert_redirected_to(season_url(season))
      end
    end
  end

  def test_create_invalid
    VCR.use_cassette(location) do
      assert_no_difference("Movie.count") do
        post season_suggestions_url(seasons(:twentytwo)), params: { season_suggestion: { movie_tmdb_identifier: 1234567898765 } }
        assert_response(:unprocessable_entity)
      end
    end
  end

  def test_destroy
    season = seasons(:twentyone)
    suggestion = season_suggestions(:twentyone_seb_it)
    delete season_suggestion_url(suggestion, { season_id: season })
    assert_redirected_to(season_url(season))
  end
end
