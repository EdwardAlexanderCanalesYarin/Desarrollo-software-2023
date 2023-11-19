# Active Record
Ejecutamos bundle para asegurarse de tener las gemas necesaria
![Bundle](Image/Bundle.png)

Ejecutamos el archivo de prueba con bundle exec rspec spec/activerecord_practice_spec.rb y el resultado debe ser 13 ejemplos, 0 fallas, 13 pendientes, pues todas las pruebas se están ignorando ya que se usó xspecify que es una especie de comentario para marcar pruebas como omitidas temporalmente.
![BundleExecRspec](Image/BundleExecRspec.png)

![BundleExecRspec1](Image/BundleExecRspec1.png)

Hemos configurado las pruebas para que inicialmente se omitan todas las pruebas. (Todos fallarían porque aún no has escrito el código para ellos). Abre el specfile y echa un vistazo. tu flujo de trabajo será el siguiente:

* Escoge un ejemplo para trabajar (recomendamos hacerlo en orden). Cada ejemplo (caso de prueba) comienza con xspecify.
* En ese ejemplo, cambia xspecify por specify y guarda el archivo. Este cambio hará que esa prueba en particular no se omita en la siguiente ejecución de prueba.
* La prueba fallará inmediatamente porque no has escrito el código necesario.
* Escribiras el código necesario y aprobarás la prueba, luego pasa al siguiente ejemplo.

![Specify](Image/Specify.png)

![Specify1](Image/Specify1.png)

EScribimos código necesario para que pase la primera prueba (debe estar en color verde)
``` ruby
def self.any_candice
    # Tu codigo aqui para devolver todos los clientes cuyo nombre sea Candice
    # probablemente algo asi:  Customer.where(....)
    Customer.where(first: 'Candice')
  end
```

![PrimeraPruebaExitosa](Image/PrimeraPruebaExitosa.png)

![PrimeraPruebaExistosa1](Image/PrimeraPruebaExistosa1.png)

Seguimos escribiendo código necesario para pasar todas las pruebas y ejecutamos el comando ```bundle exec rspec spec/activerecord_practice_spec.rb ```

``` ruby
require 'sqlite3'
require 'active_record'
require 'byebug'


ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'customers.sqlite3')
# Mostrar consultas en la consola.
# Comenta esta linea para desactivar la visualización de consultas SQL sin formato.
ActiveRecord::Base.logger = Logger.new(STDOUT)

class Customer < ActiveRecord::Base
  def to_s
    "  [#{id}] #{first} #{last}, <#{email}>, #{birthdate.strftime('%Y-%m-%d')}"
  end

  # NOTA: Cada uno de estos se puede resolver por completo mediante llamadas de ActiveRecord.
  # No deberías necesitar llamar a las funciones de  Ruby para ordenar, filtrar, etc.
  def self.any_candice
    # Tu codigo aqui para devolver todos los clientes cuyo nombre sea Candice
    # probablemente algo asi:  Customer.where(....)
    Customer.where(first: 'Candice')
  end
  def self.with_valid_email
    # Tu codigo aqui para devolver solo clientes con direcciones de correo electronico validas (que contengan '@')
    Customer.where("email LIKE '%@%'")
  end
  def self.with_dot_org_email
    Customer.where("email LIKE '%.org'")
  end
  def self.with_invalid_email
    Customer.where("email NOT LIKE '%@%' AND email IS NOT NULL AND email != ''")
  end
  def self.with_blank_email
    Customer.where("email = '' OR email IS NULL")
  end
  def self.born_before_1980
    Customer.where("birthdate < ?", Date.new(1980, 1, 1))
  end
  def self.with_valid_email_and_born_before_1980
    Customer.where("email LIKE '%@%' AND birthdate < ?", Date.new(1980, 1, 1))
  end
  def self.last_names_starting_with_b
    Customer.where("last LIKE 'B%'").order(:birthdate)
  end
  def self.twenty_youngest
    Customer.order(birthdate: :desc).limit(20)
  end
  def self.update_gussie_murray_birthdate
    gussie = Customer.find_by(first: 'Gussie', last: 'Murray')
    gussie.update(birthdate: Date.new(2004, 2, 8))
  end
  def self.change_all_invalid_emails_to_blank
    Customer.where("email IS NOT NULL AND email NOT LIKE '%@%'").update_all(email: nil)
  end
  def self.delete_meggie_herman
    Customer.find_by(first: 'Meggie', last: 'Herman')&.destroy
  end
  def self.delete_everyone_born_before_1978
    Customer.where('birthdate < ?', Date.new(1980, 1, 1)).destroy_all
  end
end
``` 
![PruebasExitosas](Image/PruebasExitosas.png)

![PruebasExitosas1](Image/PruebasExitosas1.png)
