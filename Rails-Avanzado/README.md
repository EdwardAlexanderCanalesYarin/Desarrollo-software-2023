# Rails-Avanzado
Creamos un directorio llamado _Rails-Avanzado_, luego clonamos el repositorio de la [actividad](https://github.com/kapumota/Desarrollo-software-2023/tree/main/Semana7/myrottenpotatoes), nos interesa la carpeta llamada ```myrottenpotatoes```. Esta carpeta contiene varias carpetas y archivos, entre los cuales el archivo Gemfile. Nos dirigimos al directorio ```'Rails-Avanzado/myrottenpotatoes'``` desde la terminal y ejecutamos el comando ```bundle install```, luego para iniciar nuestro servidor web local que escucha en un puerto específico (por defecto, el puerto 3000) ejecutamos el siguiente comando ```bin/rails server```, podemos acceder a nuestra aplicación a través de un navegador web visitando [http://localhost:3000](http://localhost:3000).

![BinRailsServer](Image/BinRailsServer.png)

Error mostrado desde navegador
![ErrorMostradoEnLaTerminal](Image/ErrorMostradoEnLaTerminal.png)

Error mostrado desde la terminal
![ErrorSetCurrentUser](Image/ErrorSetCurrentUser.png)

El error mostrado es ```ActiveRecord::StatementInvalid in MoviesController#index```, además nos especifica donde posiblemente se encuentra el error (```app/controllers/application_controller.rb:11:in `set_current_user'```). Al dirigirnos al archivo ```'app/controllers/movies_controller.rb'``` observamos que el método index de la clase MoviesController tiene la siguiente línea ```@movies = Movie.all```, para corregir este error, vamos a cambiar Moviegoer por Movie en el método ```set_current_user``` en el archivo ```application_controller.rb```

![NuevoError](Image/NuevoError.png)
Visualizamos que el error ha cambiado, ahora es un error de sintaxis. Este problema se encuentra en el archivo ```app/models/movie.rb```

![CorreccionDeMovie](Image/CorreccionDeMovie.png)
Quitamos los comentarios y ejecutamos nuevamente el servidor.

![QuitarComentarios](Image/QuitarComentarios.png)

![EjecucionExitosa](Image/EjecucionExitosa.png)




