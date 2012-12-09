class User
  attr_reader :name, :searches

  def initialize(name)
    @name = name
    @searches = []
  end

  def add_to_searches(movie)
    @searches << movie
  end
end
