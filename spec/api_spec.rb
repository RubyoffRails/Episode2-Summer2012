require_relative "../lib/api"

require "ostruct"

describe Api do
	context '#movie not found' do
		let(:movie) { Api.search_by_title('abcdkdjfakdj') }

		before do
			Api.stub(:get_url_as_json) {
				JSON.parse(File.read('spec/fixtures/not_found.json'))	
			}
		end

		it 'should search for movie and return nothing' do
			movie.should be_nil
		end
	
		it 'should have found nothing' do
			result = {'movies' => []}
			Api.found?(result).should be_false
		end
	end


	context '#movie not found when no search term' do
		let(:movie) { Api.search_by_title('') }

		before do
			Api.stub(:get_url_as_json) {
				JSON.parse(File.read('spec/fixtures/no_val.json'))
			}
		end	

		it 'should search for movie and return nothing' do
			movie.should be_nil
		end

		it 'should have found nothing' do
			result = {}
			Api.found?(result).should be_false
		end
	end


	context '#movie found' do
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

		it 'should have found a movie' do
			result = {'movies' => [{"id"=>"470554171", "title"=>"Ratatouille", "year"=>2007,"ratings"=>{"critics_rating"=>"Certified Fresh", "critics_score"=>96}}]}
			Api.found?(result).should be_true
		end
	end

end
