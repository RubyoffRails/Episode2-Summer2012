require_relative 'slope'

class Movie

  attr_reader :id, :title, :year, :score

  class << self
    attr_reader :movies
  end

  def self.add_movies(movie)
    @movies ||= []
    movies << movie
  end

  def self.average(method)
    total = movies.inject(0) { | sum, movie | sum + movie.send(method) }
    ( total / movies.length ).round
  end

  def self.average_score
    average(:score)
  end

  def self.average_year
    average(:year)
  end

  def self.user_satisfaction
    return "Happier" if slope > 0
    return "Maddier" if slope < 0
  end

  def self.slope
    Slope.calculate( y1: newest_movie.score,
                     y2: oldest_movie.score,
                     x1: newest_movie.year,
                     x2: oldest_movie.year )
  end

  def self.oldest_movie
    sorted_movies.first
  end

  def self.newest_movie
    sorted_movies.last
  end

  def self.sorted_movies
    sorted_movies = movies.sort_by { | movie | movie.year }
  end

  def initialize(hash={})
    @id = hash.fetch(:id)
    @title = hash.fetch(:title)
    @year = hash.fetch(:year)
    @score = hash.fetch(:score)
  end
end
