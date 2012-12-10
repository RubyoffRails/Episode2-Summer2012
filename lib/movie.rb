class Movie

  attr_reader :id, :title, :year, :score
  attr_accessor :liked_at

  def initialize(hash={})
    @id = hash.fetch(:id)
    @title = hash.fetch(:title)
    @year = hash.fetch(:year)
    @score = hash.fetch(:score)
    @liked_at = Time.now.year
  end
end
