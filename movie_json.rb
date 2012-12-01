require_relative "lib/movie"
require_relative "lib/api"

def get_average(movies)
  averages = []

  movies.each do |m|
    averages << m.score
  end

  averages.inject{ |sum, el| sum + el }.to_f / averages.size

end

def find_movie
  puts "Add a movie you really like"
  movie_title = gets
  @movies = [] if @movies.nil?

  begin
    @movies << Api.search_by_title(movie_title)
    puts "Found: #{@movies.last.title}. Score: #{@movies.last.score}. Avg. Score: #{get_average(@movies)}"
  rescue Api::MovieNotFoundError
    puts "Movie was not found :( :( "
  end

end

find_movie

while true do
  puts "Search Again (Y/N)" 
  answer = gets.upcase[0]
  if answer == "Y"
    find_movie
  else
    break
  end
end
