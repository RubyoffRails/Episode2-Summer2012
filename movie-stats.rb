class MovieStats
  attr_reader :data
  attr_accessor :scores

  def initialize
    @data = []
  end

  def collect_movies(movie)
    data << movie
  end

  def average_rating
    sum = 0
    data.each do  |m|
      sum += m.score
    end
    puts "The average rating is: #{ sum.to_f/data.length }"
  end

  def happiness
    # years  = []
    # scores = []

    # data.each do |m|
    #   years << m.year
    #   scores << m.score
    # end

    # data.each do |m|
    #   scores << m.score
    # end
    # binding.pry
    # puts "The slope is:  #{(scores.max - scores.min)/( years.max - years.min )}"
  end
end
