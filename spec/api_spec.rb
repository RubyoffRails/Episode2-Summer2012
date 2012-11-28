require_relative "../lib/api"
require "ostruct"

describe Api do
  context "Missing Movie" do
    describe "Empty Search" do
      it "should not throw an error" do
        expect {
          Api.search_by_title("NOTHINGFOUNDHERE")
        }.to_not raise_error
      end
      it "should have the title 'NOTHINGFOUNDHERE'" do
        movie = Api.search_by_title("")
        movie.title.should eq("NOTHINGFOUNDHERE")
      end
    end
  end

  context "Valid Movie" do
    let(:movie) { Api.search_by_title("Forrest Gump") }

    before do
      Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/forrest.json")) }
    end

    it "should search for movies" do
      movie.title.should eq("Forrest Gump")
    end

    it "should return the score" do
      movie.score.should eq(71)
    end

    it "should return the id" do
      movie.id.should eq(10036)
    end

    it "should return the year" do
      movie.year.should eq(1994)
    end
    
    it "should be able to reset the search history" do
      Api.reset_search_history
      Api.get_search_history.count.should eq(0)
    end
  end

  context "Search History" do
    it "should store latest search history" do
      movie = Api.search_by_title("Forrest Gump")
      Api.get_search_history.count.should eq(1)
    end    
  end
end
