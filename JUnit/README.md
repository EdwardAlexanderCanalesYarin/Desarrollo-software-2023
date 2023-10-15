# JUnit5
## Tutorial JUnit5
En este tutorial de Junit, presentaremos los conceptos básicos de JUnit5 y sus nuevas funciones mediante ejemplos. En el mundo Java, JUnit es uno de los marcos populares utilizados para implementar pruebas unitarias en código Java. JUnit ayuda principalmente a los desarrolladores a probar ellos mismos su código en la JVM.

## Arquitectura JUnit5

## Dependencias de JUnit Maven
Para implementar casos de prueba basados en JUnit5 en un proyecto, agregue la siguiente dependencia al archivo pom.xml del proyecto:

``` java
<dependency>
     <groupId>org.junit.jupiter</groupId>
     <artifactId>junit-jupiter-engine</artifactId>
     <version>5.1.1</version>
     <scope>test</scope>
</dependency>
<dependency>
     <groupId>org.junit.platform</groupId>
     <artifactId>junit-platform-runner</artifactId>
     <version> 1.1.1</version>
     <scope>test</scope>
</dependency>
``` 
![Dependencies](Imágenes/Dependencies.png)

Proveedor JUnit5 maven surefire para ejecutar las pruebas unitarias donde el IDE no tiene soporte para JUnit5 (si el IDE tiene soporte, entonces este punto no es necesario)

``` java
<plugin>
     <artifactId>maven-surefire-plugin</artifactId>
     <version>2.19.1</version>
     <dependencies>
          <dependency>
               <groupId>org.junit.platform</groupId>
               <artifactId>junit-platform-surefire-provider</artifactId>
               <version>1.0.2</version>
          </dependency>
     </dependencies>
</plugin>
```
En el caso de que uses IntelliJ idea, no es necesario el punto anterior debido a que este IDE tiene soporte para JUnit5
