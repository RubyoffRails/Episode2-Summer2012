class Movie
  @valid = false

  attr_reader :id, :title, :year, :score

  def initialize(hash={})
    @id = hash.fetch(:id)
    @title = hash.fetch(:title)
    @year = hash.fetch(:year)
    @score = hash.fetch(:score)
    @valid = id.nil? || id == 0 ? false : true
  end

  def valid?
    @valid
  end

end
