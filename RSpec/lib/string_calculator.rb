# lib/string_calculator.rb
class StringCalculator
  def self.add(input)
    if input.empty?
      0
    else
      #input.to_i # Convierte a entero, si no es posible devuelve 0
      numbers = input.split(",").map { |num| num.to_i }
      # split: se utiliza para dividir una cadena (string) en partes más pequeñas basándose en un delimitador específico. El resultado es un array de las partes separadas.
      # map: es un método de los objetos de tipo Enumerable que permite transformar una colección de datos aplicando una operación a cada elemento y devolviendo un nuevo array con los resultados de dichas operaciones.
      numbers.inject(0) { |sum, number| sum + number }
      # numbers.inject(0): Esto indica que se va a realizar una operación de acumulación en el array numbers, comenzando con un valor inicial de 0. 
    end
  end
end
