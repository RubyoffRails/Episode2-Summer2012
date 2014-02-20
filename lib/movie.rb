class Movie

  @@movies = []
  attr_reader :id, :title, :year, :score
  def initialize(hash={})
    @id = hash.fetch(:id)
    @title = hash.fetch(:title)
    @year = hash.fetch(:year)
    @score = hash.fetch(:score)
  end

  def self.build(args)
    movie = Movie.new(args)
    @@movies << movie
    movie
  end

  def self.average_rating
    all_movies.inject(0.0) { |sum, movie| sum + movie.score } / all_movies.size
  end

  def self.count
     @@movies.count
  end

  def self.all_movies
    @@movies
  end

end
