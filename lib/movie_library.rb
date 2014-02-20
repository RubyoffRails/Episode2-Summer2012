class MovieLibrary

  attr_reader :movies
  def initialize
    @movies = []
  end

  def self.all_movies
    @movies
  end

  def count
    movies.count
  end
end
