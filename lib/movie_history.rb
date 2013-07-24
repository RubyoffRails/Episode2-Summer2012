class MovieHistory

  class << self
    attr_reader :searches
  end

  def self.add_search(title)
    @searches ||= []
    @searches << title
  end
end