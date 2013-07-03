require_relative "../lib/api"
require "ostruct"

describe Api do
  context "Movie existed" do
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

  context "Movie not existed" do
  
    before do
      Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/no_result.json")) }
    end

    it "should not raise exception" do
      expect {
        Api.search_by_title("NOTHINGFOUNDHERE")
      }.to_not raise_error
    end

    it "should return nil" do
      movie = Api.search_by_title("NOTHINGFOUNDHERE")
      movie.should be_nil
    end
  end
end
