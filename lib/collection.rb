class Collection
	attr_reader :movies
	
	def initialize
		@movies = []
	end
	
	def add_movie movie
		@movies << movie unless movie == :NotFound
	end
	
	def average_score
		
		return 0 if @movies.size == 0
		
		@movies.inject(0.0) {|sum, movie| sum + movie.score} / @movies.size
	end
end