require_relative "api"

class MovieClerk
  attr_reader :welcome_message, :taste_measurement

  def initialize
    @movies = []
    @scores = []
    @welcome_message = "Welcome to The Movie Clerk!"
  end

  def find_movie
    puts "Add a movie you like:"
    movie_title = gets
    search_by_title(movie_title)
    send_movie_details(@movies.last)
  end

  def analyze_taste
    last_two_movies = @movies.last(2)
    first_movie = last_two_movies.first
    last_movie = last_two_movies.last
    @taste_measurement = (first_movie.score - last_movie.score).to_f / (first_movie.year - last_movie.year).to_f
    if @taste_measurement < 0
      puts "Your taste is diminishing over time."
    else
      puts "Your taste is improving over time."
    end
  end

  def perform_taste_analysis?
    @movies.size == 2
  end

  def search_by_title(movie_title)
    @movies << Api.search_by_title(movie_title)
  end

  def send_movie_details(movie)
    puts "Found: #{movie.title}. Score: #{movie.score}"
    puts "Average score of #{movie_score_average.round(2)} for #{@movies.count} movies on your list."
  end

  def movie_score_average
    @movies.each do |movie|
      @scores << movie.score
    end
    @scores.inject{ | sum, n | sum + n}.to_f / @scores.size
  end
end