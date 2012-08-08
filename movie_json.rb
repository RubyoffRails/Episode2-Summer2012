require_relative "lib/movie"
require_relative "lib/api"

movies = []

def average_score(movies)
  movies.inject(0.0){ |sum, el| sum + el.score } / movies.size
end

def average_year(movies)
  movies.inject(0.0){ |sum, el| sum + el.year } / movies.size
end

def calculate_ratings_slope(movies)
  sorted_by_year = movies.sort{ |a, b| a.year <=> b.year }
  y1, s1 = sorted_by_year.first.year, sorted_by_year.first.score
  y2, s2 = sorted_by_year.last.year, sorted_by_year.last.score
  (s2 - s1).to_f / (y2 - y1).to_f
end

def find_movie(movies)
  puts "Add a movie you really like:"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  if movie.title == "NOT_FOUND"
    puts "Couldn't find #{movie_title}"
  else
    movies << movie
    puts "Found: #{movies.last.title}. Score: #{movies.last.score}"
  end
end

find_movie(movies)

while true do
  puts "Add Another (Y/N)?"
  if gets =~ /Y/i
    find_movie(movies)
  else
    break
  end
end

puts "Average score: #{format("%.2f", average_score(movies))}"
puts "Average year: #{format("%.0f", average_year(movies))}"
slope = calculate_ratings_slope(movies)
puts "Slope: #{slope}"
if slope > 0
  puts "Getting better"
elsif slope == 0
  puts "Staying the same"
else
  puts "Getting worse"
end

