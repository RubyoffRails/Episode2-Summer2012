class Movie

  attr_reader :id, :title, :year, :score

  class << self
    attr_reader :movies
  end

  def self.add_movies(movie)
    @movies ||= []
    movies << movie
  end

  def self.average
    total_score = movies.inject(0) { | sum, movie | sum + movie.score }
    ( total_score / movies.length ).round
  end

  def initialize(hash={})
    @id = hash.fetch(:id)
    @title = hash.fetch(:title)
    @year = hash.fetch(:year)
    @score = hash.fetch(:score)
  end
end
