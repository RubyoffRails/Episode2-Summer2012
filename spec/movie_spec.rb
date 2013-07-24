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
      movie4 = Movie.new(id: "the-id", title: "Titanic"  , year: 1998, score: 110)
      movie5 = Movie.new(id: "the-id", title: "2012"     , year: 2012, score: 77)

      movies = [ movie1, movie2, movie3, movie4, movie5 ]
      movies.each { | movie | Movie.add_movies(movie) }
    end

    it "should add movies the user likes" do
      Movie.movies.length.should eq(5)
    end

    it "should calculate the average of the movies score" do
      Movie.average_score.should eq(85)
    end

    it "should calculate the average of the movies year" do
      Movie.average_year.should eq(2005)
    end
  end

  context "First and last year" do
    it "should obtain the movie with the oldest year" do
      movie = Movie.oldest_movie
      movie.title.should eq("the-title")
    end

    it "should obtain the movie with the newest year" do
      movie = Movie.newest_movie
      movie.title.should eq("Dogs")
    end
  end

  context "Sloping" do
    it "should calculate the slope from the first year to the last year" do
      Movie.slope.should eq(2.533)
    end

    it "should determine if the user is getting happier" do
      Movie.user_satisfaction.should eq("Happier")
    end
  end
end
