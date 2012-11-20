require_relative '../lib/movie_search'

describe MovieSearch do
  let(:search) { MovieSearch.new }

  describe "#find_movie" do
    context "when it finds a movie" do
      before :each do
        @movie = stub(title: "valid", score: 80, year: 2001)
        @movie1 = stub(title: "second", score: 20, year: 2002)
        Api.stub(:search_by_title).with("valid").and_return @movie
        Api.stub(:search_by_title).with("second").and_return @movie1
      end

      it "returns the movie score string" do
        search.find_movie("valid").should include "Found: valid. Score: 80"
      end

      it "remembers the searched movie" do
        search.find_movie("valid")
        search.movies.should include @movie
      end
      
      it "returns the average score" do
        search.find_movie("valid")
        search.find_movie("second").should include "Avg Score: 50"
      end

      it "returns the current mood" do
        search.find_movie("valid")
        search.find_movie("second").should include "Current Mood: Getting madder!!"
      end
    end

    context "when it does not find a movie" do
      it "returns a non-movie" do
        Api.stub(:search_by_title).and_return Movie::NoMovie.new
        MovieSearch.new.find_movie("not one").should eq "The movie 'not one' was not found"
      end
    end
  end
end

