# == Schema Information
#
# Table name: movies
#
#  id              :uuid             not null, primary key
#  backdrop_path   :string
#  director        :string
#  poster_path     :string
#  release_date    :date
#  title           :string
#  title_fr        :string
#  tmdb_identifier :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Movie < ApplicationRecord
  SMALL_BACKDROP_SIZE = "w780" # From TheMovieDb.configuration.backdrop_sizes
  SMALL_POSTER_SIZE = "w500" # From TheMovieDb.configuration.poster_sizes

  has_many :suggestions, class_name: "Season::Suggestion"

  validates :tmdb_identifier, presence: true, uniqueness: true

  def self.find_or_create_from_tmdb(tmdb_identifier)
    movie = Movie.find_by(tmdb_identifier: tmdb_identifier)
    if movie.nil?
      attributes = TheMovieDb.find(tmdb_identifier)
      return nil if attributes.blank?
      movie = Movie.create(attributes)
    end
    movie
  end

  def to_s
    title_fr
  end

  def original_poster_url
    [TheMovieDb.configuration.base_url, "original", poster_path].join
  end

  def small_backdrop_url
    [TheMovieDb.configuration.base_url, SMALL_BACKDROP_SIZE, backdrop_path].join
  end

  def small_poster_url
    [TheMovieDb.configuration.base_url, SMALL_POSTER_SIZE, poster_path].join
  end
end
