require 'rspec'
require_relative "../lib/movie_library"
describe MovieLibrary do

  let(:movie_library) {MovieLibrary.new}
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
      movie = mock(:movie)
      expect(MovieLibrary.all_movies).to include (movie)
    end
    xit 'should increase the movie count' do

    end
  end
end
