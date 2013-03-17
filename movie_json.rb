require_relative "lib/movie"
require_relative "lib/api"

@movies = []

def find_movie
  puts "Add a movie you really like:"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  unless movie.nil?
    puts "Found: #{movie.title}. Score: #{movie.score}"
    @movies << movie
    puts "\nMovies found so far: "
    movie_list(@movies)
  else
    puts "Movie not found\n"
  end
end

def movie_list(movies)
  total = 0
  movies.each do |movie|
    puts "#{movie.title} - #{movie.score}"
    total += movie.score
  end
  average = total / movies.length.to_i
  puts "Average Rating: #{average} (#{total}/#{movies.length.to_i})"
end

find_movie

while true do
  puts "\nSearch Again (Y/N)" 
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  else
    break
  end
end
