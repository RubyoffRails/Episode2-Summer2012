require_relative "../lib/api"
require "ostruct"

describe Api do

  context "Existing Movie" do

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
  end

  context "Movie not found" do

     describe "should verify the presence of the movie" do

      it "should find the movie" do
        json = JSON.parse(File.read("spec/fixtures/forrest.json"))
        Api.found?(json).should eq(true)
      end

      it "should not find the movie" do
        json = JSON.parse(File.read("spec/fixtures/loquillo.json"))
        Api.found?(json).should eq(false)
      end
    end

    it "should raise error when empty search" do
      Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/loquillo.json")) }
      expect {
        Api.search_by_title("MOVIE NOT FOUND")
        }.to_not raise_error
    end
  end
end
