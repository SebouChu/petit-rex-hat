require "test_helper"

class Seasons::SuggestionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in(seb)
  end

  def test_pick
    season = seasons(:twentyone)
    post pick_in_season_suggestions_url(season)
    assert_redirected_to season_url(season)
  end

  def test_new
    get new_season_suggestion_url(seasons(:twentytwo))
    assert_response :success
  end

  def test_edit
    get edit_season_suggestion_url(season_suggestions(:twenty_god_seb_parasite), { season_id: seasons(:twenty_god).id })
    assert_response :success
  end

  def test_create
    season = seasons(:twentytwo)
    VCR.use_cassette(location) do
      assert_difference("Movie.count") do
        assert_difference("Season::Suggestion.count") do
          post season_suggestions_url(season), params: { season_suggestion: { movie_tmdb_identifier: 545611 } }
          assert_redirected_to(season_url(season))
        end
      end
    end
  end

  def test_update
    suggestion = season_suggestions(:twenty_god_seb_parasite)
    assert_nil suggestion.picked_at
    put season_suggestion_url(suggestion, { season_id: suggestion.season_id }), params: { season_suggestion: { picked_at: "2023-01-20" } }
    assert_redirected_to(season_url(suggestion.season_id))
    assert_equal Time.zone.parse("2023-01-20"), suggestion.reload.picked_at
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
