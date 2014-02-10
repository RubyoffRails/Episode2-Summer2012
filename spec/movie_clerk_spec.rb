require_relative '../lib/movie_clerk'

describe MovieClerk do
  it "finds a movie" do
    clerk = MovieClerk.new
    clerk.search_by_title("pulp fiction").first.title.should eq("Pulp Fiction")
  end

  it "should provide the average score from the movie list" do
    clerk = MovieClerk.new
    clerk.search_by_title("baseketball")
    clerk.search_by_title("goonies")
    clerk.movie_score_average.should eq(54.5)
  end

  describe "#analyze_taste" do
    it "should tell the user their taste is improving over time" do
      clerk = MovieClerk.new
      clerk.search_by_title("fargo")
      clerk.search_by_title("spaceballs")
      clerk.analyze_taste
      clerk.taste_measurement.should eq(4.444444444444445)
    end
    it "should tell the user their taste is diminishing over time" do
      clerk = MovieClerk.new
      clerk.search_by_title("gigli")
      clerk.search_by_title("fargo")
      clerk.analyze_taste
      clerk.taste_measurement.should eq(-12.571428571428571)
    end
  end

  $stdout = StringIO.new
end