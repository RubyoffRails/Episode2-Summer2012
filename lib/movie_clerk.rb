require_relative "api"

class MovieClerk
  def initialize
    @movies = []
    @scores = []
    puts "Welcome to The Movie Clerk!"
  end

  def find_movie
    puts "Add a movie you like:"
    movie_title = gets
    search_by_title(movie_title)
    send_movie_details(@movies.last)
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