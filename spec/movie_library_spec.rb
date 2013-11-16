require_relative '../lib/movie_library'
describe MovieLibrary do

  let(:library) { MovieLibrary.new }
  let(:empire) { double("movie", title: "Empire Records", year: 2000, score: 90) }
  let(:donnie) { double("movie", title: "Donnie Darko", year: 2002, score: 100) }

  it "should store movies" do
    library.add(empire)

    expect(library.movies.first).to eq(empire)
  end

  it "should be able to store multiple movies" do
    library.add(empire)
    library.add(donnie)

    expect(library.movies.length).to eq(2)
  end

  it "should show 0 as average score if mo movies" do
    expect(library.average_score).to eq(0)
  end

  it "should calculate average score of movies" do
    library.add(empire)
    library.add(donnie)

    expect(library.average_score).to eq(95)
  end

  it "should calculate average year of movies" do
    library.add(empire)
    library.add(donnie)

    expect(library.average_year).to eq(2001)
  end

  it "should calculate slope of movies" do
    library.add(empire)
    library.add(donnie)

    expect(library.slope).to eq(5)
  end

end
