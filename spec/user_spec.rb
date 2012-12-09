require_relative "../lib/user"
require_relative "../lib/movie"
describe User do

  let(:user) { User.new("Ralph") }

  context "when user is initialized" do

    it "has a name" do
      expect(user.name).to eq("Ralph")
    end

    it "has a list of movie searches" do
      expect(user.searches).to eq([])
    end
  end

  context "when a searching" do

    it "records a user's search" do
      movie = Movie.new(id: "1", title: "Some movie", year: 1985, score: 99)
      user.add_to_searches(movie)
      expect(user.searches.first).to eq(movie)
    end

    it "records multiple searches" do
      movie = Movie.new(id: "1", title: "Some movie", year: 1985, score: 99)
      user.add_to_searches(movie)
      another_movie = Movie.new(id: "2", title: "Another movie", year: 2000, score: 1)
      user.add_to_searches(another_movie)
      expect(user.searches).to eq([movie, another_movie])
    end
  end
end
