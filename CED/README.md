# Código limpio, manejo de excepciones, depuración
## Clean Code and the Art of Exception Handling
Vamos a utilizar el siguiente [tutorial para Ruby](https://www.toptal.com/abap/clean-code-and-the-art-of-exception-handling) en la actividad ActiveRecord.

Las excepciones son un elemento fundamental de la programación moderna y no hay nada que temer. Implemente estas mejores prácticas de manejo de excepciones para escribir código limpio que sea más fácil de mantener.
Las excepciones son tan antiguas como la programación misma. En los días en que la programación se realizaba en hardware o mediante lenguajes de programación de bajo nivel, se usaban excepciones para alterar el flujo del programa y evitar fallas de hardware. Hoy, Wikipedia define las excepciones como: ```condiciones anómalas o excepcionales que requieren un procesamiento especial, lo que a menudo cambia el flujo normal de ejecución del programa...``` Y que manejarlos requiere: ```construcciones de lenguajes de programación especializados o mecanismos de hardware informático.```

Por lo tanto, las excepciones requieren un tratamiento especial y una excepción no controlada puede provocar un comportamiento inesperado. Los resultados suelen ser espectaculares. En 1996, el famoso [fallo en el lanzamiento del cohete Ariane 5](https://en.wikipedia.org/wiki/Ariane_flight_V88#Launch_failure) se atribuyó a una excepción de desbordamiento no controlada. Los peores errores de software de la historia contienen algunos otros errores que podrían atribuirse a excepciones no controladas o mal controladas.

Con el tiempo, estos errores, y muchos otros (que tal vez no fueron tan dramáticos, pero sí catastróficos para los involucrados) contribuyeron a la impresión de que las excepciones son malas.

Pero las excepciones son un elemento fundamental de la programación moderna; existen para mejorar nuestro software. En lugar de temer las excepciones, deberíamos aceptarlas y aprender a beneficiarnos de ellas. En este artículo, **analizaremos cómo gestionar las excepciones de forma elegante y utilizarlas para escribir código limpio que sea más fácil de mantener**.

### Exception Handling: It’s a Good Thing
Con el auge de la programación orientada a objetos (POO), el soporte de excepciones se ha convertido en un elemento crucial de los lenguajes de programación modernos. Hoy en día, la mayoría de los lenguajes cuentan con un sólido sistema de manejo de excepciones. Por ejemplo, Ruby proporciona el siguiente patrón típico:
``` ruby
begin
  do_something_that_might_not_work!
rescue SpecificError => e
  do_some_specific_error_clean_up
  retry if some_condition_met?
ensure
  this_will_always_be_executed
end
```



## Error Handling and Debugging Techniques in JavaScript: Best Practices
Leemos el [tutorial para Java Script](https://codedamn.com/news/javascript/error-handling-debugging) y respondemos a la pregunta ¿Qué diferencias encuentras en el tutorial para Ruby y el tutorial para Java Script?



## How to Set Up a Microservices Architecture in Ruby: A Step-by-Step Guide
Leemos y replicamos el [tutorial](https://www.toptal.com/ruby/how-to-set-up-a-microservices-architecture) y respondemos a la pregunta ¿Cuales son las principales diferencias en utilizar una arquitectura orientada a Microservicios y la de Cliente-Servidor vista en clase con Rails?
