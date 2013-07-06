class Movie

  attr_reader :id, :title, :year, :score
  def initialize(hash={})
    @id = hash.fetch(:id)
    @title = hash.fetch(:title)
    @year = hash.fetch(:year)
    @score = hash.fetch(:score)
  end

  def ==(movie)
    return id == movie.id && title == movie.title && year == movie.year && score == movie.score
  end
end
