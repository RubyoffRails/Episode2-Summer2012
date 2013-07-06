require_relative "../lib/movie"
describe Movie do

  it "should store the title, year, and score" do
    movie = Movie.new(id: "the-id", title: "the-title", year: 1998, score: 50)
    movie.id.should eq("the-id")
    movie.title.should eq("the-title")
    movie.year.should eq(1998)
    movie.score.should eq(50)
  end
  
  it "should be equal to other movie with the same id, title, year, score" do
    movie_1 = Movie.new(id: "1", title: "title1", year: 1998, score: 50)
    movie_2 = Movie.new(id: "1", title: "title1", year: 1998, score: 50)

    (movie_1 == movie_2).should be_true
  end
end
