class MovieLibrary

  attr_reader :movies, :catalog, :slope
  attr_accessor :slope
  def initialize
    @movies = []
    @catalog = []
    @slope = 0
  end

  def calculate_slope(catalog)
    first = catalog.first
    last = catalog.last
    return 0 if catalog.count <= 1
    @slope = (first.score - last.score).to_f / (last.year - first.year).to_f
  end

  def sort_by_year(movies)
    @catalog = movies.sort { |movie,another_movie| movie.year <=> another_movie.year }
  end

  def average_rating_by_year(year)
    average_rating all_movies.select {|movie| movie.year == year}
  end

  def average_rating(movies)
    return 0 if count == 0
    movies.inject(0.0) { |sum, movie| sum + movie.score } / movies.size
  end

  def add(movie)
    movies << movie
    catalog = sort_by_year(movies)
    calculate_slope(catalog)
  end

  def all_movies
    @movies
  end

  def count
    movies.count
  end
end
