def words_count(filename)
  aux = []
  file = File.open(filename, 'r')
  movies = file.readlines.map(&:chomp)
  file.close
  movies.each do |e|
    aux.push(e.split(' '))
  end
  puts aux.flatten.length
end

def string_count(filename, string)
  aux = []
  file = File.open(filename, 'r')
  movies = file.readlines.map(&:chomp)
  file.close
  movies.each do |e|
    aux.push(e.split(' '))
  end
  aux = aux.map { |e| e.count(string)}
  puts aux.inject(:+)
end

words_count('peliculas.txt')
string_count('peliculas.txt', 'El')
