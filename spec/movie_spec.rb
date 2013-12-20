require_relative "../lib/movie"
require_relative "../movie_json"

# describe "#movie_search_by_title" do
# 	it "should return a warning when no movie is entered into the search" do 
# 		expect(movie_search_by_title).to eq(String)
#   	end
# end

describe Movie do

  it "should store the title, year, and score" do
    movie = Movie.new(id: "the-id", title: "the-title", year: 1998, score: 50)
    movie.id.should eq("the-id")
    movie.title.should eq("the-title")
    movie.year.should eq(1998)
    movie.score.should eq(50)
  end
  
end
