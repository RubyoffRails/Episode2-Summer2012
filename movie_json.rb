require_relative "lib/movie"
require_relative "lib/api"
require_relative "lib/text_color"

def movies_average(movies_arr)
  scores = []
  movies_arr.each { |movie| scores << movie.score }
  scores.inject{ |sum, el| sum + el }.to_f / scores.size
end

def movies_slope(movies_arr)
  movies_by_year = movies_arr.sort_by! { |movie| movie.year }
  y2_arr = []
  y1_arr = []
  movies_by_year.each do |movie|
    if movie.year == movies_by_year.first.year
      y2_arr << movie
    end
  end
  movies_by_year.each do |movie|
    if movie.year == movies_by_year.last.year
      y1_arr << movie
    end
  end
  y1 = movies_average(y1_arr)
  y2 = movies_average(y2_arr)
  x1 = movies_by_year.last.year
  x2 = movies_by_year.first.year
  (y1 - y2).to_f / (x1 - x2).to_f
end

def show_average(movies_arr)
  text_color(BRIGHT, BLUE)
  printf "Average: #{movies_average(movies_arr)}\n"
  text_color(RESET, WHITE)
end

def show_contentment(movies_arr)
  if movies_slope(movies_arr) == 0
    puts "Staying Content"
  elsif movies_slope(movies_arr) > 0
    text_color(BRIGHT, YELLOW)
    puts "Getting Happier"
  else
    text_color(BRIGHT, MAGENTA)
    puts "Getting Madder"
  end
  text_color(RESET, WHITE)
end

def find_movie(movies_arr)
  print "Search: "
  searched_movie = gets.chomp
  movie = Api.search_by_title(searched_movie)
  if movie == :no_movie_found
    text_color(BRIGHT, RED)
    printf "\tCould not find #{searched_movie}\n"
  else
    text_color(BRIGHT, GREEN)
    printf "\tFound: #{movie.title}\n\tScore: #{movie.score}\n"
    movies_arr << movie
  end
  text_color(RESET, WHITE)
end

movies_arr = []

puts "HI! Welcome to rssll's #{$0}."
printf "Search for movies that you really like!\n\n"
find_movie(movies_arr)

loop do
  print "Search Again? (Y/N) "
  answer = gets.chomp
  if answer =~ /Y/i
    find_movie(movies_arr)
    if movies_arr.size > 1
      show_average(movies_arr)
      show_contentment(movies_arr)
    end
  else
    break
  end
end
