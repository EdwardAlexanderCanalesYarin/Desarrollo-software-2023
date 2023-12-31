# Practica calificada 4
## Pregunta 1
``` ruby
def grep_simplificado(cad_buscar, array_indicadores, files_to_search)
  # -n  nombre_archivo: numero de coincidencia
  if array_indicadores[0]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          # CODIGO PARA ENCONTRAR LAS COINCIDENCIAS
        end
      end
      puts nombre_del_archivo + " : "
      puts numero_de_coincidencia
    end
  end

  # -l  nombre de archivos que contiene al menos una linea de coincidencia
  if array_indicadores[1]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          # CODIGO PARA ENCONTRAR LAS COINCIDENCIAS
        end
      end
      if numero_de_coincidencia > 0
        puts nombre_del_archivo
      end
    end
  end

  # -i  numero de coincidencia (sin importar si es mayuscula o minuscula)
  if array_indicadores[2]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          # CODIGO PARA ENCONTRAR LAS COINCIDENCIAS (sin importar si es mayuscula o minuscula)
        end
      end
      puts numero_de_coincidencia
    end
  end

  # -v  numero de lineas que no coinciden
  if array_indicadores[3]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      numero_de_lineas = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          numero_de_lineas = numero_de_lineas + 1
          # CODIGO PARA ENCONTRAR LAS COINCIDENCIAS
        end
      end
      puts numero_de_lineas - numero_de_coincidencia
    end
  end

  # -x  Busca solo líneas donde la cadena de búsqueda coincida con la línea completa
  if array_indicadores[4]
    files_to_search.each do |nombre_del_archivo|
      numero_de_coincidencia = 0
      File.open(nombre_del_archivo, 'r') do |archivo|
        archivo.each_line do |linea|
          if linea == cad_buscar
            numero_de_coincidencia = numero_de_coincidencia + 1
          end
        end
      end
      puts numero_de_coincidencia
    end
  end
end

V_indicadores = [true, false, false, false, false]
cadena = "ciclo 2023-2"
V_archivos = ['cursos.txt', 'deportes.txt']
grep_simplificado(cadena, V_indicadores, V_archivos)

# INDICADORES
# -n  nombre_archivo: numero de coincidencia
# -l  nombre de archivos que contiene al menos una linea de coincidencia
# -i  numero de coincidencia (sin importar si es mayuscula o minuscula)
# -v  numero de lineas que no coinciden
# -x  Busca solo líneas donde la cadena de búsqueda coincida con la línea completa
```

El código contiene un método llamado grep_simplificado el cual tiene 3 parámetros, el 1er parámetro es una cadena a buscar, el 2do es un arreglo de valores booleanos (por ejemplo, array_indicadores[3] si es verdadero significa que se tomará en cuenta el indicador -v, caso contrario no se tomará en cuenta) y el 3ero es un arreglo de strings con los nombres de los archivos donde se hará las búsqueda.
El código muestra en pantalla respuestas acorde a lo especificado en cada indicador

- El código no ha sido terminado, aún me falta desarrollar el código para el cálculo del número de coincidencias
- Se subió los archivos .txt al repositorio y el código

## Pregunta 2
Practiquemos la herencia y la programación orientada a objetos en Javascript. Diseña 2 clases, una llamada "Pokemon" y otra llamada "Charizard". Las clases deben hacer lo siguiente:
- Clase Pokémon:
* El constructor toma 3 parámetros (HP, ataque, defensa)
* El constructor debe crear 6 campos (HP, ataque, defensa, movimiento, nivel, tipo). Los valores de (mover, nivelar, tipo) debe inicializarse en ("", 1, "").
* Implementa un método flight que arroje un error que indique que no se especifica ningún movimiento.
* Implementa un método canFly que verifica si se especifica un tipo. Si no, arroja un error. Si es así, verifica si el tipo incluye ‘’flying’. En caso afirmativo, devuelve verdadero; si no, devuelve falso.
  
- Clase Charizard:
* El constructor toma 4 parámetros (HP, ataque, defensa, movimiento)
* El constructor configura el movimiento y el tipo (para "disparar/volar") además de establecer HP, ataque y defensa como el constructor de superclase.
* Sobreescribe el método fight . Si se especifica un movimiento, imprime una declaración que indique que se está utilizando el movimiento y devuelve el campo de ataque. Si no arroja un error.  (implementa utilizando JavaScript )  (1 punto).

``` javascript
class Pokemon {
 constructor(HP, ataque, defensa) {
   this.HP = HP;
   this.ataque = ataque;
   this.defensa = defensa;
   this.movimiento = "";
   this.nivel = 1;
   this.tipo = "";
 }

 flight() {
   if (!this.movimiento) {
     throw new Error("No se especifica ningún movimiento.");
   }
   console.log("¡Volando!");
 }

 canFly() {
   if (!this.tipo) {
     throw new Error("No se especifica ningún tipo.");
   }
   return this.tipo.includes("volar");
 }
}

// Clase Charizard (hereda de Pokémon)
class Charizard extends Pokemon {
 constructor(HP, ataque, defensa, movimiento) {
   super(HP, ataque, defensa);
   this.movimiento = movimiento;
   this.tipo = "fuego/volar";
 }

 fight() {
   if (this.movimiento) {
     console.log(`Utilizando el movimiento: ${this.movimiento}`);
     return this.ataque;
   } else {
     throw new Error("No se especifica ningún movimiento.");
   }
 }
}

const charizardInstance = new Charizard(80, 120, 70, "Lanzallamas");
console.log(charizardInstance);
charizardInstance.flight();
console.log("¿Puede volar?", charizardInstance.canFly());

try {
 const charizardWithoutMove = new Charizard(80, 120, 70);
 charizardWithoutMove.fight(); // Esto debería arrojar un error
} catch (error) {
 console.error(error.message);
}
```

