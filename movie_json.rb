require_relative "lib/movie"
require_relative "lib/api"

def find_movie
  puts 'Add a movie you really like:'
  movie_title = gets
  if !(current_movie = Api.search_by_title(movie_title))
    puts 'Oops. Something went wrong or title not found.'
  else
    @movies << current_movie
    puts "Found: #{@movies.last.title}. Score: #{@movies.last.score} Year: #{@movies.last.year}" 
    if @movies.length > 1
      puts "Average movie score: #{get_average(@movies, "score", "float")}"
      puts "Average movie year: #{get_average(@movies, "year", "integer")}"
      puts get_satisfaction(@movies)
    end
  end
end

def get_average(movies, attribute, type)
  attribute_sum = 0
  movies.each { |rating| attribute_sum += rating.send(attribute) }
  if type == "float" 
    return attribute_sum / movies.length.to_f
  else
    return attribute_sum / movies.length
  end
end

def get_satisfaction(movies)
  min_movie = movies.min_by(&:year)
  max_movie = movies.max_by(&:year)
  user_slope = (max_movie.score - min_movie.score).to_f / (max_movie.year - min_movie.year).to_f
  if user_slope == 0
    return "neutral"
  elsif  user_slope > 0
    return "getting happier"
  else
    return "getting madder"
  end
end

@movies = []

find_movie

while true do
  puts 'Search Again (Y/N)'
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  else
    break
  end
end
