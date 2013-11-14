require_relative "lib/movie"
require_relative "lib/api"

searched_movies = Array.new

def find_movie (searched_movies)
  puts "Add a movie you really like"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  if (movie)
    puts "Found: #{movie.title}. Score: #{movie.score}"
    searched_movies << movie.score
  else
    puts "Not Found"
  end
end

find_movie (searched_movies)

while true do
  puts "Add more? (Y/N)" 
    answer = gets.upcase[0]
    if answer == "Y"
    find_movie (searched_movies)
    else
      raitng_average = searched_movies.inject{ |sum, el| sum + el }.to_f / searched_movies.size
      puts "The average rating for your movies is: #{raitng_average}"
    break
    end
end
