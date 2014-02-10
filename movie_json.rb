require_relative "lib/movie_clerk"

clerk = MovieClerk.new
puts clerk.welcome_message
clerk.find_movie

while true do
  puts "Search Again (Y/N)"
  answer = gets.upcase[0]
  if answer == "N"
    break
  else
    clerk.find_movie
    clerk.analyze_taste if clerk.perform_taste_analysis?
  end
end
