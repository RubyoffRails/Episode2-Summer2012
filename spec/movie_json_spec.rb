require_relative "../movie_json"
require_relative "../lib/api"
require_relative "../lib/movie"

describe MovieJson do

let(:movie)        { Movie.new(id: "111",
              title: "Forrest Gump",
              year: 1992,
              score: 71)
             }

before do
	# Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/forrest.json")) }
	Api.stub(:search_by_title) {movie}
	# MovieJson.stub(:gets).and_return("")
end

describe "#movie_search_by_title" do
	it "should return a warning when no movie is entered into the search" do 
		movie_search = MovieJson.new
		movie_search.stub(:gets).and_return("")
		movie_search.movie_search_by_title.should == "Sorry, but you have to actually enter something to search"
  	end
end

it "should allow the user to add two movies they like" do
	movie_search = MovieJson.new
	movie_search.add_to_movie_list(movie)
	movie_search.add_to_movie_list(movie)
    expect(movie_search.movies.length).to eq(2)
end

describe "@calculate_happiness" do
  it "should give average happiness of the movies in your list" do
    movie_search = MovieJson.new
	movie_search.add_to_movie_list(movie)
	movie_search.add_to_movie_list(movie)
    expect(movie_search.calculate_happiness).to eq(71)
  end
end

end