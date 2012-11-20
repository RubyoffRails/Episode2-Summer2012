require_relative './movie_calcs'

class MovieSearch
  attr_accessor :movies

  def initialize
    @movies = []
  end

  def find_movie(movie_title)
    movie = Api.search_by_title(movie_title)
    if movie.class == Movie::NoMovie
      return "The movie '#{movie_title.strip}' was not found"
    else
      @movies << movie 
      return "Found: #{movie.title}. Score: #{movie.score}
      Avg Score: #{MovieCals.calc_avg_rating(@movies)}
      Current Mood: #{MovieCals.mood(@movies)} (#{MovieCals.calculate_ratings_slope(@movies)})"
    end
  end
end
