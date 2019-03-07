## Api de una ecommerce con los siguientes servicios:

-Servicio para listar los restaurantes.

-Servicio para listar las categorías de un restaurante y sus respectivos productos.

-Servicio para añadir y/o quitar productos al carrito.

-Servicio para traer la información del carrito de un cliente (que productos tiene y el total).

-Servicio para realizar la orden en el que se especifique el medio de pago, dirección del cliente y celular (los medios de pago  son ficticios no se requiere ningún lógica detrás de un medio de pago).

-Servicio para listar las ordenes hechas por un usuario.

Check documentation for Postman tests in https://documenter.getpostman.com/view/3875340/RztfuWoL


## Para correr localmente

1. Haz un fork de este repositorio.

2. Clona el fork en tu máquina.

    ```
    $ git clone https://github.com/miguelmassv/api_ecommerce.git
    ```

3. Instalar las dependencias de ruby

    ```
    $ bundle
    ```

4. Corre la base de datos y los seeds

    ```
    $ rails db:migrate
    $ rails db:seed
    ```
5. Revisa la documentación de postman para probar los end-points

   ```
   https://documenter.getpostman.com/view/3875340/RztfuWoL
   ```
