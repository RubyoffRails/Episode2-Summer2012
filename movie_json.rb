require_relative "lib/movie_clerk"

clerk = MovieClerk.new
clerk.find_movie

while true do
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  if answer == "N"
    break
  else
    clerk.find_movie
  end
end
