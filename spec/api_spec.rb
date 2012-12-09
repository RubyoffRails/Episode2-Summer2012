require_relative "../lib/api"
require "ostruct"

describe Api do

  let(:movie) { Api.search_by_title("Forrest Gump") }

  before do
    Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/forrest.json")) }
  end

  it "should search for movies" do
    movie.title.should eq("Forrest Gump")
  end

  context "when movie is found" do

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

  context "when movie is not found" do

    before do
      Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/no_movie.json")) }
    end
    
    let(:no_movie_found) { Api.search_by_title("No movies exists") }

    it "doesn't raise an error" do
      expect{:no_movie_found}.to_not raise_error(NoMethodError)
    end
  end

end
