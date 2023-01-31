class TheMovieDb
  def self.configuration
    @@configuration ||= Tmdb::Configuration.new
  end

  def self.find(identifier)
    result = Tmdb::Movie.detail(identifier.to_i)
    return nil if result.has_key?("success") && !result["success"]
    to_movie_attributes(Tmdb::Movie.new(result))
  end

  def self.search(query, limit: 5)
    results = Tmdb::Movie.find(query).take(5)
    results.map { |result| to_movie_attributes(result) }
  end

  private

  def self.to_movie_attributes(result)
    {
      title: result.original_title,
      title_fr: result.title,
      director: get_director(result.id),
      release_date: result.release_date,
      poster_path: result.poster_path,
      backdrop_path: result.backdrop_path,
      tmdb_identifier: result.id
    }
  end

  def self.get_director(movie_id)
    crew = Tmdb::Movie.crew(movie_id)
    directors = crew.select { |person| person["job"] == "Director" }
    directors.map { |director| director['name'] }.join(', ')
  end
end