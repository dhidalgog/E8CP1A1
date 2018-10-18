def metodo1(string1, string2)
  file = File.open('index.html', 'a')
  file.puts "\n\n<p>#{string1}</p>\n<p>#{string2}</p>"
  file.close
  nil
end

def metodo2(arreglo)
  file = File.open('index.html', 'a')
  file.puts arreglo unless arreglo.empty?
  file.close
  nil
end

def metodo3(color)
  file = File.open('index.html', 'w')
  file.puts "<style>\n\tp{\n\t\tbackground-color: #{color};\n\t}\n</style>"
  file.close
  nil
end

s1 = 'HOME'
s2 = 'NAMES:'

nombres = ['Daniel', 'Ignacio', 'Juan', 'Maria']

puts 'Ingrese color'
color = gets.chomp

metodo3(color)
metodo1(s1, s2)
metodo2(nombres)
