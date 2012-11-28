require_relative "lib/movie"
require_relative "lib/api"

def find_movie
  puts "Add a movie you really like"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  puts "Found: #{movie.title}. Score: #{movie.score}"
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
