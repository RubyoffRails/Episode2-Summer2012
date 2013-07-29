require_relative "./movie"

class MovieCollection
	attr_reader :movies
	
	def initialize
		@movies = []
	end
	
	def add_movie movie
		@movies << movie unless movie == :not_found
	end
	
	def average_score
		average_for_movies @movies
	end
	
	def average_for_movies(movie_list)
		return 0 if movie_list.size == 0
		
		movie_list.inject(0.0) {|sum, movie| sum + movie.score} / movie_list.size
	end
	
	def average_year
		return :no_data if @movies.size == 0
		
		@movies.inject(0) {|sum, movie| sum + movie.year} / @movies.size
	end
	
	def average_per_year
		dictionary = {}
		movies_by_year(@movies).each_pair { |key, value| dictionary[key] = average_for_movies value}
		dictionary
	end
	
	def movies_by_year(movies)
		hash = {}
		movies.each do |movie|
			hash[movie.year] ||= []
			hash[movie.year] << movie
		end
		hash
	end
	
	def rating_slope
		yearly_averages = average_per_year
		# I think the keys should already be sorted by year, but just in case do it anyway
		sorted_years = yearly_averages.keys.sort

		return :need_more_data if sorted_years.length < 2
		
		first_avg = yearly_averages[sorted_years.first]
		last_avg = yearly_averages[sorted_years.last]
		
		(first_avg - last_avg).to_f / (sorted_years.first.to_i - sorted_years.last.to_i).to_f
		
	end
		
end