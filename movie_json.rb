require_relative "lib/movie"
require_relative "lib/api"

def find_movie
  puts "OH HAI. Search:" #changed from 'Search?' to 'Search:' as former suggests 'Y/N' response rather than film name
  movie_title = gets
  movie = Api.search_by_title(movie_title)
	if !movie.nil?
  	puts "Found: #{movie.title}. Score: #{movie.score}"
	else
		puts 'Movie not found'
	end
end

find_movie

while true do
  puts "Search Again (Y/N)" 
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  else
    break
  end
end
