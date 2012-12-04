require_relative "lib/movie"
require_relative "lib/api"
require_relative "movie-stats"
require "pry"

def find_movie
  puts "OH HAI. Search?"
  title = gets.chomp
  movie_title = Api.validate_title(title)
  movie = Api.search_by_title(movie_title)
  # binding.pry
  @stats.collect_movies(movie)
  @stats.average_rating
  @stats.happiness
  puts "Found: #{movie.title}. Score: #{movie.score}"
end
@stats = MovieStats.new
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
