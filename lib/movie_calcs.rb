class MovieCals
  def self.calc_avg_rating(movies=@movies)
    movies.inject(0.0) { |sum, movie| sum + movie.score } / movies.length
  end

  def self.earliest_group_avg(movies)
    calc_avg_rating(earliest_group(movies))
  end

  # returns a multitiered array grouped by year and sorted 
  # starting array = [movie1(year: 1994), movie2(year: 2002), movie3(year: 1994)]
  # returns [[1994, [movie1, movie3]], [2002, [movie2]]]
  def self.group_movies_by_year(movies)
    movies.group_by{|m| m.year}.sort
  end

  def self.earliest_group(movies)
    grouped_movies = group_movies_by_year(movies)
    movies = remove_year(grouped_movies.first)
  end

  #cleans up a multitiered array to flatten the array and remove the year
  def self.remove_year(movies_for_year)
    movies_for_year.flatten[1..-1]
  end

  def self.earliest_year(movies)
    movies.map{ |m| m.year}.sort.first
  end

  def self.latest_group_avg(movies)
    calc_avg_rating(latest_group(movies))
  end

  def self.latest_group(movies)
    grouped_movies = group_movies_by_year(movies)
    movies = remove_year(grouped_movies.last)
  end
  
  def self.latest_year(movies)
    movies.map{ |m| m.year}.sort.last
  end

  def self.calculate_ratings_slope(movies=@movies)
    ey = earliest_year(movies)
    ly = latest_year(movies)
    ea = earliest_group_avg(movies)
    la = latest_group_avg(movies)
    slope = (la - ea).to_f / (ly - ey).to_f
  end

  def self.mood(movies)
    slope = calculate_ratings_slope(movies)
    return "I can't decide with only one movie..." if movies.count == 1
    if slope > 0
      "Getting happier!"
    elsif slope < 0 
      "Getting madder!!"
    else
      "Staying even ;)"
    end

  end
end
