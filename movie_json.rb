require_relative "lib/movie"
require_relative "lib/movie_library"
require_relative "lib/api"

def find_movie library
  puts "Add a movie you really like"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  if movie

    puts "\n"
    puts "Found: #{movie.title}. Score: #{movie.score}"
    library.add movie

    puts "\n"
    puts "Current Average Score: #{library.average_score}"
    puts "Current Average Year: #{library.average_year.to_i}"
    puts "Current Slope: #{library.slope}"
    if library.slope > 0
      puts "Postive Slope: Getting Happier"
    elsif library.slope < 0
      puts "Negative Slope: Getting Sader"
    else
      puts "Your pretty balanced"
    end
  else
    puts "Nothing Found...."
    false
  end
end

library = MovieLibrary.new
find_movie library

while true do
  puts "\n"
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie library
  else
    break
  end
end
