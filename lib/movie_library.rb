class MovieLibrary

  attr_reader :movies
  def initialize
    @movies = []
  end

  def calculate_slope
    sorted_catalog = sort_by_year
    (sorted_catalog.first.score - sorted_catalog.last.score).to_f / (sorted_catalog.last.year - sorted_catalog.first.year).to_f
  end

  def sort_by_year
    all_movies.sort { |movie,another_movie| movie.year <=> another_movie.year }
  end

  def average_rating_by_year(year)
    average_rating all_movies.select {|movie| movie.year == year}
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
