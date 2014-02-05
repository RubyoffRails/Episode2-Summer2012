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

  $stdout = StringIO.new
end