require_relative '../lib/movie_history.rb'

describe MovieHistory do
  before do
    MovieHistory.searches.clear if MovieHistory.searches
  end

  it "should return the history" do
    user_searches = ["Forrest Gump", "Not Found", "Titanic", "Click"]
    user_searches.each do | search |
      MovieHistory.add_search(search)
    end
    MovieHistory.searches.should eq(user_searches)
  end
end