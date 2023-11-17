# Parte 1

def sum arr
  if arr.empty?
    # Si el arraglo es vacío retorna 0
    0
  else
    # Suma de forma iterativa los elementos de arr y la suma se va acumulando en suma
    arr.inject(0) {|suma, numero| suma + numero}
  end
end

def max_2_sum arr
  if arr.empty?
    # Si el arraglo es vacío retorna 0
    0
  elsif arr.size() == 1
    # Si el arraglo tiene longitud 1 retorna ese elemento
    arr[0]
  else
    maximo1 = arr.max
    posicion = arr.index(maximo1)
    # Eliminamos el elemento cuyo índice es posicion
    arr.delete_at(posicion)
    maximo2 = arr.max
    # Retorna la suma de los 2 elementos mayores de arr
    maximo1 + maximo2
  end
end

def sum_to_n? arr, n
  if arr.empty?
    # Si el arraglo es vacío retorna false
    false
  elsif arr.size() == 1
    # Si el arraglo tiene longitud 1 retorna false
    false
  else
    # Suma de dos en dos elementos y cada suma lo compara con n
    (0 .. arr.size()-2).each do |posicion1|
      (posicion1 + 1 .. arr.size()-1).each do |posicion2|
        if arr[posicion1] + arr[posicion2] == n
          # Si dos elementos del arreglo suman n retorna true
          return true
        end
      end
    end
    # En caso de que no exista dos elementos del arreglo que sumen n retorna false
    false
  end
end

# Parte 2

def hello(name)
  unless name.start_with?('"') && name.end_with('"')  # Acepta nombres entre comillas simples
    'Hello, ' + name
  end
end

def starts_with_consonant? s
  first_character = s[/\A./] # Expresion regular para coincidir con el primer caracter de la cadena
  result = first_character =~ /[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]/
  result != nil
end

def binary_multiple_of_4? s
  if /^[01]+$/.match?(s)  # Devuelve verdadero si la cadena esta compuesta solo por ceros o unos
    decimal = 0
    exponente = 0
    # Iterar sobre cada dígito del número binario en orden inverso
    s.reverse.each_char do |digito|
      decimal += digito.to_i * (2**exponente)
      exponente += 1
    end
    decimal % 4 == 0
  else
    false
  end
end

# Parte 3

class BookInStock
  # CONSTRUCTOR
  def initialize(isbn, price)
    # Verifica si el ISBN no es una cadena no vacía
    raise ArgumentError, 'ISBN no válido' unless isbn.is_a?(String) && !isbn.empty?
    # Verifica si el precio es un número positivo
    raise ArgumentError, 'Precio no válido' unless price.is_a?(Numeric) && price > 0
    # ATRIBUTOS
    @isbn = isbn
    @price = price
  end

  # GETTERS & SETTERS
  # Genera automáticamente getters y setters para :isbn y :precio
  attr_accessor :isbn, :price
  # getters & setters
  #attr_reader :isbn, :precio # para solo gettear isbn y precio
  #attr_writer :isbn, :precio # para solo settear precio

  # METODOS
  def price_as_string
    "$" + format('%.2f',@price).to_s
  end
end
