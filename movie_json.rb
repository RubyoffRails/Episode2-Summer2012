require_relative "lib/movie"
require_relative "lib/api"

def find_movie
  @movies = [] if @movies == nil
  puts 'Add a movie you really like:'
  movie_title = gets
  if !(current_movie = Api.search_by_title(movie_title))
    puts 'Oops. Something went wrong or title not found.'
  else
    @movies << current_movie
    puts "Found: #{@movies.last.title}. Score: #{@movies.last.score}" 
    puts "Average movie score: #{get_average_rating(@movies)}"
  end
end

def get_average_rating(movies)
  all_ratings = 0
  movies.each { |rating| all_ratings += rating.score }
  all_ratings / movies.length.to_f
end

find_movie

while true do
  puts 'Search Again (Y/N)'
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  else
    break
  end
end
