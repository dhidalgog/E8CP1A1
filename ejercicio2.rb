def movie_count(filename)
  file = File.open(filename, 'r')
  movies = file.readlines
  file.close
  puts movies
  movies.size
end

puts movie_count('peliculas.txt')
