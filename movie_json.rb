require_relative "lib/movie"
require_relative "lib/api"

def get_average(movies, attribute)
  if attribute == "score"
    data = movies.collect { |i| i.score }
  elsif attribute == "year"
    data = movies.collect { |i| i.year }
  else
    data = []
  end
  average = data.inject(0.0) { |sum, rating| sum + rating } / data.size
end

def calculate_slope(movies)
  movies = movies.sort_by { |i| i.year }
  slope = (movies.last.score - movies.first.score).to_f / 
            (movies.last.year - movies.first.year).to_f
  if slope < 0 
    puts "You are getting madder."
  elsif slope > 0
    puts "You are getting happier."
  end
end

def find_movie
  puts "Add a movie you really like."
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  puts "Found: #{movie.title}. Score: #{movie.score}"
  movie
rescue 
 puts "Movie not found."
end

movies = []
while true
  movies << find_movie
  puts "Average rating: #{get_average(movies, "score")}. Average year: #{get_average(movies, "year")}"
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  if answer != "Y"
    calculate_slope(movies) if movies.count > 1
    break
  end
end
