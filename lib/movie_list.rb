class MovieList
  attr_reader :movies

  def initialize(movies = [])
    @movies = movies
  end

  def add(movie)
    if @movies.include?(movie)
      false
    else
      @movies << movie
      true
    end
  end

  def average_score
    @movies.inject(0.0) {|sum, movie| sum + movie.score} / @movies.count
  end

  def average_year
    @movies.inject(0.0) {|sum, movie| sum + movie.year} / @movies.count
  end

  def slope
    start_year = @movies.min_by {|movie| movie.year}.year
    end_year = @movies.max_by {|movie| movie.year}.year

    return nil if start_year == end_year
    
    movies_in_start_year = @movies.select {|movie| movie.year == start_year}
    movies_in_end_year = @movies.select {|movie| movie.year == end_year}

    (MovieList.new(movies_in_end_year).average_score - MovieList.new(movies_in_start_year).average_score) / (end_year - start_year).to_f
  end

  def titles
    @movies.map(&:title).join(', ')
  end
end