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
  has_many :suggestions, dependent: :destroy

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
end
