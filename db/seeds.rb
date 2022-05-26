require "json"
require "open-uri"

url = 'http://tmdb.lewagon.com/movie/top_rated'
api_movie_serialized = URI.open(url).read
api_movie = JSON.parse(api_movie_serialized)

create_movie = api_movie['results']
create_movie.each do |m|
  movie = Movie.create(
    title: m['title'],
    overview: m['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{m["poster_path"]}",
    rating: m['vote_average']
  )
  puts movie.title
end
