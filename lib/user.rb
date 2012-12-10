class User
  attr_reader :name, :searches

  def initialize(name)
    @name = name
    @searches = []
  end

  def add_to_searches(movie)
    @searches << movie
  end

  def rating
    searches.delete_if { |m| m == nil } # since we are returning a string when no movie is found, I'm removing any nil values
    movie_scores = searches.map { |movie| movie.score }
    movie_scores.inject { |sum, el| sum + el } / searches.size
  end

  def average_year
    searches.delete_if { |m| m == nil }
    movie_years = searches.map { |movie| movie.year }
    movie_years.inject { |sum, el| sum + el } / searches.size
  end

  def average_rating_per_year
    years_and_scores = searches.map { |movie| { movie.liked_at.to_s => movie.score }}
    merged = Hash.new(0)
    years_and_scores.each do |h|
      h.each do |y|
        if merged[y[0]].is_a?(Array)
          merged[y[0]] << y[1]
        else
          merged[y[0]] = [y[1]]
        end
      end
    end

    output = {}
    # Compute the average
    merged.each do |m|
      output[m[0]] = m[1].inject { |sum, el| sum + el } / m[1].length
    end
    output
  end

  def calculate_slope
    avg_ratings = average_rating_per_year
    key_array = []
    avg_ratings.each_key { |key| key_array << key.to_i }
    if key_array.size > 1
      first_year = key_array.min
      last_year = key_array.max
      (avg_ratings[last_year.to_s] - avg_ratings[first_year.to_s]) / (last_year - first_year)
    else
      "No slope"
    end
  end

  def picking_ability
    if calculate_slope == "No slope"
      "not yet determined."
    else
      calculate_slope > 0 ?  "getting better." : "getting worse."
    end
  end
end

