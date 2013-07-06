require_relative "lib/movie"
require_relative "lib/movie_list"
require_relative "lib/api"

def find_movie
  puts "Add a movie you really like:"
  movie_title = gets.chomp
  movie = Api.search_by_title(movie_title)
  
  if movie
    puts "Found: #{movie.title}. Score: #{movie.score}"
    movie
  else
    puts "Movie with title: \"#{movie_title}\" not found"
    nil
  end
end

movie_list = MovieList.new

while true do
  movie = find_movie

  if movie
    puts "[#{movie.title}] is already on your list!" unless movie_list.add(movie)

    puts "------------------------------------------"
    puts "Your favorite movies: #{movie_list.titles}"
    puts "Average score: #{movie_list.average_score}"
    puts "------------------------------------------"
  end

  puts "Add more? (Y/N)" 
  answer = gets.upcase[0]
  break if answer == "N"
end
