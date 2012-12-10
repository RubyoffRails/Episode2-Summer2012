require_relative "lib/movie"
require_relative "lib/api"
require_relative "lib/user"

def start_movie_finder
  puts "OH HAI. What's your name?"
  @user = User.new(gets)
end

def find_movie
  puts "Add a movie you really like, #{@user.name}"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  @user.add_to_searches(movie)
  if !movie.nil?
    puts "Found: #{movie.title}. Score: #{movie.score}" 
  end
end

def show_movie_searches
  puts "============================"
  puts "Your overall average movie rating score is: #{@user.rating}"
  puts "The average year for the movies you have liked is: #{@user.average_year}"
  puts "============================"
  @user.average_rating_per_year.each_pair { |k, v| puts "For #{k}, your average movie rating was #{v}!"}
  puts "Your picking ability is #{@user.picking_ability}"
  puts "============================"
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
