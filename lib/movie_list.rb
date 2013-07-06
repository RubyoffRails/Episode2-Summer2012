class MovieList
  attr_reader :movies

  def initialize
    @movies = []
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

  def titles
    @movies.map(&:title).join(', ')
  end
end