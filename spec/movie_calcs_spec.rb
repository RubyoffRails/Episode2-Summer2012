require_relative '../lib/movie_calcs'

describe "#calc_average_rating" do
  it "calcs the average from a passed collection of movies" do
    new_movies = [stub(score: 20), stub(score: 30)]
    MovieCals.calc_avg_rating(new_movies).should eq 25
  end
end

describe "#calculate_slope" do
  it "calculates the slope" do
    movies = [stub(score: 20, year: 2002), stub(score: 40, year: 2000)]
    MovieCals.calculate_ratings_slope(movies).should eq -10
  end

  describe "#earliest_group" do
    it "finds the movies in the earliest year" do
      movie1, movie2, movie3 = stub(year: 1994), stub(year: 1999), stub(year: 1994)  
      movies = [movie1, movie2, movie3]
      MovieCals.earliest_group(movies).should include movie1, movie3
    end

    it "does not include later groups" do
      movie1, movie2, movie3 = stub(year: 1994), stub(year: 1999), stub(year: 1994)  
      movies = [movie1, movie2, movie3]
      MovieCals.earliest_group(movies).should_not include movie2
    end 
  end

  describe "#group_movies_by_year" do
    it "groups movies by the year it was released" do
    movie1, movie2, movie3 = stub(year: 1994), stub(year: 2002), stub(year: 1994)
    movies = [movie1, movie2, movie3]
    MovieCals.group_movies_by_year(movies).should eq [[1994, [movie1, movie3]], [2002, [movie2]]]
    end
  end

  describe "#remove_year" do
    it "flattens the grouped movies and removes the year" do
      movie1, movie2, movie3 = stub, stub, stub
      movies = [[1994, [movie1, movie3]], [2002, [movie2]]]
      MovieCals.remove_year(movies.first).should eq [movie1, movie3]
    end
  end
end

describe "#mood" do
  it "returns bad mood when slope is negative" do
    movies = [stub(score: 40, year: 2002), stub(score: 50, year: 2001)]
    MovieCals.mood(movies).should eq "Getting madder!!"
  end

  it "returns good mood when slope is positive" do
    movies = [stub(score: 50, year: 2002), stub(score: 40, year: 2001)]
    MovieCals.mood(movies).should eq "Getting happier!"
  end

  it "returns undecided if it's only the first movie" do
    movies = [stub(score: 40, year: 2001)]
    MovieCals.mood(movies).should eq "I can't decide with only one movie..."
  end

  it "returns even when there is no slope" do
    movies = [stub(score: 40, year: 2001), stub(score: 30, year: 2001)]
    MovieCals.mood(movies).should eq "Staying even ;)"
  end
  
end
