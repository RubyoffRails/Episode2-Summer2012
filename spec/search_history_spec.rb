require_relative "../lib/search_history"
describe Search_History do
  it "should store a search history" do
    search_history = Search_History.new
    search_history.add_search(Api.search_by_title("Forrest Gump"))
    search_history.movies.count.should eq(1)
  end

  it "should store latest seach history" do
    search_history = Search_History.new
    search_history.add_search(Api.search_by_title("Forrest Gump"))
    search_history.movies.last.title.should eq("Forrest Gump")
  end

  it "should get average rating for search history" do
    search_history = Search_History.new
    search_history.add_search(Api.search_by_title("Forrest Gump"))
    search_history.add_search(Api.search_by_title("Joe Dirt"))
    search_history.movies.count.should eq(2)
    search_history.average_rating.should eq(41)
  end

  it "should have the average year for the ratings" do
    search_history = Search_History.new
    search_history.add_search(Api.search_by_title("Forrest Gump"))
    search_history.add_search(Api.search_by_title("Joe Dirt"))
    search_history.average_year_for_ratings.should eq(1997)
  end

  it "should have the average rating for the max year" do
    search_history = Search_History.new
    search_history.add_search(Api.search_by_title("Forrest Gump"))
    search_history.add_search(Api.search_by_title("Joe Dirt"))
    search_history.average_rating_for_max_year.should eq(11)
  end

  it "should have the average rating for the min year" do
    search_history = Search_History.new
    search_history.add_search(Api.search_by_title("Forrest Gump"))
    search_history.add_search(Api.search_by_title("Joe Dirt"))
    search_history.add_search(Api.search_by_title("Ace Ventura"))
    search_history.average_rating_for_min_year.should eq(58)
  end

  it "should have the max year" do
    search_history = Search_History.new
    search_history.add_search(Api.search_by_title("Forrest Gump"))
    search_history.add_search(Api.search_by_title("Joe Dirt"))
    search_history.add_search(Api.search_by_title("Ace Ventura"))
    search_history.max_year.should eq(2001)
  end

  it "should have the min year" do
    search_history = Search_History.new
    search_history.add_search(Api.search_by_title("Forrest Gump"))
    search_history.add_search(Api.search_by_title("Joe Dirt"))
    search_history.add_search(Api.search_by_title("Ace Ventura"))
    search_history.min_year.should eq(1994)
  end

  it "should have the ratings trend" do
    search_history = Search_History.new
    search_history.add_search(Api.search_by_title("Forrest Gump"))
    search_history.add_search(Api.search_by_title("Joe Dirt"))
    search_history.add_search(Api.search_by_title("Ace Ventura"))
    search_history.ratings_trend.should eq(-7)
  end
end
