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


