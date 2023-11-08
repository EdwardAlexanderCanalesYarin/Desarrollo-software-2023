# Iniciando nuevo proyecto
Para iniciar un nuevo proyecto primero creamos un directorio llamado nuevoProyecto, luego debemos crear nuestro archivo Gemfile dentro de nuestro directorio nuevoProyecto con el siguiente comando:

``` ruby
bundle init 
``` 

Luego, abrimos el archivo Gemfile y agremos _gem "rspec"_. Ahora ejecutamos el siguiente comando desde directorio actual (nuevoProyecto) para installar las gemas en nuestro proyecto:

``` ruby
bundle install --path .bundle
```

Ahora creamos, en el directorio actual, las carpetas lib y spec. Copiamos el contenido de las carpetas lib y spec de esta actividad.
Para ejecutar las pruebas debemos escribir el siguiente comando:

``` ruby
bundle exec rspec spec/nombre_prueba_a_ejecutar_spec.rb
```

## Parte 1
Vamos a seguir el proceso RGB. Nuestro archivo parte1_spec.rb contiene el siguiente código:

``` ruby
# frozen_string_literal: true

require_relative '../lib/ruby_intro.rb'

describe 'Introduccion a Ruby' do
  describe '#sum' do
    it 'deberia ser definido' do
      expect { sum([1, 3, 4]) }.not_to raise_error
    end

    it 'retorna la suma correcta'  do
      expect(sum([1, 2, 3, 4, 5])).to be_a_kind_of Integer
      expect(sum([1, 2, 3, 4, 5])).to eq(15)
      expect(sum([1, 2, 3, 4, -5])).to eq(5)
      expect(sum([1, 2, 3, 4, -5, 5, -100])).to eq(-90)
    end

    it 'trabaja sobre el arreglo vacio' do
      expect { sum([]) }.not_to raise_error
      expect(sum([])).to be_zero
    end
  end

  describe '#max_2_sum' do
    it 'deberia ser definido' do
      expect { max_2_sum([1, 2, 3]) }.not_to raise_error
    end
    it 'retorna la suma correcta'  do
      expect(max_2_sum([1, 2, 3, 4, 5])).to be_a_kind_of Integer
      expect(max_2_sum([1, -2, -3, -4, -5])).to eq(-1)
    end
    it 'trabaja incluso si los dos valores mas grandes son lo mismo' do
      expect(max_2_sum([1, 2, 3, 3])).to eq(6)
    end
    it 'retorna cero si el arreglo es vacio' do
      expect(max_2_sum([])).to be_zero
    end
    it 'retorna el valor del elemento si es solo un elemento' do
      expect(max_2_sum([3])).to eq(3)
    end
  end

  describe '#sum_to_n' do
    it 'deberia ser definido' do
      expect { sum_to_n?([1, 2, 3], 4) }.not_to raise_error
    end
    it 'retorna verdadero cuando dos elementos cualesquiera se suman al segundo argumento' do
      expect(sum_to_n?([1, 2, 3, 4, 5], 5)).to be true # 2 + 3 = 5
      expect(sum_to_n?([3, 0, 5], 5)).to be true # 0 + 5 = 5
      expect(sum_to_n?([-1, -2, 3, 4, 5, -8], -3)).to be true  # maneja la suma negativa
      expect(sum_to_n?([-1, -2, 3, 4, 5, -8], 12)).to be false # 3 + 4 + 5 = 12 
      expect(sum_to_n?([-1, -2, 3, 4, 6, -8], 12)).to be false # no dos elementos que sumar
    end
    it 'retorna falso para un unico elemento del arreglo' do
      expect(sum_to_n?([0], 0)).to be false
      expect(sum_to_n?([1], 1)).to be false
      expect(sum_to_n?([-1], -1)).to be false
      expect(sum_to_n?([-3], 0)).to be false
    end
    it 'retorna falso para un arreglo vacior' do
      expect(sum_to_n?([], 0)).to be false
      expect(sum_to_n?([], 7)).to be false
    end
  end
end
```

Y el código principal tiene las siguientes líneas de código:

``` ruby
# Parte 1

def sum arr
  # COMPLETA TU CODIGO
end

def max_2_sum arr
  # COMPLETA TU CODIGO
end

def sum_to_n? arr, n
  # COMPLETA TU CODIGO
end
```
Ejecutamos la primera prueba (parte1_spec.rb) y obtemos:

![EjecucionPruebaParte1SinFormato](Image/EjecucionPruebaParte1SinFormato.png)
![EjecucionPruebaParte1ConFormato](Image/EjecucionPruebaParte1ConFormato.png)

En la primera captura, observamos el resultado .FF.FFFF.FFF, esto significa que aquellas pruebas que pasaron están representadas por un punto verde (GREEN), las pruebas que fracasaron son representadas por la letra F en color rojo (RED). En la segunda captura, al usar _format documentation_ este resultado (.FF.FFFF.FFF) es más explícito (se visualiza mejor las pruebas que tuvieron éxito (color verde) y aquellas que fracasaron (color rojo)).  Aquellas pruebas que pasaron fueron las que solo pedían argumento(s) válido(s) (deberia ser definido), por otro lado, las que fracasaron fueron aquellas que no les bastaba únicamente tener los métodos definidos ```sum(arr), max_2_sum(arr) y sum_to_n?(arr,n)``` en el código principal sino también requieren funcionalidad de los métodos mencionados.

![ResumenResultadoEjecucionPruebasParte1](Image/ResumenResultadoEjecucionPruebasParte1.png)
En esta captura se observa que de las 12 pruebas, 9 fracasaron. Luego muestra cuales fueron las que fracasaron.

Ahora escribamos código suficiente para que pasen las pruebas.
``` ruby
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
```
![EjecucionExitosaPruebaParte1](Image/EjecucionExitosaPruebaParte1.png)
En la captura se observa que pasaron todas las pruebas (color verde)
