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

    it 'should inherit from vehicle' do
      movie.is_a?(Movie).should be_true
    end

    it 'should not change the movie count' do
      Movie.count.should eq(0)
    end
	end

  describe ".build" do
    
    it "records the movie when I build it" do
      movie = Movie.build(id: 10020, title: 'Pirates of the Caribbean: The Curse of the Black Pearl', year: 2003, score: 79)
      expect(Movie.all_movies).to include (movie)
    end

    it "should increment the movie count" do
      expect{Movie.build(id: 10036, title: 'Forrest Gump', year: 1994, score: 71)}.to change{Movie.count}.from(1).to(2)
    end
  end

  describe ".average_rating" do
    it "should have no average rating initially" do
      #how do you mock this scenario
    end

    it 'should calculate the average rating while ignoring the Movie#build calls above' do
      #how do you change scope for RSpec object. Or rather how do you reset the Movie object instance variables?
    end

    it "should calculate the average rating for Forrest Gump and Pirates of the...as 75 " do
      Movie.average_rating.should eq(75)
    end
  end
end
