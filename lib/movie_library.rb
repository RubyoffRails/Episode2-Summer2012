class MovieLibrary

  attr_reader :movies
  def initialize
    @movies = []
  end

  def average_rating
    all_movies.inject(0.0) { |sum, movie| sum + movie.score } / all_movies.size
  end

  def register(movie)
    @movies << movie
  end

  def all_movies
    @movies
  end

  def count
    movies.count
  end
end
