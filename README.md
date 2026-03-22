# Sistema_Ventas_Unube
<p align="center">
  <img src="" alt="Logo" width=1200 height=300>
Este repositorio se muestra la creación de una base de datos para el Sistema de Ventas Unube, se hace explicación clara de la creación de la base de datos. 
<br>
</p>

# Sistema de Ventas Unube
El administrador del sistema de ventas Unube, se requiere registrar categorías, productos, clientes y ventas, para disponer de un modelo de datos confiable que permita consultar inventarios, validar stock, registrar transacciones y generar reportes que apoyen la operación del negocio.
  ## 1. Se genero cuatro tablas normalizadas con los campos que fueron sugeridos por el administrador.

| Columna 1 | Columna 2 |
|-----------|-----------|
| Tabla CATEGORIAS | Tabla PRODUCTOS | 
| <img src="" alt="Logo" width=1000 height=200> | <img src="" alt="Logo" width=1000 height=200> |
| Tabla CLIENTES | Tabla VENTAS |
| <img src="" alt="Logo" width=1000 height=200> | <img src="" alt="Logo" width=1000 height=200> |

  1.1	Ejecución de las tablas, para las tablas se generaron comentarios de tabla y de sus columnas esto para documentar el propósito de cada tabla y campo.  <br> 
      a)	Tabla CATEGORIAS.  <br> 
      -  <img src= "">
      b) Tabla PRODUCTOS.  <br> 
       -  <img src= "">
      c) Tabla CLIENTES. <br> 
        -  <img src= "">
      d) Tabla VENTAS.  <br> 
  1.2	Se crearon secuencias para las llaves primarias de nuestras tablas creadas.
         -  <img src= "">
  ## 2. Se crearon dos vistas
  2.1 La primera vista debe mostrar productos con su categoría.  <br> 
     -  <img src= "">
  2.2 La segunda vista debe mostrar ventas con datos de clientes y productos  <br> 
     -  <img src= "">
## 3. Se genero un Stored Procedure(SP) que registre una venta validando: cliente, producto, stock disponible y actualización del stock.  <br> 
  3.1 El SP debe generar el ID de ventas automáticamente.  <br> 
     -  <img src= "">
## 4. Se generaron dos funciones  <br> 
  4.1 La primera función que calcule el total de la venta (cantidad x precio).  <br> 
     -  <img src= "">
  4.2	La segunda función debe calcular el IVA.  <br> 
     -  <img src= "">
## 5. Se generaron inserciones directas a las tablas creadas para demostrar su funcionamiento.  <br> 
 -  <img src= "">
## 6. Se generaron consultas de prueba para demostrar el funcionamiento de las vistas.  <br> 
  6.1	Primera vista.  <br> 
     -  <img src= "">
  6.2 Segunda función.  <br> 
     -  <img src= "">
## 7. Se generaron consultas del SP que demuestre su funcionamiento. <br> 
 -  <img src= "">
## 8. Se generaron consultas de las funciones para demostrar el funcionamiento de las mismas.  <br> 
 -  <img src= "">
## 9. Se genero un Diagrama Entidad Relación (DER) de las cuatro tablas, indicando sus relaciones y cardinalidades.  <br> 
 -  <img src= "">
      
      



