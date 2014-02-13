class Movie

  attr_reader :id, :title, :year, :score
  def initialize(hash={})
    @id = hash.fetch(:id)
    @title = hash.fetch(:title)
    @year = hash.fetch(:year)
    @score = hash.fetch(:score)
  end
end

class NotFoundMovie
  attr_reader :title, :score

  def initialize
    @title = "no results"
    @score = "N/A"
  end
end
