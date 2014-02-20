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

  describe "#catalog" do

    it 'should add a new movie to the library whenever a search happens' do
      movie_library.catalog(movie)
      expect(movie_library.all_movies).to include (movie)
    end
    it 'should increase the movie count' do
      movie_library.catalog(movie)
      movie_library.count.should eq(1)
    end
  end

  describe "#average_rating" do

    it "should have no average rating when no movies are cataloged" do
      movie_library.average_rating(Array.new).should eq(0)
    end

    it 'should calculate the average rating' do
      movie_library.catalog(movie)
      movie_library.average_rating(movie_library.all_movies).should eq(50)
    end
  end

  describe "#average_rating_by_year" do

    it 'should have no average yearly rating when no movies are cataloged' do
      movie_library.average_rating_by_year(movie.year).should eq(0)
    end

    it 'should calculate the average rating by year when the library has' do
      movie_library.catalog(Movie.new(id: "the-id", title: "the-title", year: 1998, score: 50))
      movie_library.catalog(Movie.new(id: "the-id", title: "the-title", year: 2000, score: 50))
      movie_library.catalog(Movie.new(id: "the-id", title: "the-title", year: 1998, score: 50))
      movie_library.average_rating_by_year(1998).should eq(50)
    end
  end
end
