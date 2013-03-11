require_relative "../lib/api"
require "ostruct"

describe Api do

  context "valid movie title" do

    let(:movie) { Api.search_by_title("Forrest Gump") }

      before do
        expect {
          Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/forrest.json")) }
        }.to_not raise_error
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

  context "invalid movie title" do
    let(:movie) { Api.search_by_title("hgh") }

      before do
        expect {
          Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/invalid.json")) }
        }.to_not raise_error
      end

      it "should return :no_movie_found" do
        movie.should eq(:no_movie_found)
      end

  end


end
