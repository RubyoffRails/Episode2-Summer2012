require_relative "lib/movie"
require_relative "lib/api"

def average_movie_rating(movies_array)
  movies_array.inject(0.0) { |sum, movie| sum + movie.score } / movies_array.size
end

def find_movie
  begin
    puts "OH HAI. Add a movie you really like?"
    movie_title = gets
    movie = Api.search_by_title(movie_title)
    @movies << movie
    puts "Added: #{movie.title}. Score: #{movie.score}"
  rescue NoMethodError
    puts "Not found."
  end
end

@movies = []
find_movie
puts "The average rating is #{average_movie_rating(@movies)}."

while true do
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
    puts "The average rating is #{average_movie_rating(@movies)}."
  else
    break
  end
end
