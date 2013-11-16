class MovieLibrary
  attr_reader :movies

  def initialize
    @movies = []
  end

  def add(movie)
    @movies << movie
  end

  def average_score
    return 0 unless @movies.any?
    @movies.inject(0) { |sum, m| sum + m.score}.to_f / @movies.length
  end

  def average_year
    return 0 unless @movies.any?
    @movies.inject(0) { |sum, m| sum + m.year}.to_f / @movies.length
  end

  def slope
    sorted_movies = sort_movies
    return 0 if sorted_movies.last.year == sorted_movies.first.year
    (sorted_movies.last.score - sorted_movies.first.score).to_f / (sorted_movies.last.year - sorted_movies.first.year)
  end

  private
  def sort_movies
    @movies.sort_by { |m| m.year }
  end
end
