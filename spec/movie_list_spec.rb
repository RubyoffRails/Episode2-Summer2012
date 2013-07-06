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

  it "should calculate the average year" do
    @movie_list.average_year.should eq((2000+2001+2002).to_f/3)
  end

  it "should display movie titles" do
    @movie_list.titles.should eq("movie-1, movie-2, movie-3")
  end

  it "should not add duplicated movie" do
    @movie_list.add(@movie_1)
    @movie_list.movies.count.should eq(3)
  end

  describe "#slope" do
    it "should calculate the slope of rating correctly" do
      @movie_4 = Movie.new(id: '4', title: 'movie-4', year: 2000, score: 60)
      @movie_5 = Movie.new(id: '5', title: 'movie-5', year: 2010, score: 80)
      @movie_6 = Movie.new(id: '6', title: 'movie-6', year: 2010, score: 90)

      @movie_list.add(@movie_4)
      @movie_list.add(@movie_5)
      @movie_list.add(@movie_6)

      score_of_2000 = (50+60).to_f / 2
      score_of_2010 = (80+90).to_f / 2

      @movie_list.slope.should eq((score_of_2010 - score_of_2000) / (2010 - 2000).to_f)
    end

    it "should return nil if all the movies are in the same year" do
      movie_1 = Movie.new(id: '1', title: "movie-1", year: 2000, score: 50) 
      movie_2 = Movie.new(id: '2', title: "movie-2", year: 2000, score: 60)
      movie_list = MovieList.new([movie_1, movie_2])
      
      movie_list.slope.should be_nil
    end
  end
end