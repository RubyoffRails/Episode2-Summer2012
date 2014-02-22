require_relative "lib/movie"
require_relative "lib/movie_library"
require_relative "lib/api"

def find_movie
  begin
    puts "OH HAI. Add a movie you really like?"
    movie_title = gets
    movie = Api.search_by_title(movie_title)
  rescue NoMethodError
    puts "Not found."
  end
end

movie_library = MovieLibrary.new
movie = find_movie
unless movie.nil?
movie_library.catalog(movie)
puts "Found: #{movie.title}. Score: #{movie.score}"
end

while true do
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  if answer == "Y"
    movie = find_movie
    unless movie.nil?
    movie_library.catalog(movie)
    puts "Found: #{movie.title}. Score: #{movie.score}"
    end
  else
    puts "\n--------------------------"
    puts "Summary for your Movie Library"
    puts "-----------------------------"
    movie_library.library.each do |movie|
      puts "ID: #{movie.id}\tMovie: #{movie.title}\tYear: #{movie.year} Score: #{movie.score}\tAverage: #{movie_library.average_rating_by_year(movie.year)}"
    end
    puts "Your library has a Happiness Index of: #{movie_library.slope}"
    puts "Goodbye!!!"
    break
  end
end
