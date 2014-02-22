class MovieLibrary

  attr_reader :movies, :library, :slope
  def initialize
    @movies = []
    @library = []
    @slope = 0
  end

  def calculate_slope(catalog)
    first = catalog.first
    last = catalog.last
    (first.score - last.score).to_f / (last.year - first.year).to_f
  end

  def sort_by_year(movies)
    movies.sort { |movie,another_movie| movie.year <=> another_movie.year }
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
    @library = sort_by_year(@movies)
    @slope = calculate_slope(@library)
    return @library
  end

  def all_movies
    @movies
  end

  def count
    movies.count
  end
end
