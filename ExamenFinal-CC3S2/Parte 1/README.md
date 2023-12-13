# PARTE 1
## 1
## 2
``` ruby
class User < ActiveRecord::Base
  validates :username, :presence => true
  validate :username_format
end
```

```1. ¿Qué pasa si tenemos @user sin nombre de usuario y llamamos a @user.valid? ¿Qué 	guardará @user.save?```
Al no tener un nombre de usuario para @user y llamar al metodo @user.valid? nos retornará ```false``` pues en la clase User validates actúa sobre el campo username, es decir, es necesario que este campo no este vacío.
El metodo save es una validacion que guarda un objeto en la base de datos solo si el objeto es válido, por lo tanto, @user.save? no guardará el objeto y retornará false 

```2. Implementa username_format. Para los propósitos, un nombre de usuario comienza 	con una letra y tiene como máximo 10 caracteres de largo. Recuerda, las validaciones 	personalizadas agregan un mensaje a la colección de errores.```

``` ruby
class User < ActiveRecord::Base
  validates :username, :presence => true
  validate :username_format

  # Un nombre de usuario comienza con una letra y tiene longitud maxima 10 caracteres
  def self.username_format
    validate @username.errors.add(:base, "El usarname debe comenzar con una letra y no exceder de 10 caracteres") unless @username.lenght <= 10 && @username =~ /[^a-zA-Z]/
  end
end  
```

```3. Recuerda, los filtros nos ayudan a verificar si ciertas condiciones se cumplen antes de permitir que se ejecute una acción del controlador. Para el modelo de User, digamos que queremos verificar si @user era administrador de todos los métodos en AdminController. Completa el método before_filter:check_admin a continuación que verifica si el campo de administrador en @user es verdadero. De lo contrario, redirija a la página admin_login con un mensaje que indica acceso restringido.```

``` ruby
class AdminController < ApplicationController
  	        before_filter :check_admin
      # Completa el codigo
```

