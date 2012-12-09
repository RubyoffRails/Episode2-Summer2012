require_relative "../lib/user"
require_relative "../lib/movie"
describe User do

  let(:user) { User.new("Ralph") }
  let(:movie) { Movie.new(id: "1", title: "Some movie", year: 1985, score: 80) }
  let(:another_movie) { Movie.new(id: "2", title: "Another movie", year: 2000, score: 60) }

  context "when user is initialized" do

    it "has a name" do
      expect(user.name).to eq("Ralph")
    end

    it "has an empty list of movie searches" do
      expect(user.searches).to eq([])
    end

    it "can calculate an average movie rating score" do
      user.add_to_searches(movie)
      user.add_to_searches(another_movie)
      expect(user.rating).to eq(70)
    end

    it "can calculate the average year of movies liked" do
      user.add_to_searches(movie)
      user.add_to_searches(another_movie)
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
      user.add_to_searches(another_movie)
      expect(user.searches).to eq([movie, another_movie])
    end
  end
end
