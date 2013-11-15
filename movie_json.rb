require_relative "lib/movie"
require_relative "lib/api"

searched_movies = Array.new

def find_movie(searched_movies)
  	puts "Add a movie you really like"
  	movie_title = gets
  	movie = Api.search_by_title(movie_title)
  	if (movie)
		puts "Found: #{movie.title}. Score: #{movie.score}. Year: #{movie.year}"
		searched_movies << movie
  	else
		puts "Not Found"
  	end
end

def calculate_happiness_slope(searched_movies)
	min_year, max_year = find_min_max_year(searched_movies)
	min_year_average = calculate_ratings_average(searched_movies, min_year)
	max_year_average = calculate_ratings_average(searched_movies, max_year)
	slope = (max_year_average - min_year_average).to_f / (max_year - min_year).to_f
	if slope >= 0
		return "happier"
	else
		return "madder"
	end
end

def calculate_ratings_average(searched_movies, year)
	sum_ratings, number_movies_in_year = 0, 0
	searched_movies.each do |movie|
		if year && movie.year == year
			sum_ratings += movie.score
			number_movies_in_year += 1
		elsif !year
			sum_ratings += movie.score
		end
	end
	if year
		(sum_ratings).to_f / number_movies_in_year
	else
		(sum_ratings).to_f / searched_movies.size
	end
end

def find_min_max_year(searched_movies)
	min_year, max_year = searched_movies.first.year, searched_movies.first.year
	searched_movies.each do |movie|
		current_movie_year = movie.year
		if current_movie_year < min_year
			min_year = current_movie_year
		elsif current_movie_year > max_year
			max_year = current_movie_year
		end
	end
	return min_year, max_year
end


find_movie (searched_movies)

while true do
	puts "Add more? (Y/N)" 
	answer = gets.upcase[0]
	if answer == "Y"
		find_movie(searched_movies)
	else
	 	puts "Your movies average rating is: #{calculate_ratings_average(searched_movies, nil)}."
	 	puts "According to your happiness slope, you are getting #{calculate_happiness_slope(searched_movies)}."
		break
	end
end
