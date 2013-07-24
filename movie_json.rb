require_relative "lib/movie"
require_relative "lib/api"

def find_movie
  puts "Add a movie you really like"
  movie_title = gets.chomp
  Api.search_by_title(movie_title)
  puts "Search Again? (Y/N)"
  answer = gets.chomp.upcase[0]
  if answer == "Y"
    find_movie
  else
    puts "The average of the movie you add is: #{Movie.average}"
    exit
  end
end

find_movie


