require_relative "lib/movie"
require_relative "lib/api"
require_relative "lib/text_color"

def movies_average(movies_arr)
  scores = []
  movies_arr.each { |movie| scores << movie.score }
  scores.inject{ |sum, el| sum + el }.to_f / scores.size
end

def get_y(sorted_movies, x)
  y_arr = []
  sorted_movies.each do |movie|
    y_arr << movie if movie.year == x
  end
  movies_average(y_arr)
end

def movies_slope(movies_arr)
  sorted_movies = movies_arr.sort_by { |movie| movie.year }
  x1 = sorted_movies.last.year    # latest movie year ex: 2012
  x2 = sorted_movies.first.year   # earliest movie year ex: 1990
  y1 = get_y(sorted_movies, x1)   # average of the scores from latest year ex: 45
  y2 = get_y(sorted_movies, x2)   # average of the scores from earliest year ex: 50
  (y1 - y2).to_f / (x1 - x2).to_f # (45 - 50)to_f / (2012 - 1990).to_f
                                  #=> -0.22727272727272727
end

def show_average(movies_arr)
  text_color(BRIGHT, BLUE)
  printf "Average: #{movies_average(movies_arr)}\n"
  text_color(RESET, WHITE)
end

def show_contentment(movies_arr)
  contentment = movies_slope(movies_arr)
  if contentment == 0.0
    puts "Perfectly Content"
  elsif contentment > 0.0
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
    printf "\tFound: #{movie.title}\n" +
           "\t Year: #{movie.year}\n"  +
           "\tScore: #{movie.score}\n"
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
      # Show contentment unless all the movies are from the same year
      show_contentment(movies_arr) unless movies_arr.none? do |movie|
        movie.year != movies_arr[0].year
      end
    end
  else
    break
  end
end
