require_relative "./movie"

class MovieList

	def initialize
		@@movie_list = []
	end

  def self.build(args)
    movie = Movie.new(args)
    @@movie_list << movie
  end
end