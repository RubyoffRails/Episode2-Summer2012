require_relative "lib/movie"
require_relative "lib/movie_library"
require_relative "lib/api"

def find_movie
  begin
    puts "OH HAI. Add a movie you really like?"
    movie_title = gets
    movie = Api.search_by_title(movie_title)
  rescue NoMethodError
    puts "Not found."
  end
end

movie_library = MovieLibrary.new
movie = find_movie
movie_library.catalog(movie)
puts "Found: #{movie.title}. Score: #{movie.score}"
puts "The average rating for all movies searched thus far is #{movie_library.average_rating}."

while true do
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  if answer == "Y"
    movie = find_movie
    movie_library.catalog(movie)
    puts "Found: #{movie.title}. Score: #{movie.score}"
    puts "The average rating for all movies searched thus far is #{movie_library.average_rating}."
  else
    break
  end
end
