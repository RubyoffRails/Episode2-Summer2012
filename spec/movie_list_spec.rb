require_relative '../lib/movie'
require_relative '../lib/movie_list'

describe MovieList do
  
  before(:each) do
    @movie_list = MovieList.new
    @movie_1 = Movie.new(id: '1', title: "movie-1", year: 2000, score: 50) 
    @movie_2 = Movie.new(id: '2', title: "movie-2", year: 2001, score: 60) 
    @movie_3 = Movie.new(id: '3', title: "movie-3", year: 2002, score: 85) 

    @movie_list.add(@movie_1)
    @movie_list.add(@movie_2)
    @movie_list.add(@movie_3)
  end

  it "should keep track of the movies we added" do
    @movie_list.movies.should eq([@movie_1, @movie_2, @movie_3])
  end

  it "should calculate the average score" do
    @movie_list.average_score.should eq((50+60+85).to_f/3)
  end

  it "should display movie titles" do
    @movie_list.titles.should eq("movie-1, movie-2, movie-3")
  end

  it "should not add duplicated movie" do
    @movie_list.add(@movie_1)
    @movie_list.movies.count.should eq(3)
  end
end