require 'rspec'
require_relative "../lib/movie"
require_relative "../lib/movie_library"
describe MovieLibrary do

  let(:movie_library) {MovieLibrary.new}
  let (:movie){Movie.new(id: "the-id", title: "the-title", year: 1998, score: 50)}
  let (:another_movie){Movie.new(id: "the-id", title: "the-title", year: 2012, score: 50)}
  let (:yet_another_movie){Movie.new(id: "the-id", title: "the-title", year: 1990, score: 45)}
  describe "#new" do

    it 'should be a movie library object ' do
      movie_library.is_a?(MovieLibrary).should be_true
    end

    it 'should have no movies when initialized' do
      movie_library.count.should eq(0)
    end
  end

  describe "#add" do

    it 'should add a new movie to the library whenever a search happens' do
      movie_library.add(movie)
      expect(movie_library.all_movies).to include (movie)
    end
    it 'should increase the movie count' do
      movie_library.add(movie)
      movie_library.count.should eq(1)
    end
  end

  describe "#average_rating" do

    it "should have no average rating when no movies are cataloged" do
      movie_library.average_rating(Array.new).should eq(0)
    end

    it 'should calculate the average rating' do
      movie_library.add(movie)
      movie_library.average_rating(movie_library.all_movies).should eq(50)
    end
  end

  describe "#average_rating_by_year" do

    it 'should have no average yearly rating when no movies are cataloged' do
      movie_library.average_rating_by_year(movie.year).should eq(0)
    end

    it 'should calculate the average rating by year when the library has' do
      movie_library.add(movie)
      movie_library.add(another_movie)
      movie_library.add(yet_another_movie)
      movie_library.average_rating_by_year(1998).should eq(50)
    end
  end

  describe "#sort_by_year" do

    it 'should sort the movies by year' do
      movie_library.add(another_movie)
      movie_library.add(yet_another_movie)
      movie_library.catalog.should == [yet_another_movie, another_movie]
    end
  end

  describe "#calculate_slope" do

    it "should have no slope when the library only contains one movie" do
      movie_library.add(movie)
      movie_library.slope.should eq(0)
    end
    it 'should calculate the slope of the average ratings from the first year to the last year' do
      movie_library.add(another_movie)
      movie_library.add(yet_another_movie)
      movie_library.slope.should eq(-0.22727272727272727)
    end

  end
end
