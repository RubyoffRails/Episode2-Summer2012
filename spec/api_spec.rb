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

  it "should return the score" do
    movie.score.should eq(71)
  end

  it "should return the id" do
    movie.id.should eq(10036)
  end

  it "should return the year" do
    movie.year.should eq(1994)
  end
  
  describe "empty movie tests" do
  
    let(:emptyMovie) {Api.search_by_title("FHAHAHAHA")}
    
    before do
      Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/none_found.json"))}
    end
    
    it "should return a not found sentintel when there is no movie" do
      movie = Api.search_by_title("FHFHFHF")
      movie.should eq(:NotFound)
    end
  end
end
