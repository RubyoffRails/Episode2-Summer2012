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
    searches.inject { |sum, el| sum.score + el.score } / searches.size
  end

  def average_year
    searches.inject { |sum, el| sum.year + el.year } / searches.size
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
end

