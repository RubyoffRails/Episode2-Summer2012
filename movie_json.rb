require_relative "lib/movie"
require_relative "lib/api"
require_relative "lib/search_history"

def find_movie
  puts "Add a movie you really like"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  @search_history.add_search(movie)
  puts "Found: #{movie.title}. Score: #{movie.score}"
  puts "Average movie score: #{@search_history.average_rating}."
end

@search_history = Search_History.new
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
