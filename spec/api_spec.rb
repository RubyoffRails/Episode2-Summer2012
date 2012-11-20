require_relative "../lib/api"
require "ostruct"

describe Api do

  describe "found movie" do
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

  describe "not found movie" do
    before do
      Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/not_found.json")) }
    end

    it "should not raise an error when searching for non-existent movies" do
      expect {
        Api.search_by_title("NOTHINGFOUNDHERE")
      }.to_not raise_error
    end

    it "should have #valid? = false for the title if movie not found" do
      movie_not_found = Api.search_by_title("NOTHINGFOUNDHERE")
      movie_not_found.valid?.should eq(false)
    end
  end

end
