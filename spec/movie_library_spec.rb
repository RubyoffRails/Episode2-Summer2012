require 'rspec'
require_relative "../lib/movie"
require_relative "../lib/movie_library"
describe MovieLibrary do

  let(:movie_library) {MovieLibrary.new}
  let (:movie){Movie.new(id: "the-id", title: "the-title", year: 1998, score: 50)}
  describe "#new" do

    it 'should be a movie library object ' do
      movie_library.is_a?(MovieLibrary).should be_true
    end

    it 'should have no movies when initialized' do
      movie_library.count.should eq(0)
    end
  end

  describe "#register" do

    it 'should add a new movie to the library whenever a search happens' do
      movie_library.register(movie)
      expect(movie_library.all_movies).to include (movie)
    end
    it 'should increase the movie count' do
      movie_library.register(movie)
      movie_library.count.should eq(1)
    end
  end

  describe "#average_rating" do
    it "should have no average rating initially" do
      movie_library.average_rating.should eq(0)
    end

    xit 'should calculate the average rating' do

    end
  end
end
