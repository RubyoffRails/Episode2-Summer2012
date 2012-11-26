require_relative "lib/movie"
require_relative "lib/api"



def find_movie()
  puts "Add a movie you really like"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  puts "Found: #{movie.title}. Score: #{movie.score}"
  movie.score
end

def calculate_average(array_of_numbers)
  array_of_numbers.inject(0.0) { |sum, el| sum + el } / array_of_numbers.size
end


movies = []

movies << find_movie

while true do
  puts "Search Again (Y/N)" 
  answer = gets.upcase[0]

  if answer == "Y"
    movies << find_movie
    puts "The average score of your movies is: " + calculate_average(movies).to_s
  else
    break
  end
end
