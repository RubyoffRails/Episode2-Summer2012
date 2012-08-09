class MovieCals
  def self.calc_avg_rating(movies=@movies)
    movies.inject(0.0) { |sum, movie| sum + movie.score } / movies.length
  end

  def self.earliest_group_avg(movies)
    calc_avg_rating(earliest_group(movies))
  end

  def self.earliest_group(movies)
    movies.group_by{|m| m.year}.sort.first.flatten[1..-1]
  end

  def self.earliest_year(movies)
    movies.map{ |m| m.year}.sort.first
  end

  def self.latest_group_avg(movies)
    calc_avg_rating(latest_group(movies))
  end

  def self.latest_group(movies)
    movies.group_by{ |m| m.year}.sort.last.flatten[1..-1]
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
    if slope > 0
      "Getting happier!"
    elsif slope < 0 
      "Getting madder!!"
    else
      "Staying even ;)"
    end

  end
end
