--- ===================================================================================================================================
--- PROCEDIMIENTO ALMACENADO QUE REGISTRE UNA VENTA VALIDANDO: CLIENTE, PRODUCTO, STOCK DISPONIBLE Y ACTUALIZACIÓN DEL STOCK
--- ===================================================================================================================================
CREATE OR REPLACE PROCEDURE SP_REGISTRAR_VENTA(
    P_ID_CLIENTE        IN NUMBER,
    P_ID_PRODUCTO       IN NUMBER,
    P_CANTIDAD          IN NUMBER,
    P_USUARIO_REGISTRO  IN VARCHAR2
)
    IS
    V_EXISTE_CLIENTE NUMBER;
    V_EXISTE_PRODUCTO NUMBER;
    V_STOCK NUMBER;
    V_ID_VENTA NUMBER;
BEGIN

    -- ================================
    -- VALIDAR CLIENTE
    -- ================================
    SELECT COUNT(*)
    INTO V_EXISTE_CLIENTE
    FROM CLIENTES
    WHERE ID_CLIENTE = P_ID_CLIENTE;

    IF V_EXISTE_CLIENTE = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El cliente no existe');
    END IF;

    -- ================================
    -- VALIDAR PRODUCTO Y OBTENER STOCK
    -- ================================
    SELECT COUNT(*)
    INTO V_EXISTE_PRODUCTO
    FROM PRODUCTOS
    WHERE ID_PRODUCTO = P_ID_PRODUCTO;

    IF V_EXISTE_PRODUCTO = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El producto no existe');
    END IF;

    -- Obtener stock actual
    SELECT STOCK
    INTO V_STOCK
    FROM PRODUCTOS
    WHERE ID_PRODUCTO = P_ID_PRODUCTO
        FOR UPDATE;

    -- ================================
    -- VALIDAR STOCK DISPONIBLE
    -- ================================
    IF V_STOCK < P_CANTIDAD THEN
        RAISE_APPLICATION_ERROR(-20003, 'Stock insuficiente');
    END IF;

    -- ================================
    -- GENERAR ID DE VENTA
    -- ================================
    SELECT SEC_ID_VENTA.NEXTVAL
    INTO V_ID_VENTA
    FROM DUAL;

    -- ================================
    -- INSERTAR VENTA
    -- ================================
    INSERT INTO VENTAS(
        ID_VENTA,
        ID_CLIENTE,
        ID_PRODUCTO,
        CANTIDAD,
        FECHA_VENTA,
        USUARIO_REGISTRO,
        FECHA_CREACION
    )
    VALUES(
              V_ID_VENTA,
              P_ID_CLIENTE,
              P_ID_PRODUCTO,
              P_CANTIDAD,
              SYSDATE,
              P_USUARIO_REGISTRO,
              SYSDATE
          );

    -- ================================
    -- ACTUALIZAR STOCK
    -- ================================
    UPDATE PRODUCTOS
    SET STOCK = STOCK - P_CANTIDAD,
        FECHA_MODIFICACION = SYSDATE
    WHERE ID_PRODUCTO = P_ID_PRODUCTO;

    -- ================================
    -- CONFIRMAR TRANSACCIÓN
    -- ================================
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END SP_REGISTRAR_VENTA;
/

--- ========================================================================================================================================
--- PRIMERA FUNCIÓN QUE CALCULE EL TOTAL DE LA VENTA (CANTIDAD X PRECIO)
--- ========================================================================================================================================
CREATE OR REPLACE FUNCTION FN_TOTAL_VENTA(
    P_ID_PRODUCTO IN NUMBER,
    P_CANTIDAD    IN NUMBER
) RETURN NUMBER
    IS
    V_PRECIO PRODUCTOS.PRECIO%TYPE;
    V_TOTAL  NUMBER;
BEGIN
    -- Obtener el precio del producto
    SELECT PRECIO
    INTO V_PRECIO
    FROM PRODUCTOS
    WHERE ID_PRODUCTO = P_ID_PRODUCTO;

    -- Calcular total
    V_TOTAL := V_PRECIO * P_CANTIDAD;

    RETURN V_TOTAL;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20010, 'El producto no existe');
        RETURN 0;
    WHEN OTHERS THEN
        RAISE;
END FN_TOTAL_VENTA;
/

--- ========================================================================================================================================
--- SEGUNDA FUNCIÓN QUE CALCULE EL IVA
--- ========================================================================================================================================
CREATE OR REPLACE FUNCTION FN_CALCULAR_IVA(
    P_TOTAL IN NUMBER,
    P_TASA  IN NUMBER DEFAULT 0.16
) RETURN NUMBER
    IS
    V_IVA NUMBER;
BEGIN
    -- Calcular IVA
    V_IVA := P_TOTAL * P_TASA;

    RETURN V_IVA;

EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END FN_CALCULAR_IVA;
/
