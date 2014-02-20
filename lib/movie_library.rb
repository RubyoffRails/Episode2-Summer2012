class MovieLibrary

  attr_reader :movies
  def initialize
    @movies = []
  end

  def average_rating_by_year(year)
    result = all_movies.select {|movie| movie.year == year}
    return 0 if result.length == 0
    average_rating(result)
  end

  def average_rating(movies)
    return 0 if count == 0
    movies.inject(0.0) { |sum, movie| sum + movie.score } / movies.size
  end

  def catalog(movie)
    @movies << movie
  end

  def all_movies
    @movies
  end

  def count
    movies.count
  end
end
