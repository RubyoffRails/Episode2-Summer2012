class User
  attr_reader :name, :searches

  def initialize(name)
    @name = name
    @searches = []
  end

  def add_to_searches(movie)
    @searches << movie
  end

  def rating
    movie_scores = searches.map { |movie| movie.score }
    movie_scores.inject { |sum, el| sum + el } / searches.size
  end

  def average_year
    movie_years = searches.map { |movie| movie.year }
    movie_years.inject { |sum, el| sum + el } / searches.size
  end
end
