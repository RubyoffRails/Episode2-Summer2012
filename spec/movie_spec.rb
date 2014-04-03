require 'rspec'
require_relative "../lib/movie"
describe Movie do

	describe "#new" do

    let (:movie){Movie.new(id: "the-id", title: "the-title", year: 1998, score: 50)}

	  it "should store the title, year, and score" do
	    movie.id.should eq("the-id")
	    movie.title.should eq("the-title")
	    movie.year.should eq(1998)
	    movie.score.should eq(50)
	  end

    it 'should a movie object' do
      movie.is_a?(Movie).should be_true
    end
	end

end
