# == Schema Information
#
# Table name: season_suggestions
#
#  id         :uuid             not null, primary key
#  picked_at  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :uuid             not null
#  season_id  :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_season_suggestions_on_movie_id   (movie_id)
#  index_season_suggestions_on_season_id  (season_id)
#  index_season_suggestions_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (season_id => seasons.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class Season::SuggestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
