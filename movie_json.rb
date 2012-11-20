require_relative "lib/movie"
require_relative "lib/api"

@@movies = []

def find_movie
  puts "Add a movie you really like:"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  @@movies << movie
  puts "Added #{movie.title} with a rating of #{movie.score}"
end

def compute_average
  total = 0.0
  @@movies.each do |m|
    total += m.score
  end
  average = total / @@movies.size.to_f
end

find_movie
while true do
  puts "Add Another (Y) or Compute Average? (A)"
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  elsif answer == "A"
    puts "The average score of the movies you like is: #{compute_average}"
    break
  else
    break
  end
end
