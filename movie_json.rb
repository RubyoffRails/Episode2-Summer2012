require_relative "lib/movie"
require_relative "lib/api"

def get_average_rating(movies)
  scores = movies.collect { |i| i.score }
  average = scores.inject(0.0) { |sum, rating| sum + rating } / scores.size
end

def find_movie(movies)
  puts "Add a movie you really like."
  movie_title = gets
  movies << Api.search_by_title(movie_title)
  puts "Found: #{movies.last.title}. Score: #{movies.last.score}"
  puts "Average rating: #{get_average_rating(movies)}"
rescue 
 puts "Movie not found."
end

movies = []
while true
  find_movie(movies)
  puts "Search Again (Y/N)" 
  answer = gets.upcase[0]
  if answer != "Y"
    break
  end
end
