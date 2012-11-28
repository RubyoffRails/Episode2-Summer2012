require_relative "./movie"

class Search_History
  attr_reader :movies

  def initialize()
    @movies = []
  end

  def add_search(movie)
    @movies << movie
  end

  def average_rating()
    average = 0
    @movies.each do |movie|
      average += movie.score
    end

    return (average/@movies.count)
  end

  def average_year_for_ratings()
    year = 0
    @movies.each do |movie|
      year += movie.year
    end

    return (year/@movies.count).ceil
  end

  def average_rating_for_year(year)
    @rating = 0
    movie_count = 0
    @movies.each do |movie|
      if movie.year == year then
        @rating += movie.score
        movie_count += 1
      end
    end

    return (@rating/movie_count)
  end

  def average_rating_for_max_year
    average_rating_for_year(max_year)
  end
  
  def average_rating_for_min_year
    average_rating_for_year(min_year)
  end

  def max_year
    @movies.max_by(&:year).year
  end

  def min_year
    @movies.min_by(&:year).year
  end

  def ratings_trend
    if @movies.count > 1 then
      (average_rating_for_max_year - average_rating_for_min_year) / (max_year - min_year)
    else
      0
    end
  end
end
