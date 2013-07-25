require_relative "../lib/movie"
require_relative "../lib/collection"

describe Collection do
	
	let(:collection) {Collection.new}
	let(:movie) {Movie.new(title: "Pulp Fiction", year: 1992, id: 233, score: 50) }
	let(:movie2) { Movie.new(title: "Run Lola Run", year: 1992, id: 233, score: 98)}
	
	it "contains a set of movies" do
		collection.movies.should eq([])
	end
	
	it "should add a movie to the collection" do
		collection.add_movie movie
		collection.movies.should eq([movie])
	end
	
	it "should not add the Not Found sentinel" do
		collection.add_movie :NotFound
		collection.movies.should eq([])
	end
	
	it "the average score of an empty collection should be zero" do
		collection.average_score.should eq(0)
	end
	
	it "should have an average score the same as the movie in a single collection" do
		
		collection.add_movie movie
		collection.average_score.should eq(50)
	end
	
	it "should provide the average score for collection" do
		collection.add_movie movie
		collection.add_movie movie2
		collection.average_score.should eq(74)
	end
		
end