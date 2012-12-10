require_relative "../lib/user"
require_relative "../lib/movie"
describe User do

  let(:user) { User.new("Ralph") }
  let(:movie) { Movie.new(id: "1", title: "First movie", year: 1985, score: 80) }
  let(:second_movie) { Movie.new(id: "2", title: "Second movie", year: 2000, score: 60) }
  let(:third_movie) { Movie.new(id: "3", title: "Third movie", year: 2000, score: 90) }
  

  context "when user is initialized" do

    it "has a name" do
      expect(user.name).to eq("Ralph")
    end

    it "has an empty list of movie searches" do
      expect(user.searches).to eq([])
    end

    it "can calculate the average rating per year" do
      third_movie.liked_at = 2010
      user.add_to_searches(movie)
      user.add_to_searches(second_movie)
      user.add_to_searches(third_movie)
      average_ratings = user.average_rating_per_year
      expect(average_ratings).to eq({"2012" => 70, "2010" => 90})
    end

    it "can calculate an average movie rating score" do
      user.add_to_searches(movie)
      user.add_to_searches(second_movie)
      expect(user.rating).to eq 70
    end

    it "can calculate the average year of movies liked" do
      user.add_to_searches(movie)
      user.add_to_searches(second_movie)
      expect(user.average_year).to eq(1992)
    end
  end

  context "when a searching" do

    it "records a user's search" do
      user.add_to_searches(movie)
      expect(user.searches.first).to eq(movie)
    end

    it "records multiple searches" do
      user.add_to_searches(movie)
      user.add_to_searches(second_movie)
      expect(user.searches).to eq([movie, second_movie])
    end
  end
end
