require_relative "../lib/movie"
describe Movie do

  it "should store the title, year, and score" do
    movie = Movie.new(id: "the-id", title: "the-title", year: 1998, score: 50)
    movie.id.should eq("the-id")
    movie.title.should eq("the-title")
    movie.year.should eq(1998)
    movie.score.should eq(50)
  end

  context "Adding movies and operations with them" do
    
    before do
      Movie.movies.clear if Movie.movies
      movie1 = Movie.new(id: "the-id", title: "the-title", year: 1998, score: 50)
      movie2 = Movie.new(id: 32      , title: "I'm 132"  , year: 2005, score: 100)
      movie3 = Movie.new(id: 15500   , title: "Dogs"     , year: 2013, score: 88)
      movies = [ movie1, movie2, movie3 ]
      movies.each { | movie | Movie.add_movies(movie) }
    end

    it "should add movies the user likes" do
      Movie.movies.length.should eq(3)
    end

    it "should calculate the average of the movies" do
      Movie.average.should eq(79)
    end
  end
end
