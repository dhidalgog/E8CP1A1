#Crear un menú con 5 opciones, se debe validar que la opción escogida sea 1, 2, 3, 4, 5 o 6.
def mostrar_menu
  puts '  ----------------------------------------------------------------------------------'
  puts ' |                                   MENU                                           |'
  puts '  ----------------------------------------------------------------------------------'
  puts ' |Opción 1 - Sub-Menu Productos                                                     |'
  puts ' |Opción 2 - Stock Total de un producto                                             |'
  puts ' |Opción 3 - Mostrar los productos no registrados en cada tienda                    |'
  puts ' |Opción 4 - Filtrar por stock                                                      |'
  puts ' |Opción 5 - Registrar un nuevo producto con su respectivo stock en cada tienda     |'
  puts ' |Opción 6 - Salir                                                                  |' 
  puts "  ----------------------------------------------------------------------------------\n\n"
end

def validar_opcion(opcion)
  while opcion < 1 || opcion > 6
    system('clear')
    puts "\nLa opción ingresada no es válida"
    puts "Ingrese una opcion entre 1 y 6\n\n"
    mostrar_menu
    opcion = gets.chomp.to_i
  end
  opcion
end


#La opción 1 permite conocer la cantidad de productos existentes. Al seleccionar esta opción, se mostrará un submenú que permitirá:

def mostrar_submenu
  puts '  ----------------------------------------------------------------------------------'
  puts ' |                                  SUB-MENU                                        |'
  puts '  ----------------------------------------------------------------------------------'
  puts ' |Opción 1 - Mostrar la existencia por productos                                    |'
  puts ' |Opción 2 - Mostrar la existencia total por tienda                                 |'
  puts ' |Opción 3 - Mostrar la existencia total en todas las tiendas                       |'
  puts ' |Opción 4 - Volver                                                                 |' 
  puts "  ----------------------------------------------------------------------------------\n\n"
end

def validar_opcion2(opcion)
  while opcion < 1 || opcion > 4
    system('clear')
    puts "\nLa opción ingresada no es válida"
    puts "Ingrese una opcion entre 1 y 4\n\n"
    mostrar_menu
    opcion = gets.chomp.to_i
  end
  opcion
end
#a) Mostrar la existencia por productos.
def existencia_productos
  arr_products = []
  file = File.open('products.txt', 'r')
  products = file.readlines.map(&:chomp)
  file.close
  products.each { |e| arr_products.push(e.split(', ')) }
  arr_products.each do |e|
    puts " \n--------------------"
    e.each_index do |i|
      puts "     #{e[i]}     " if i.zero?
      puts "Tienda 1: #{e[i]}" if i == 1
      puts "Tienda 2: #{e[i]}" if i == 2
      puts "Tienda 3: #{e[i]}" if i == 3
    end
  end
end
#b) Mostrar la existencia total por tienda.
def existencia_tienda
  arr_products = []
  arr_stock = []
  file = File.open('products.txt', 'r')
  arr = file.readlines.map(&:chomp)
  file.close
  arr.each do |e|
    arr_stock.push(e.split(', '))
  end
  # Guardamos en arr_products los nombres de los productos y dejamos el stock en arr_stock
  arr_stock.each { |e| arr_products.push(e.shift) }
  # Pasamos de string a int en arr_stock
  arr_stock = arr_stock.map {|e| e.map(&:to_i)}
  # suma
  tienda1 = 0
  tienda2 = 0
  tienda3 = 0  
  arr_stock.each do |e|
    e.each_index do |i|
      tienda1 += e[i] if i.zero?
      tienda2 += e[i] if i == 1
      tienda3 += e[i] if i == 2
    end
  end
  puts "Suma total por tienda\n Tienda1: #{tienda1}\n Tienda2: #{tienda2}\n Tienda3: #{tienda3}"
end

#c) Mostrar la existencia total en todas las tiendas.
def existencia_total
  arr_products = []
  arr_stock = []
  file = File.open('products.txt', 'r')
  arr = file.readlines.map(&:chomp)
  file.close
  arr.each do |e|
    arr_stock.push(e.split(', '))
  end
  # Guardamos en arr_products los nombres de los productos y dejamos el stock en arr_stock
  arr_stock.each { |e| arr_products.push(e.shift) }
  # Pasamos de string a int en arr_stock
  arr_stock = arr_stock.map {|e| e.map(&:to_i)}
  puts "Stock total en tiendas:"
  puts arr_stock.flatten.inject(:+)
