require_relative "../movie_json"
require_relative "../lib/api"
require_relative "../lib/movie"

describe MovieJson do

let(:movie)			{ Movie.new(id: "111",
              				   title: "Forrest Gump",
              				   year: 1994,
              				   score: 71)
             		}
let(:happy_movie)	{ Movie.new(id: "112",
								title: "Happy movie",
								year: 1995,
								score: 99)
					}
let(:sad_movie)	    { Movie.new(id: "113",
								title: "Sad movie",
								year: 1995,
								score: 1)
					}
let(:movie_search)  { MovieJson.new }

before do
	# Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/forrest.json")) }
	Api.stub(:search_by_title) {movie}
	# MovieJson.stub(:gets).and_return("")
end

describe "#movie_search_by_title" do
	it "should return a warning when no movie is entered into the search" do 
		# movie_search1 = MovieJson.new
		movie_search.stub(:gets).and_return("")
		movie_search.movie_search_prompt.should == "Sorry, but you have to actually enter something to search"
  	end
end

it "should allow the user to add two movies they like" do
	# movie_search2 = MovieJson.new
	movie_search.add_to_movie_list(movie)
	movie_search.add_to_movie_list(movie)
    expect(movie_search.movies.length).to eq(2)
end

describe "#average_raiting" do
  it "should give average rating of the movies in your list" do
  	# movie_search3 = MovieJson.new
	movie_search.add_to_movie_list(movie)
	movie_search.add_to_movie_list(movie)
    expect(movie_search.average_raiting).to eq(71)
  end
end

describe "#average_year" do
	it "should give the average year of the movies in your list" do
		# movie_search4 = MovieJson.new
		movie_search.add_to_movie_list(movie)
		movie_search.add_to_movie_list(movie)
	    expect(movie_search.average_year).to eq(1994)
	end
end

describe "#calculate_happiness" do
	it "should say your neutral at neutral slope" do
		# movie_search5 = MovieJson.new
		movie_search.add_to_movie_list(movie)
		movie_search.add_to_movie_list(movie)
		movie_search.calculate_happiness.should == "You're neutral"
	end

	it "should say your happier at postive slope" do
		# movie_search6 = MovieJson.new
		movie_search.add_to_movie_list(movie)
		Api.stub(:search_by_title) {happy_movie}
		movie_search.add_to_movie_list(happy_movie)
		movie_search.calculate_happiness.should == "You're getting happier!"
	end

	it "should say your sadder at negative slope" do
		# movie_search7 = MovieJson.new
		movie_search.add_to_movie_list(movie)
		Api.stub(:search_by_title) {sad_movie}
		movie_search.add_to_movie_list(sad_movie)
		movie_search.calculate_happiness.should == "You're getting sadder"
	end

	it "should take the average of years that are the same and determine slope" do
	  	# movie_search7 = MovieJson.new
		movie_search.add_to_movie_list(movie)
		Api.stub(:search_by_title) {sad_movie}
		movie_search.add_to_movie_list(sad_movie)
		Api.stub(:search_by_title) {happy_movie}
		movie_search.add_to_movie_list(happy_movie)
		movie_search.calculate_happiness.should == "You're getting sadder"
	end
end
end
