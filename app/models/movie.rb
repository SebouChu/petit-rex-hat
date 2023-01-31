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
end