end
#La opción 2 permite que el usuario ingrese el nombre de un producto y el programa responderá con la cantidad de stock total (suma en las bodegas) de ese producto.
def product_stock(product)
  arr_stock = []
  arr_products = []
  file = File.open('products.txt', 'r')
  arr = file.readlines.map(&:chomp)
  file.close
  arr.each do |e|
    arr_stock.push(e.split(', '))
  end
 # Guardamos en arr_products los nombres de los productos y dejamos el stock en arr_stock
  arr_stock.each { |e| arr_products.push(e.shift) }
 # Pasamos de string a int en arr_stock
  arr_stock = arr_stock.map {|e| e.map(&:to_i)}
  # Suma total del producto en todas las tiendas
  arr_products.each_index do |i|
    return puts arr_stock[i].inject(:+) if arr_products[i] == product
  end
  puts "Producto no encontrado"
end

#La opción 3 muestra los productos no registrados en cada bodega.
def nr_products
  arr_stock = []
  arr_products = []
  file = File.open('products.txt', 'r')
  arr = file.readlines.map(&:chomp)
  file.close
  arr.each do |e|
    arr_stock.push(e.split(', '))
  end
 # Guardamos en arr_products los nombres de los productos y dejamos el stock en arr_stock
  arr_stock.each { |e| arr_products.push(e.shift) }
  # Productos no registrados
  arr_stock.each_index do |j|
    arr_stock[j].each_index do |i|
      puts "#{arr_products[j]} Tienda #{i+1}: NR" if arr_stock[j][i] == 'NR'
    end
  end
end
#La opción 4 permite conocer los productos con una existencia total menor a un valor ingresado por el usuario.
def et_producto_u(stock)
  arr_stock = []
  arr_products = []
  file = File.open('products.txt', 'r')
  arr = file.readlines.map(&:chomp)
  file.close
  arr.each do |e|
    arr_stock.push(e.split(', '))
  end
 # Guardamos en arr_products los nombres de los productos y dejamos el stock en arr_stock
  arr_stock.each { |e| arr_products.push(e.shift) }
  # Pasamos de string a int en arr_stock
  arr_stock = arr_stock.map {|e| e.map(&:to_i)}
  # Aqui viene lo weno
  arr_stock.each_index do |i|
    puts "#{arr_products[i]}: #{arr_stock[i].inject(:+)}" if arr_stock[i].inject(:+) < stock
  end
end
#La opción 5 permite registrar un nuevo producto con su respectivo stock en cada bodega. (Hint: abrir el archivo como append).
def add_product(product, s1, s2, s3)
  file = File.open('products.txt', 'a')
  file.print "#{product}, #{s1}, #{s2}, #{s3}\n"
  file.close
end
# main

system('clear')
puts "Bienvenido\n"
opcion = 0
while opcion != 6
  mostrar_menu
  puts "\nIngrese una opcion"
  opcion = gets.chomp.to_i
  opcion = validar_opcion(opcion)
  system('clear')
  case opcion
  when 1
    puts "Opción 1 - Sub-Menu Productos"
    opcion2 = 0
    while opcion2 != 4
      mostrar_submenu
      puts "\nIngrese una opción"
      opcion2 = gets.chomp.to_i
      opcion2 = validar_opcion2(opcion2)
      system('clear')
      case opcion2
      when 1
        puts "Opción 1 - Mostrar la existencia por productos\n\n"
        existencia_productos
      when 2
        puts "Opción 2 - Mostrar la existencia total por tienda\n\n"
        existencia_tienda
      when 3
        puts "Opción 3 - Mostrar la existencia total en todas las tiendas\n\n"
        existencia_total
      end
    end
  when 2
    puts "Opción 2 - Stock Total de un producto "
    puts "Ingrese producto:"
    product = gets.chomp
    product_stock(product)
  when 3
    puts "Opción 3 - Mostrar los productos no registrados en cada tienda"
    nr_products
  when 4
    puts "Opción 4 - Filtrar por stock"
    puts "Ingrese stock:"
    stock = gets.chomp.to_i
    puts "Productos con menor stock total a: #{stock}"
    et_producto_u(stock)
  when 5
    puts "Opción 5 - Registrar un nuevo producto con su respectivo stock en cada tienda"
    puts "Ingrese nombre del producto:"
    product_name = gets.chomp
    puts "Ingrese stock tienda 1:"
    stock1 = gets.chomp
    puts "Ingrese stock tienda 2:"
    stock2 = gets.chomp
    puts "Ingrese stock tienda 3:"
    stock3 = gets.chomp
    add_product(product_name, stock1, stock2, stock3)
  end
end

system('clear')
puts 'bye'
