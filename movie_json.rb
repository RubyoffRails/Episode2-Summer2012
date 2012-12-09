require_relative "lib/movie"
require_relative "lib/api"
require_relative "lib/user"

def start_movie_finder
  puts "OH HAI. What's your name?"
  @user = User.new(gets)
end

def find_movie
  puts "Search for a movie, #{@user.name}"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  @user.add_to_searches(movie)
  if movie
    puts "Found: #{movie.title}. Score: #{movie.score}" 
  else
    puts "Movie not found."
  end
end

def show_movie_searches
  puts "Your search history:"
  @user.searches.each { |movie| puts movie.title }
end

start_movie_finder
find_movie

while true do
  puts "Search Again (Y/N)" 
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  else
    show_movie_searches
    break
  end
end
