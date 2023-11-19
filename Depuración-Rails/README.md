En el siguiente fragmento de código muestra un escenario en el que un controlador carga un objeto desde la base de datos, pero no verifica si existe antes de pasarlo a la vista.

``` ruby
# in controller action:
def show
  @movie = Movie.find_by_id(params[:id]) # what if this movie not in DB?
  # BUG: we should check @movie for validity here!
end
-# ...later, in the Haml view:

%h1= @movie.title
-# will give "undefined method 'title' for nil:NilClass" if @movie is nil
``` 
Esto puede llevar a un error "undefined method 'title' for nil:NilClass" si el objeto no se encuentra en la base de datos.

Podemos utilizar un sistema de registro de errores (logger) para registrar errores y eventos importantes en la aplicación. Esto nos ayudará a depurar problemas cuando ocurran y a comprender lo que sucede en la aplicación. Con ello podemos buscar en la documentación y en la comunidad de desarrolladores, y ser específico en las preguntas que vamos a formular, esto nos ayudará a resolver problemas de manera efectiva y solucionarlos antes de que lleguen a producción.
