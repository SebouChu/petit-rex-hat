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
class Season::Suggestion < ApplicationRecord
  attr_accessor :movie_tmdb_identifier

  belongs_to :season
  belongs_to :user
  belongs_to :movie

  validate :must_respect_max_season_suggestions_per_user, on: :create

  before_validation :find_or_create_movie_from_tmdb, on: :create, if: :movie_tmdb_identifier

  scope :not_picked, -> { where(picked_at: nil) }
  scope :picked, -> { where.not(picked_at: nil) }

  private

  def find_or_create_movie_from_tmdb
    result_movie = Movie.find_or_create_from_tmdb(movie_tmdb_identifier)
    self.movie_id = result_movie.id if result_movie.present?
  end

  def must_respect_max_season_suggestions_per_user
    errors.add(:base, :max_suggestions_reached) unless season.suggestions.where(user_id: user_id).count < Season::MAX_SUGGESTIONS_PER_USER
  end
end
