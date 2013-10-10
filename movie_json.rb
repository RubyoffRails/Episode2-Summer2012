require_relative "lib/movie"
require_relative "lib/api"


def average(movies, keys)
  data = movies.map(&keys)
  average = data.inject { |sum, rating| sum + rating }.to_f/data.size
end

def calculate_slope(movies)
	movies = movies.sort_by { |i| i.year }
	slope = (movies.last.score - movies.first.score).to_f /
			  (movies.last.year - movies.first.year).to_f
			  if slope < 0
			  	puts slope
			  	puts "You're getting madder"
			  elsif slope > 0
			  	puts slope
			  	puts "You're getting better"
			  end
end

def find_movie
	puts "Hello name me a movie"
	title = gets 
   movie = Api.search_by_title(title)
	  if movie != nil	
	    puts "Found: #{movie.title}. Score: #{movie.score}"
	    movie
  else	
	     puts "sorry try again"
      end   
end

movies = []

	while true
		movies << find_movie
			if movies.last == nil
				 movies.pop
	  else
				puts "Average_Score: #{average(movies, :score)}, Average_Years: #{average(movies, :year)}"
			end

puts "Search Again (Y/N)"
answer = gets.upcase[0]
	if answer != "Y"
		puts calculate_slope(movies)
		break
	end		
end








