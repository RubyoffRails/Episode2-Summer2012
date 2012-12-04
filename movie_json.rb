require_relative "lib/movie"
require_relative "lib/api"

def find_movie
  puts 'Add a movie you really like:'
  movie_title = gets
  current_movie = Api.search_by_title(movie_title)
  @movies << current_movie
  puts "Found: #{@movies.last.title}. Score: #{@movies.last.score} Year: #{@movies.last.year}" 
  if @movies.length > 1
    puts "Average movie score: #{get_average(@movies, "score", "float")}"
    puts "Average movie year: #{get_average(@movies, "year", "integer")}"
    puts get_satisfaction(@movies)
  end
  rescue Api::NilMovie
    puts 'Oops. Something went wrong or title not found.'
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
  return "neutral" if min_movie == max_movie
  max_movie_count, max_movie_score_total = 0, 0
  min_movie_count, min_movie_score_total = 0, 0
  movies.each do |movie|
    if movie.year == max_movie.year
      max_movie_count += 1 
      max_movie_score_total += movie.score
    end
    if movie.year == min_movie.year
      min_movie_count += 1 
      min_movie_score_total += movie.score
    end
  end
  user_slope = ((max_movie_score_total/max_movie_count).to_f - (min_movie_score_total/min_movie_count).to_f) / (max_movie.year - min_movie.year).to_f
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
