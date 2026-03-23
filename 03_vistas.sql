--- ===================================================================================================================================
--- VISTA PRODUCTOS CON SU CATEGORÍA
--- ===================================================================================================================================
CREATE OR REPLACE VIEW VW_PRODUCTOS_CATEGORIAS AS
SELECT
    P.ID_PRODUCTO,
    P.NOMBRE AS NOMBRE_PRODUCTO,
    P.PRECIO,
    P.STOCK,
    P.DESCRIPCION AS DESCRIPCION_PRODUCTO,
    P.ESTATUS,
    C.ID_CATEGORIA,
    C.NOMBRE AS NOMBRE_CATEGORIA,
    C.DESCRIPCION AS DESCRIPCION_CATEGORIA,
    P.FECHA_CREACION,
    P.FECHA_MODIFICACION
FROM PRODUCTOS P
         INNER JOIN CATEGORIAS C
                    ON P.ID_CATEGORIA = C.ID_CATEGORIA;


--- ===================================================================================================================================
--- VISTA QUE MUESTRA VENTAS CON DATOS DE CLIENTES Y PRODUCTOS
--- ===================================================================================================================================
CREATE OR REPLACE VIEW VW_VENTAS_DETALLE AS
SELECT
    V.ID_VENTA,
    V.FECHA_VENTA,
    V.CANTIDAD,

    -- Datos del cliente
    C.ID_CLIENTE,
    C.NOMBRE || ' ' || C.APATERNO || ' ' || C.AMATERNO AS NOMBRE_CLIENTE,
    C.EMAIL,
    C.TELEFONO,

    -- Datos del producto
    P.ID_PRODUCTO,
    P.NOMBRE AS NOMBRE_PRODUCTO,
    P.PRECIO,

    -- Cálculo opcional
    (V.CANTIDAD * P.PRECIO) AS TOTAL_VENTA,

    V.USUARIO_REGISTRO
FROM VENTAS V
         INNER JOIN CLIENTES C
                    ON V.ID_CLIENTE = C.ID_CLIENTE
         INNER JOIN PRODUCTOS P
                    ON V.ID_PRODUCTO = P.ID_PRODUCTO;
