--- ====================================================================================================================================
--- TABLA DE CATEGORIA
--- ====================================================================================================================================
CREATE TABLE CATEGORIAS(
    ID_CATEGORIA NUMBER NOT NULL,
    NOMBRE VARCHAR2(40) NOT NULL,
    DESCRIPCION VARCHAR2(50) NOT NULL,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE,
    CONSTRAINT pk_id_categoria_categorias PRIMARY KEY (ID_CATEGORIA)
);

--- =====================================================================================================================================
--- COMENTARIOS DE LA TABLA CATEGORIAS
--- =====================================================================================================================================
COMMENT ON TABLE CATEGORIAS IS 'Tabla que contiene las categorías de productos ';
COMMENT ON COLUMN CATEGORIAS.ID_CATEGORIA IS 'Llave primaria de la tabla Categorías';
COMMENT ON COLUMN CATEGORIAS.NOMBRE IS 'Nombre de la Categoría';
COMMENT ON COLUMN CATEGORIAS.DESCRIPCION IS 'Descripción de la categoría';
COMMENT ON COLUMN CATEGORIAS.FECHA_CREACION IS 'Fecha de creación de la categoría';
COMMENT ON COLUMN CATEGORIAS.FECHA_MODIFICACION IS 'Fecha de la modificación de la categoría';

--- =====================================================================================================================================
--- TABLA DE PRODUCTOS
--- =====================================================================================================================================
CREATE TABLE PRODUCTOS(
    ID_PRODUCTO NUMBER NOT NULL ,
    NOMBRE VARCHAR2(40) NOT NULL,
    PRECIO NUMBER(10,2) NOT NULL,
    STOCK NUMBER NOT NULL,
    ID_CATEGORIA NUMBER NOT NULL,
    DESCRIPCION VARCHAR2(50) NOT NULL,
    ESTATUS VARCHAR2(50) NOT NULL,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE,
    CONSTRAINT pk_id_producto_productos PRIMARY KEY (ID_PRODUCTO),
    CONSTRAINT fk_id_categoria_productos FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS (ID_CATEGORIA)
);

--- ====================================================================================================================================
--- COMENTARIOS DE LA TABLA PRODUCTOS
--- ====================================================================================================================================
COMMENT ON TABLE PRODUCTOS IS 'Tabla que contiene los productos del sistema de venta';
COMMENT ON COLUMN PRODUCTOS.ID_PRODUCTO IS ' Llave primaria de la tabla de productos del sistema de venta';
COMMENT ON COLUMN PRODUCTOS.NOMBRE IS 'Nombre de los productos del sistema de venta';
COMMENT ON COLUMN PRODUCTOS.PRECIO IS 'Precio de los productos del sistema de ventas';
COMMENT ON COLUMN PRODUCTOS.STOCK IS 'Stock de los productos del sistema de venta';
COMMENT ON COLUMN PRODUCTOS.ID_CATEGORIA IS 'Llave foránea ID_CATEGORIA que hace referente a la tabla CATEGORIAS';
COMMENT ON COLUMN PRODUCTOS.DESCRIPCION IS 'Descripción de los productos del sistema de venta';
COMMENT ON COLUMN PRODUCTOS.ESTATUS IS 'Estatus de los productos del sistema de venta';
COMMENT ON COLUMN PRODUCTOS.FECHA_CREACION IS 'Fecha de creación del sistema de ventas';
COMMENT ON COLUMN PRODUCTOS.FECHA_MODIFICACION IS 'Fecha de modificación del sistema de venta';

--- ==================================================================================================================================
--- TABLA DE CLIENTES
--- ==================================================================================================================================
CREATE TABLE CLIENTES(
                         ID_CLIENTE NUMBER NOT NULL,
                         NOMBRE VARCHAR2(40) NOT NULL,
                         APATERNO VARCHAR2(40) NOT NULL,
                         AMATERNO VARCHAR2(40) NOT NULL,
                         EMAIL varchar2(40) not null,
                         TELEFONO varchar2(15) not null,
                         FECHA_REGISTRO DATE DEFAULT SYSDATE,
                         FECHA_CREACION DATE DEFAULT SYSDATE,
                         FECHA_MODIFICACION DATE,
                         CONSTRAINT pk_id_cliente_clientes PRIMARY KEY (ID_CLIENTE)

);