El resultado es el siguiente
![Clases](Image/Clases.png)

## Pregunta
Modifique la lista de películas de la siguiente manera. Cada modificación va a necesitar que realice un cambio en una capa de abstracción diferente.

a) Modifica la vista Index para incluir el número de fila de cada fila en la tabla de películas.
Para ello vamos a modificar el archivo ```'app/views/movies/index.html.erb'```. Agregamos ```<th></th>``` para tener una columna vacia al lado izquierdo, agregamos ```<td><%= movie.id %></td>``` para visualizar el número de fila de cada fila en la tabla de películas.

``` ruby
<%= link_to 'Add new movie', new_movie_path %>

<h2>All Movies</h2>

<table id="movies">
  <thead>
    <tr>
      <th></th>         
      <th>Movie Title</th>
      <th>Rating</th>
      <th>Release Date</th>
      <th>More Info</th>
    </tr>
  </thead>

  <tbody>
    <% @movies.each do |movie| %>
      <tr>
        <td><%= movie.id %></td>      
        <td><%= movie.title %></td>
        <td><%= movie.rating %></td>
        <td><%= movie.release_date %></td>
        <td><%= link_to "More about #{movie.title}", movie_path(movie) %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<div class="row bg-dark text-white">
  <div class="col-6 text-center">Title and More Info</div>
  <div class="col-2 text-center">Rating</div>
  <div class="col-4 text-center">Release Date</div>
</div>

<%= render partial: 'movie', collection: @movies %>
```

Ejecutamos el servidor y obtenemos lo siguiente: 
![NumeroFilasViewsMovies](Image/NumeroFilasViewsMovies.png)

b) Modifica la vista Index para que cuando se sitúe el ratón sobre una fila de la tabla, dicha fila cambie temporalmente su color de fondo a amarillo u otro color.
Para ello vamos a modificar el archivo ```'app/views/movies/index.html.erb'```. Agregamos: 

```
<style>
    .alternar:hover{ background-color:#FFFF00;}
</style>
```
```
<tr class="alternar">
```

``` ruby
<%= link_to 'Add new movie', new_movie_path %>

<h2>All Movies</h2>

<table id="movies">
  <thead>
  <style>
    .alternar:hover{ background-color:#FFFF00;}
  </style>
    <tr>
      <th></th>
      <th>Movie Title</th>
      <th>Rating</th>
      <th>Release Date</th>
      <th>More Info</th>
    </tr>
  </thead>

  <tbody>
    <% @movies.each do |movie| %>
      <tr class="alternar">
        <td><%= movie.id %></td>
        <td><%= movie.title %></td>
        <td><%= movie.rating %></td>
        <td><%= movie.release_date %></td>
        <td><%= link_to "More about #{movie.title}", movie_path(movie) %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<div class="row bg-dark text-white">
  <div class="col-6 text-center">Title and More Info</div>
  <div class="col-2 text-center">Rating</div>
  <div class="col-4 text-center">Release Date</div>
</div>

<%= render partial: 'movie', collection: @movies %>
```
![FilaCambiaDeColor1](Image/FilaCambiaDeColor1.png)

![FilaCambiaDeColor2](Image/FilaCambiaDeColor2.png)


c) Modifica la acción Index del controlador para que devuelva las películas ordenadas alfabéticamente por título, en vez de por fecha de lanzamiento. No intentes ordenar el resultado de la llamada que hace el controlador a la base de datos. Los gestores de bases de datos ofrecen formas para especificar el orden en que se quiere una lista de resultados y, gracias al fuerte acoplamiento entre ActiveRecord y el sistema gestor de bases de datos (RDBMS) que hay debajo, los métodos find y all de la biblioteca de ActiveRecord en Rails ofrece una manera de pedirle al RDBMS que haga esto.



d) Simula que no dispones de ese fuerte acoplamiento de ActiveRecord, y que no puedes asumir que el sistema de almacenamiento que hay por debajo pueda devolver la colección de ítems en un orden determinado. Modifique la acción Index del controlador para que devuelva las películas ordenadas alfabéticamente por título. Utiliza el método sort del módulo Enumerable de Ruby.

Para ello vamos a modificar el archivo ```'app/controllers/movies_controller.rb'```. Vamos a reemplazar ```@movies = Movie.all``` del metodo index por:  

```
@movies = Movie.order(:title).limit(26)
```

``` ruby
class MoviesController < ApplicationController
  def index
    # @movies = Movie.all
    @movies = Movie.order(:title).limit(26)
  end
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render render app/views/movies/show.html.haml by default
  end
  def new
    @movie = Movie.new
  end
  def create
    if (@movie = Movie.create(movie_params))
      redirect_to movies_path, :notice => "#{@movie.title} created."
    else
      flash[:alert] = "Movie #{@movie.title} could not be created: " +
        @movie.errors.full_messages.join(",")
      render 'new'
    end
  end
  def edit
    @movie = Movie.find params[:id]
  end
  def update
    @movie = Movie.find params[:id]
    if (@movie.update_attributes(movie_params))
      redirect_to movie_path(@movie), :notice => "#{@movie.title} updated."
    else
      flash[:alert] = "#{@movie.title} could not be updated: " +
        @movie.errors.full_messages.join(",")
      render 'edit'
    end
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, :notice => "#{@movie.title} deleted."
  end
  private
  def movie_params
    params.require(:movie)
    params[:movie].permit(:title,:rating,:release_date)
  end
end
```

Ejecutamos nuevamente el servidor y obtenemos: 

![OrdenadoPorTitle](Image/OrdenadoPorTitle.png)

Obtenemos lo pedido
