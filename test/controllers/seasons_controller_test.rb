require "test_helper"

class SeasonsControllerTest < ActionDispatch::IntegrationTest
  def setup
    sign_in(seb)
  end

  def test_index
    get seasons_url
    assert_response :success
  end

  def test_show
    get season_url(seasons(:twentytwo))
    assert_response :success
  end

  def test_new
    get new_season_url
    assert_response :success
  end

  def test_edit
    get edit_season_url(seasons(:twentytwo))
    assert_response :success
  end

  def test_create
    assert_difference("Season.count") do
      post seasons_url, params: { season: { name: "Saison 2024-2025" } }
      season = Season.find_by(name: "Saison 2024-2025")
      assert_redirected_to(season_url(season))
    end
  end

  def test_create_invalid
    assert_no_difference("Season.count") do
      post seasons_url, params: { season: { name: "" } }
      assert_response(:unprocessable_entity)
    end
  end

  def test_update
    season = seasons(:twentytwo)
    assert_equal "Saison 2022-2023", season.name
    put season_url(season), params: { season: { name: "Meilleure saison" } }
    assert_redirected_to(season_url(season))
    assert_equal "Meilleure saison", season.reload.name
  end

  def test_update_invalid
    season = seasons(:twentytwo)
    assert_equal "Saison 2022-2023", season.name
    put season_url(season), params: { season: { name: "" } }
    assert_response(:unprocessable_entity)
    assert_equal "Saison 2022-2023", season.reload.name
  end

  def test_destroy
    assert_difference("Season.count", -1) do
      delete season_url(seasons(:twentythree))
      assert_redirected_to(seasons_url)
    end
  end
end
