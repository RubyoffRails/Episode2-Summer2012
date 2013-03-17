require_relative "lib/movie"
require_relative "lib/api"

@movies = []

def find_movie
  puts "Add a movie you really like:"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  unless movie.nil?
    puts "Found: #{movie.title}. Score: #{movie.score}. Year: #{movie.year}"
    @movies << movie
    puts "\nMovies found so far: "
    movie_list(@movies)
    average = average_ratings(@movies)
    average_year = average_year(@movies)
    puts "\nAverage Rating: #{average}"
    puts "Average Year: #{average_year}"
  else
    puts "Movie not found\n"
  end
end

def movie_list(movies)
  movies.each do |movie|
    puts "#{movie.title} - #{movie.score} - #{movie.year}"
  end
end

def average_ratings(movies)
  total = 0
  movies.each do |movie|
    total += movie.score
  end
  average = total / movies.length.to_i
end

def average_year(movies)
  total = 0
  movies.each do |movie|
    total += movie.year
  end
  average_year = total / movies.length.to_i
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