--- =================================================================================================================================
--- COMENTARIOS DE CLIENTES
--- ==================================================================================================================================
COMMENT ON TABLE CLIENTES IS 'Tabla que contiene a los clientes del sistema de ventas';
COMMENT ON COLUMN CLIENTES.ID_CLIENTE IS 'Llave primaria de la tabla ventas';
COMMENT ON COLUMN CLIENTES.NOMBRE IS 'Nombre del clientes';
COMMENT ON COLUMN CLIENTES.APATERNO IS 'Apellido paterno del cliente';
COMMENT ON COLUMN CLIENTES.AMATERNO IS 'Apellido materno del cliente';
COMMENT ON COLUMN CLIENTES.EMAIL IS 'Email del cliente';
COMMENT ON COLUMN CLIENTES.TELEFONO IS 'Teléfono del cliente';
COMMENT ON COLUMN CLIENTES.FECHA_REGISTRO IS 'Fecha de registro del cliente';
COMMENT ON COLUMN CLIENTES.FECHA_CREACION IS 'Fecha de creación del cliente';
COMMENT ON COLUMN CLIENTES.FECHA_MODIFICACION IS 'Fecha de modificación del cliente ';

--- ===================================================================================================================================
--- TABLA DE VENTAS
--- ===================================================================================================================================
CREATE TABLE VENTAS(
    ID_VENTA NUMBER NOT NULL,
    ID_CLIENTE NUMBER NOT NULL,
    ID_PRODUCTO NUMBER NOT NULL,
    CANTIDAD NUMBER NOT NULL,
    FECHA_VENTA DATE DEFAULT SYSDATE,
    USUARIO_REGISTRO VARCHAR2(40) NOT NULL,
    FECHA_CREACION DATE DEFAULT SYSDATE,
    FECHA_MODIFICACION DATE,
    CONSTRAINT pk_id_venta_ventas PRIMARY KEY (ID_VENTA),
    CONSTRAINT fk_id_cliente_ventas FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES (ID_CLIENTE),
    CONSTRAINT fk_id_producto_productos FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS (ID_PRODUCTO)
);

--- ==================================================================================================================================
--- COMENTARIOS DE LA TABLA DE VENTAS
--- ==================================================================================================================================
COMMENT ON TABLE VENTAS IS 'Tabla que contiene las ventas ';
COMMENT ON COLUMN VENTAS.ID_VENTA IS 'Llave primaria de la tabla de ventas';
COMMENT ON COLUMN VENTAS.ID_CLIENTE IS 'Llave foránea ID_CLIENTE de la tabla de CLIENTES';
COMMENT ON COLUMN VENTAS.ID_PRODUCTO IS 'Llave foránea ID_PRODUCTO de la tabla PRODUCTOS';
COMMENT ON COLUMN VENTAS.CANTIDAD IS 'Cantidad de la venta realizada';
COMMENT ON COLUMN VENTAS.FECHA_VENTA IS 'Fecha de la venta realizada';
COMMENT ON COLUMN VENTAS.USUARIO_REGISTRO IS 'Información del usuario que genero la venta';
COMMENT ON COLUMN VENTAS.FECHA_CREACION IS 'Fecha de la creación de la venta';
COMMENT ON COLUMN VENTAS.FECHA_MODIFICACION IS 'Fecha de la modificación de la venta';

--- ===================================================================================================================================
--- CREACION DE SECUENCIAS PARA LAS LLAVES PRIMARIAS (PK'S)
--- ===================================================================================================================================
CREATE SEQUENCE SEC_ID_CATEGORIA START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEC_ID_PRODUCTO START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEC_ID_VENTA START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE SEC_ID_CLIENTE START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;