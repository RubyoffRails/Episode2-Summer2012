require_relative "lib/movie"
require_relative "lib/api"

def find_movie
  puts "OH HAI. Search?"
  movie_title = gets.chomp
  Api.search_by_title(movie_title)
  puts "Search Again? (Y/N)"
end

find_movie

while true do
  answer = gets.chomp.upcase[0]
  if answer == "Y"
    find_movie
  else
    break
  end
end
