require_relative "../lib/api"
require "ostruct"

describe Api do
  describe ".search_by_title" do
    context "when title found" do
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

      it "should add the search result to movie_list"
    end

    context "when title not found" do
      let(:movie) { Api.search_by_title("asdfasdfasdf") }

      before do
        Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/no_result.json")) }
      end

      it "should return a not found title" do
        movie.title.should eq("no results")
      end
    end
  end
end
