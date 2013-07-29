require_relative "lib/movie"
require_relative "lib/api"
require_relative "lib/movie_collection"


@collection = MovieCollection.new

def find_movie
  puts "OH HAI. Add a movie to your collection?"
  movie_title = gets
  movie = Api.search_by_title(movie_title)
  @collection.add_movie movie
  
  if movie == :NotFound
    puts "Didn't find that one."
  else
    puts "Found: #{movie.title}. Score: #{movie.score}"
  end
end

def show_collection_average
  puts "The average score of your collection is #{@collection.average_score}."
  if @collection.average_score > 75
    puts "Excellent tastes!"
  elsif @collection.average_score > 25
    puts "Nice collection."
  else
    puts "You have very unique tastes."
  end
end

def show_year_average
  puts "The average year of your collection is #{@collection.average_year}"
end

def show_averages_by_year
  yearly_averages = @collection.average_per_year
  puts "Your movie average by year is:"
  yearly_averages.each { |year, avg| puts "#{year} : #{avg}" }
end

def show_slope
  slope = @collection.rating_slope
  puts "The slope of your movie ratings is #{slope}."
  if slope < 0
    puts "Your tastes are declining. You mad, bro?"
  else
    puts "The quality of films is improving. Release that anger!"
  end
end

find_movie

while true do
  puts "Add another? (Y/N)" 
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  else
    show_collection_average
    show_year_average
    show_averages_by_year
    show_slope
    break
  end
end
