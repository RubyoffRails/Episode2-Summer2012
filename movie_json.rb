require_relative "lib/movie"
require_relative "lib/movie_library"
require_relative "lib/api"

def find_movie library
  puts "Add a movie you really like"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  if movie

    puts "Found: #{movie.title}. Score: #{movie.score}. Year: #{movie.year}"
    library.add movie

    puts "Average Score: #{library.average_score}"
    puts "Average Year: #{library.average_year.to_i}"
    puts "Slope: #{library.slope}"

    if library.slope > 0
      puts "Postive Slope: Getting Happier"
    elsif library.slope < 0
      puts "Negative Slope: Getting Madder"
    else
      puts "Neutral Slope: Your pretty balanced"
    end

  else
    puts "Nothing Found...."
  end
end

library = MovieLibrary.new
find_movie library

while true do
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  break unless answer == "Y"
  find_movie library
end
