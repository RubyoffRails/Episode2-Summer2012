require_relative "lib/movie"
require_relative "lib/api"

# function definitions
def find_movie
  puts "OH HAI. Add a movie you really like:"
  movie_title = gets
  movie = Api.search_by_title(movie_title)

	if !movie.nil?
  	puts "Found: #{movie.title}. Score: #{movie.score}"
	else
		puts 'Movie not found'
	end

	movie
end

def get_average(movies)
	scores = []
	movies.each do |movie|
		scores << movie.score if !movie.nil?
	end
	total = scores.inject { |sum,n| sum+n }	
	total.to_f/scores.size
end



# main
movies = []

movie = find_movie
movies << movie if !movie.nil?

while true do
  puts "Add another? (Y/N)" 
  answer = gets.upcase[0]
  if answer == "Y"
		movie = find_movie
		movies << movie if !movie.nil?
  else
		puts
		# assuming movies that were actually found
		puts 'Movies searched and found: '
		if (movies.nil? || movies.empty?)
			puts 'None'
		else
			movies.each { |movie| puts movie.title }
			puts
			puts 'The average score of movies searched and found: '
			puts get_average(movies)
		end
    break
  end
end
