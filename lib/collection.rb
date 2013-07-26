class Collection
	attr_reader :movies
	
	def initialize
		@movies = []
	end
	
	def add_movie movie
		@movies << movie unless movie == :NotFound
	end
	
	def average_score
		average_for_movies @movies
	end
	
	def average_for_movies(movie_list)
		return 0 if movie_list.size == 0
		
		movie_list.inject(0.0) {|sum, movie| sum + movie.score} / movie_list.size
	end
	
	def average_year
		return :NoData if @movies.size == 0
		
		@movies.inject(0) {|sum, movie| sum + movie.year} / @movies.size
	end
	
	def average_per_year
		dictionary = {}
		separate_by_years.each {|year_list| dictionary[year_list.first.year.to_s] = average_for_movies year_list}
		dictionary
	end
	
	def separate_by_years
		sorted_movies = @movies.sort { |x,y| x.year <=> y.year }
		array_of_years([],[sorted_movies.first], sorted_movies.slice(1,sorted_movies.length - 1))
	end
	
	def array_of_years(years_array, current_movies, remaining_movies)
		if remaining_movies.size == 0
			years_array << current_movies
			return years_array
		else
			movie = remaining_movies.first
			if movie.year == current_movies.first.year
				current_movies << movie
				array_of_years(years_array, current_movies, remaining_movies.slice(1,remaining_movies.length- 1))
			else
				years_array << current_movies
				array_of_years(years_array, [movie], remaining_movies.slice(1,remaining_movies.length- 1))
			end
		end
	end
		
end