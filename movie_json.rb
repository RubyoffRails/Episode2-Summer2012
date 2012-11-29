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
  puts "Average movie year: #{@search_history.average_year_for_ratings}."
  if @search_history.ratings_trend > 0 then
    puts "You are getting happier"
  elsif @search_history.ratings_trend < 0 then
    puts "You are getting madder"
  end
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
