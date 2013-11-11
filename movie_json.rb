require_relative "lib/movie"
require_relative "lib/movie_library"
require_relative "lib/api"

def find_movie library
  puts "Add a movie you really like"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  if movie
    puts "Found: #{movie.title}. Score: #{movie.score}"
    library.add movie
    puts "Current Average Score: #{library.average_score}"
  else
    puts "Nothing Found...."
    false
  end
end

library = MovieLibrary.new
find_movie library

while true do
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie library
  else
    break
  end
end
