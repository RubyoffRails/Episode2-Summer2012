require_relative "../lib/movie"
require_relative "../lib/collection"

describe Collection do
	
	let(:collection) {Collection.new}
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
		collection.average_per_year.should eq({"1992" => 74, "1995" => 98})
	end
		
		describe "decompose movie array into list of movies by year"
		
		it "should return a list of lists for a single movie" do
			array_of_arrays = collection.array_of_years([], [movie], [])
			array_of_arrays.should eq([[movie]])
		end
		
		it "should put two movies with different years into different lists" do
		
		separate_list = collection.array_of_years([], [movie], [movie3])
		separate_list.should eq([[movie], [movie3]])
	end
	
	it "should put two movies with the same year in the same list" do
		
		
			separate_list = collection.array_of_years([], [movie], [movie2])
			separate_list.should eq([[movie, movie2]])
		end
			
	it "should separate a collection of movies by year" do
		collection.add_movie movie
		collection.add_movie movie2
		collection.add_movie movie3
		separate_list = collection.separate_by_years
		
		separate_list.should eq([[movie, movie2], [movie3]])
	end
end