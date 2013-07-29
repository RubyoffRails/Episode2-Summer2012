require_relative "../lib/movie"
require_relative "../lib/movie_collection"

describe MovieCollection do
	
	let(:collection) {MovieCollection.new}
	let(:movie) {Movie.new(title: "Pulp Fiction", year: 1992, id: 233, score: 50) }
	let(:movie2) { Movie.new(title: "Run Lola Run", year: 1992, id: 233, score: 98)}
	let(:movie3) { Movie.new(title: "Run Lola Run", year: 1995, id: 233, score: 98)}
	
	it "contains a set of movies" do
		collection.movies.should eq([])
	end
	
	it "should add a movie to the collection" do
		collection.add_movie movie
		collection.movies.should eq([movie])
	end
	
	it "should not add the Not Found sentinel" do
		collection.add_movie :not_found
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
	
	it "should provide the average year for the collection" do
		collection.add_movie movie
		collection.add_movie movie2
		collection.add_movie movie3
		collection.average_year.should eq(1993)
	end
	
	it "should provide the average score per year" do
		collection.add_movie movie
		collection.add_movie movie3
		collection.add_movie movie2
		collection.average_per_year.should eq({1992 => 74, 1995 => 98})
	end
			
	it "should separate an array of movies by year" do
		movie_hash = collection.movies_by_year [movie, movie2, movie3]
		
		movie_hash.should eq({1992 => [movie, movie2], 1995 => [movie3]})
	end
	
	it "should calculate the slope of ratings from the first year to the last year of the collection" do
		collection.add_movie movie
		collection.add_movie movie2
		collection.add_movie movie3
		collection.rating_slope.should eq(8)
	end
	
	it "should return a sentintal if it can't compute the slope" do
		collection.add_movie movie
		collection.rating_slope.should eq(:need_more_data)
	end
	
end