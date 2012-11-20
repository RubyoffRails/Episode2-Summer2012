require_relative "lib/movie"
require_relative "lib/api"
require_relative "lib/movie_search"

def find_movie
  @searcher ||= MovieSearch.new
  puts "OH HAI. Add a movie your really like!"
  movie_title = gets

  puts @searcher.find_movie(movie_title)
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
