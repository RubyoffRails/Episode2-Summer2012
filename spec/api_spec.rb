require_relative "../lib/api"
require "ostruct"

describe Api do 

	let(:movie) { Api.search_by_title("Forrest Gump") }

	before do 
		Api.stub(:get_url_as_json) { JSON.parse(File.read("spec/fixtures/forrest.json")) }
	end

	it "should search for movies" do
		movie = Api.search_by_title("Forrest Gump")
		movie.title.should eq("Forrest Gump")
	end

	it "should return the score" do
		movie = Api.search_by_title("Forrest Gump")
		movie.score.should eq(71)
	end

	it "should return the id" do
		movie = Api.search_by_title("Forrest Gump")
		movie.id.should eq(10036)
	end


	it "should return the year" do
		movie = Api.search_by_title("Forrest Gump")
		movie.year.should eq(1994)
	end
	
	it "should return piggy when wrong movie" do
		movie = Api.search_by_title("wofjewjfwpe")
		movie.should eq(nil)
	end

end

