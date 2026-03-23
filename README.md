# Sistema_Ventas_Unube
<br>
Este repositorio se muestra la creación de una base de datos para el Sistema de Ventas Unube, se hace explicación clara de la creación de la base de datos. 
<br>

# Sistema de Ventas Unube
El administrador del sistema de ventas Unube, se requiere registrar categorías, productos, clientes y ventas, para disponer de un modelo de datos confiable que permita consultar inventarios, validar stock, registrar transacciones y generar reportes que apoyen la operación del negocio.
  ## 1. Se genero cuatro tablas normalizadas con los campos que fueron sugeridos por el administrador.

| TABLA CATEGORIAS |
|-----------|
|<img width="302" height="153" alt="Tabla_VENTAS" src="https://github.com/user-attachments/assets/3cef905d-1969-4e1e-b163-d7aefcd819f2" />| 
|<img width="301" height="172" alt="Tabla_PRODUCTOS" src="https://github.com/user-attachments/assets/ea535269-7e37-464f-bcf1-c3feade5bd1e" />|
|<img width="302" height="153" alt="Tabla_VENTAS" src="https://github.com/user-attachments/assets/0ff92b4b-5844-447b-8033-32e56f36ab38" />|
|<img width="287" height="171" alt="Tabla_CLIENTES" src="https://github.com/user-attachments/assets/2ad97010-cc63-4c1f-8efc-fe8e309aac4c" />|

  1.1	Ejecución de las tablas, para las tablas se generaron comentarios de tabla y de sus columnas esto para documentar el propósito de cada tabla y campo.<br>
  *Tabla CATEGORIAS.* <br>
      <img width="665" height="360" alt="Creacion_Tabla_CATEGORIAS" src="https://github.com/user-attachments/assets/db48802c-b73d-48cf-ad54-9de3c06e0bb8" /> <br>
  *Tabla PRODUCTOS.* <br>
      <img width="655" height="356" alt="Creacion_Tabla_PRODUCTOS" src="https://github.com/user-attachments/assets/fbf54ef4-9616-458e-8d28-7441e566244e" /> <br>
  *Tabla CLIENTES.* <br>
      <img width="662" height="360" alt="Creacion_Tabla_CLIENTES" src="https://github.com/user-attachments/assets/d729e106-9b1f-473d-bf2d-8dbd44b63346" /> <br>
  *Tabla VENTAS.* <br>
      <img width="660" height="359" alt="Creacion_Tabla_VENTAS" src="https://github.com/user-attachments/assets/f3c0479b-d739-446c-b128-8d7d22e9e956" /> <br>
      
  1.2	Se crearon secuencias para las llaves primarias de nuestras tablas creadas. <br>
         <img width="660" height="363" alt="Creacion_Secuencias" src="https://github.com/user-attachments/assets/5c9efe16-ee09-4b7d-9086-f45ccce8228c" />
         
  ## 2. Se crearon dos vistas
  2.1 La primera vista debe mostrar productos con su categoría. <br> 
  <img width="663" height="356" alt="Vista_Productos con su Categoria" src="https://github.com/user-attachments/assets/d0ec5d3e-3f66-4d04-ab7b-ba732d59afea" /> <br>
  
  2.2 La segunda vista debe mostrar ventas con datos de clientes y productos. <br>
  <img width="652" height="356" alt="Vista_Muestra Ventas de Datos de Clientes y Productos" src="https://github.com/user-attachments/assets/067c70ab-e56a-4c24-b54c-84254e8efadb" /> <br>

## 3. Se genero un Stored Procedure(SP) que registre una venta validando: cliente, producto, stock disponible y actualización del stock.  <br> 
  3.1 El SP debe generar el ID de ventas automáticamente.  <br>
<img width="662" height="358" alt="SP_Que Registre una Venta Validando" src="https://github.com/user-attachments/assets/e84a7093-8fb3-44a0-8fd3-faa7258dd138" /> <br>
  
## 4. Se generaron dos funciones  <br> 
  4.1 La primera función que calcule el total de la venta (cantidad x precio). <br>
<img width="664" height="359" alt="Funcion_Calcule Venta(Cantidad x Precio)" src="https://github.com/user-attachments/assets/634f43e5-50e7-49de-abe2-d6730511fd1e" /> <br>

  4.2	La segunda función debe calcular el IVA.  <br>
<img width="661" height="359" alt="Funcion_Calcule el IVA" src="https://github.com/user-attachments/assets/88acf21b-9b0f-4075-b925-dbd357592073" /> <br>

## 5. Se generaron inserciones directas a las tablas creadas para demostrar su funcionamiento.  <br> 
<img width="664" height="359" alt="INSERCIONES_01" src="https://github.com/user-attachments/assets/6b29bb36-ce33-42b6-8435-c504602b2639" /> <br>
<img width="664" height="359" alt="INSERCIONES_02" src="https://github.com/user-attachments/assets/89d284d0-6c7f-4ea6-af34-903c60011f8d" /> <br>
<img width="662" height="358" alt="INSERCIONES_03" src="https://github.com/user-attachments/assets/83d69e56-34aa-4969-86d5-56566474b8d3" /> <br>
<img width="657" height="354" alt="INSERCIONES_04" src="https://github.com/user-attachments/assets/0df738b6-9b96-4f31-8335-cab9c1cd6a01" /> <br>

## 6. Se generaron consultas de prueba para demostrar el funcionamiento de las vistas.  <br> 
  6.1	Primera vista. <br>
<img width="956" height="517" alt="PRUEBA_VISTA_1" src="https://github.com/user-attachments/assets/6bff9244-20f4-4e62-9b59-9f07d451f708" /> <br>
 
  6.2 Segunda función. <br>
<img width="960" height="515" alt="PRUEBA_FUNCION_2" src="https://github.com/user-attachments/assets/fff9aa24-4446-4971-ad8e-9d2d45474b15" /> <br>

## 7. Se generaron consultas del SP que demuestre su funcionamiento. <br> 
<img width="960" height="518" alt="PRUEBA_SP" src="https://github.com/user-attachments/assets/46071f65-b5c9-44d2-a3cd-9b5be5a2d84f" /> <br>

## 8. Se generaron consultas de las funciones para demostrar el funcionamiento de las mismas.  <br> 
  8.1 Primera Funcion. <br>
 <img width="958" height="518" alt="PRUEBA_FUNCION_1" src="https://github.com/user-attachments/assets/8d325661-3e15-4e0f-9c49-1600408c0031" /> <br>
 8.2 Segunda Funcion. <br>
<img width="960" height="515" alt="PRUEBA_FUNCION_2" src="https://github.com/user-attachments/assets/35f4f1d7-9932-4bb8-a8ff-8ea88d9de9c3" /> <br>

## 9. Se genero un Diagrama Entidad Relación (DER) de las cuatro tablas, indicando sus relaciones y cardinalidades.  <br> 
<img width="442" height="370" alt="Diagrama_Entidad Relacion" src="https://github.com/user-attachments/assets/bc0091f4-7e3d-4a53-9851-5f911d5d82bf" /> <br>

## 10. Scripts





      
      



