/* 
    UNIVERSIDAD MARIANO GALVEZ DE GUATEMALA
    INGENIERIA EN SISTEMAS
            Víctor Gabriel Madrid Barrios		1690-22-4772
            Juan Marcos Castro Tolentino		1690-22-18398
			Rudy Jaser Samuel Castellanos Lopez	1690-22-9776

*/
--Bibliotecaa
CREATE OR REPLACE PROCEDURE InsertarBiblioteca(
    p_IdBiblioteca IN INT,
    p_Ubicacion IN VARCHAR2,
    p_HorarioApertura IN DATE,
    p_HorarioCierre IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT
) AS
BEGIN
    INSERT INTO BIBLIOTECA (IdBiblioteca, Ubicacion, HorarioApertura, HorarioCierre, Estado, IdHotel)
    VALUES (p_IdBiblioteca, p_Ubicacion, p_HorarioApertura, p_HorarioCierre, p_Estado, p_IdHotel);
    
    COMMIT;
END InsertarBiblioteca;
/
CREATE OR REPLACE PROCEDURE ActualizarBiblioteca(
    p_IdBiblioteca IN INT,
    p_Ubicacion IN VARCHAR2,
    p_HorarioApertura IN DATE,
    p_HorarioCierre IN DATE,
    p_IdHotel IN INT
) AS
BEGIN
    UPDATE BIBLIOTECA
    SET Ubicacion = p_Ubicacion,
        HorarioApertura = p_HorarioApertura,
        HorarioCierre = p_HorarioCierre,
        IdHotel = p_IdHotel
    WHERE IdBiblioteca = p_IdBiblioteca;
    
    COMMIT;
END ActualizarBiblioteca;
/

CREATE OR REPLACE PROCEDURE EliminarBiblioteca( --No lo elimina de la base, solo lo "desactiva"
    p_IdBiblioteca IN INT
) AS
BEGIN
    UPDATE BIBLIOTECA
    SET Estado = 'N'
    WHERE IdBiblioteca = p_IdBiblioteca;

    COMMIT;
END EliminarBiblioteca;
/
CREATE OR REPLACE PROCEDURE ObtenerBibliotecas(
    p_IdBiblioteca IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdBiblioteca IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM BIBLIOTECA
            WHERE IdBiblioteca = p_IdBiblioteca;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM BIBLIOTECA;
    END IF;
END ObtenerBibliotecas;
/
--Gimnasio
CREATE OR REPLACE PROCEDURE InsertarGimnasio(
    p_IdGimnasio IN INT,
    p_AreasDisponibles IN VARCHAR2,
    p_HorarioApertura IN DATE,
    p_HorarioCierre IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT
) AS
BEGIN
    INSERT INTO Gimnasio (IdGimnasio, AreasDisponibles, HorarioApertura, HorarioCierre, Estado, IdHotel)
    VALUES (p_IdGimnasio, p_AreasDisponibles, p_HorarioApertura, p_HorarioCierre, p_Estado, p_IdHotel);
    
    COMMIT;
END InsertarGimnasio;
/
CREATE OR REPLACE PROCEDURE ActualizarGimnasio(
    p_IdGimnasio IN INT,
    p_AreasDisponibles IN VARCHAR2,
    p_HorarioApertura IN DATE,
    p_HorarioCierre IN DATE,
    p_IdHotel IN INT
) AS
BEGIN
    UPDATE Gimnasio
    SET AreasDisponibles = p_AreasDisponibles,
        HorarioApertura = p_HorarioApertura,
        HorarioCierre = p_HorarioCierre,
        IdHotel = p_IdHotel
    WHERE IdGimnasio = p_IdGimnasio;
    
    COMMIT;
END ActualizarGimnasio;
/
CREATE OR REPLACE PROCEDURE EliminarGimnasio( --No lo elimina de la base, solo lo "desactiva"
    p_IdGimnasio IN INT
) AS
BEGIN
    UPDATE Gimnasio
    SET Estado = 'N'
    WHERE IdGimnasio = p_IdGimnasio;

    COMMIT;
END EliminarGimnasio;
/
CREATE OR REPLACE PROCEDURE ObtenerGimnasio(
    p_IdGimnasio IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdGimnasio IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Gimnasio
            WHERE IdGimnasio = p_IdGimnasio;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Gimnasio;
    END IF;
END ObtenerGimnasio;
/
--TablaSpa
CREATE OR REPLACE PROCEDURE InsertarSpa(
    p_IdSpa IN INT,
    p_NombreSpa IN VARCHAR2,
    p_Servicios IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT
) AS
BEGIN
    INSERT INTO TablaSpa (IdSpa, NombreSpa, Servicios, Estado, IdHotel)
    VALUES (p_IdSpa, p_NombreSpa, p_Servicios, p_Estado, p_IdHotel);
    
    COMMIT;
END InsertarSpa;
/
CREATE OR REPLACE PROCEDURE ActualizarSpa(
    p_IdSpa IN INT,
    p_NombreSpa IN VARCHAR2,
    p_Servicios IN VARCHAR2,
    p_IdHotel IN INT
) AS
BEGIN
    UPDATE TablaSpa
    SET NombreSpa = p_NombreSpa,
        Servicios = p_Servicios,
        IdHotel = p_IdHotel
    WHERE IdSpa = p_IdSpa;
    
    COMMIT;
END ActualizarSpa;
/
CREATE OR REPLACE PROCEDURE EliminarSpa( --No lo elimina de la base, solo lo "desactiva"
    p_IdSpa IN INT
) AS
BEGIN
    UPDATE TablaSpa
    SET Estado = 'N'
    WHERE IdSpa = p_IdSpa;

    COMMIT;
END EliminarSpa;
/
CREATE OR REPLACE PROCEDURE ObtenerSpa(
    p_IdSpa IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdSpa IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM TablaSpa
            WHERE IdSpa = p_IdSpa;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM TablaSpa;
    END IF;
END ObtenerSpa;
/
--Transporte
CREATE OR REPLACE PROCEDURE InsertarTransporte(
    p_IdTransporte IN INT,
    p_Tipo IN VARCHAR2,
    p_costo IN NUMBER,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT
) AS
BEGIN
    INSERT INTO Transporte (IdTransporte, Tipo, costo, Estado, IdHotel)
    VALUES (p_IdTransporte, p_Tipo, p_costo, p_Estado, p_IdHotel);
    
    COMMIT;
END InsertarTransporte;
/
CREATE OR REPLACE PROCEDURE ActualizarTransporte(
    p_IdTransporte IN INT,
    p_Tipo IN VARCHAR2,
    p_costo IN NUMBER,
    p_IdHotel IN INT
) AS
BEGIN
    UPDATE Transporte
    SET Tipo = p_Tipo,
        costo = p_costo,
        IdHotel = p_IdHotel
    WHERE IdTransporte = p_IdTransporte;
    
    COMMIT;
END ActualizarTransporte;
/
CREATE OR REPLACE PROCEDURE EliminarTransporte( --No lo elimina de la base, solo lo "desactiva"
    p_IdTransporte IN INT
) AS
BEGIN
    UPDATE Transporte
    SET Estado = 'N'
    WHERE IdTransporte = p_IdTransporte;

    COMMIT;
END EliminarTransporte;
/
CREATE OR REPLACE PROCEDURE ObtenerTransporte(
    p_IdTransporte IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdTransporte IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Transporte
            WHERE IdTransporte = p_IdTransporte; 
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Transporte;
    END IF;
END ObtenerTransporte;
/
--Piscina
CREATE OR REPLACE PROCEDURE InsertarPiscina(
    p_IdPiscina IN INT,
    p_NombrePscina IN VARCHAR2,
    p_Altitud IN NUMBER,
    p_HorarioApertura IN DATE,
    p_HorarioCierre IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT
) AS
BEGIN
    INSERT INTO Piscina (IdPiscina, NombrePscina, Altitud, HorarioApertura, HorarioCierre, Estado, IdHotel)
    VALUES (p_IdPiscina, p_NombrePscina, p_Altitud, p_HorarioApertura, p_HorarioCierre,p_Estado,p_IdHotel);
    
    COMMIT;
END InsertarPiscina;
/
CREATE OR REPLACE PROCEDURE ActualizarPiscina(
    p_IdPiscina IN INT,
    p_NombrePscina IN VARCHAR2,
    p_Altitud IN NUMBER,
    p_HorarioApertura IN DATE,
    p_HorarioCierre IN DATE,
    p_IdHotel IN INT
) AS
BEGIN
    UPDATE Piscina
    SET 
        NombrePscina = p_NombrePscina,
        Altitud = p_Altitud,
        HorarioApertura =  p_HorarioApertura,
        HorarioCierre = p_HorarioCierre,
        IdHotel = p_IdHotel
    WHERE IdPiscina = p_IdPiscina;
    
    COMMIT;
END ActualizarPiscina;
/
CREATE OR REPLACE PROCEDURE EliminarPiscina( --No lo elimina de la base, solo lo "desactiva"
    p_IdPiscina IN INT
) AS
BEGIN
    UPDATE Piscina
    SET Estado = 'N'
    WHERE IdPiscina = p_IdPiscina;

    COMMIT;
END EliminarPiscina;
/
CREATE OR REPLACE PROCEDURE ObtenerPiscina(
    p_IdPiscina IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdPiscina IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Piscina
            WHERE IdPiscina = p_IdPiscina;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Piscina;
    END IF;
END ObtenerPiscina;
/
--SalasDeReunion
CREATE OR REPLACE PROCEDURE InsertarSalaReunion(
    p_IdSalaReunion IN INT,
    p_NombreSala IN VARCHAR2,
    p_Capacidad IN NUMBER,
    p_Equipamiento IN VARCHAR2,
    p_PrecioHora IN NUMBER,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT
) AS
BEGIN
    INSERT INTO SalasDeReunion  (IdSalaReunion, NombreSala, Capacidad, Equipamiento, PrecioHora, Estado, IdHotel)
    VALUES (p_IdSalaReunion, p_NombreSala, p_Capacidad, p_Equipamiento, p_PrecioHora, p_Estado,p_IdHotel);
    
    COMMIT;
END InsertarSalaReunion;
/
CREATE OR REPLACE PROCEDURE ActualizarSalaReunion(
    p_IdSalaReunion IN INT,
    p_NombreSala IN VARCHAR2,
    p_Capacidad IN NUMBER,
    p_Equipamiento IN VARCHAR2,
    p_PrecioHora IN NUMBER,
    p_IdHotel IN INT
) AS
BEGIN
    UPDATE SalasDeReunion
    SET 
        NombreSala = p_NombreSala,
        Capacidad = p_Capacidad,
        Equipamiento =  p_Equipamiento,
        PrecioHora = p_PrecioHora,
        IdHotel = p_IdHotel
    WHERE IdSalaReunion = p_IdSalaReunion;
    
    COMMIT;
END ActualizarSalaReunion;
/
CREATE OR REPLACE PROCEDURE EliminarSalaReunion( --No lo elimina de la base, solo lo "desactiva"
    p_IdSalaReunion IN INT
) AS
BEGIN
    UPDATE SalasDeReunion
    SET Estado = 'N'
    WHERE IdSalaReunion = p_IdSalaReunion;
    
    COMMIT;
END EliminarSalaReunion;
/
CREATE OR REPLACE PROCEDURE ObtenerSalaReunion(
    p_IdSalaReunion IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdSalaReunion IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM SalasDeReunion
            WHERE IdSalaReunion = p_IdSalaReunion;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM SalasDeReunion;
    END IF;
END ObtenerSalaReunion;
/
-- Procedimientos Mark

-- Para tabla Hotel
CREATE OR REPLACE PROCEDURE InsertarHotel(
    p_IdHotel IN INT,
    p_Nombre IN VARCHAR2,
    p_Direccion IN VARCHAR2,
    p_Ranking IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y'
)AS
BEGIN
    INSERT INTO TablaHotel (IdHotel, Nombre, Direccion, Ranking, Estado)
    VALUES (p_IdHotel, p_Nombre, p_Direccion, p_Ranking, p_Estado);

    COMMIT;
END InsertarHotel;
/

CREATE OR REPLACE PROCEDURE ActualizarHotel(
    p_IdHotel IN INT,
    p_Nombre IN VARCHAR2,
    p_Direccion IN VARCHAR2,
    p_Ranking IN NUMBER
) AS
BEGIN
    UPDATE TablaHotel
    SET Nombre = p_Nombre,
        Direccion = p_Direccion,
        Ranking = p_Ranking
    WHERE IdHotel = p_IdHotel;

    COMMIT;
END ActualizarHotel;
/

CREATE OR REPLACE PROCEDURE EliminarHotel(
    p_IdHotel IN INT
) AS
BEGIN
    UPDATE TablaHotel
    SET Estado = 'N'
    WHERE IdHotel = p_IdHotel;

    COMMIT;
END EliminarHotel;
/

CREATE OR REPLACE PROCEDURE ObtenerHoteles(
    p_IdHotel IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR      -- Cursor de salida
) AS
BEGIN
    IF p_IdHotel IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM TablaHotel
            WHERE IdHotel = p_IdHotel;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM TablaHotel;
    END IF;
END ObtenerHoteles;
/
-- Para tabla Compras
CREATE OR REPLACE PROCEDURE InsertarCompra(
    p_IdCompra IN INT,
    p_DescripcionCompras IN VARCHAR2,
    p_Total IN NUMBER,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT
) AS
BEGIN
    INSERT INTO Compras (IdCompra, DescripcionCompras, Total, Estado, IdHotel)
    VALUES (p_IdCompra, p_DescripcionCompras, p_Total, p_Estado, p_IdHotel);

    COMMIT;
END InsertarCompra;
/

CREATE OR REPLACE PROCEDURE ActualizarCompra(
    p_IdCompra IN INT,
    p_DescripcionCompras IN VARCHAR2,
    p_Total IN NUMBER,
    p_IdHotel IN INT
) AS
BEGIN
    UPDATE Compras
    SET DescripcionCompras = p_DescripcionCompras,
        Total = p_Total,
        IdHotel = p_IdHotel
    WHERE IdCompra = p_IdCompra;

    COMMIT;
END ActualizarCompra;
/

CREATE OR REPLACE PROCEDURE EliminarCompra(
    p_IdCompra IN INT
) AS
BEGIN
    UPDATE Compras
    SET Estado = 'N'
    WHERE IdCompra = p_IdCompra;

    COMMIT;
END EliminarCompra;
/

CREATE OR REPLACE PROCEDURE ObtenerCompras(
    p_IdCompra IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR       -- Cursor de salida
) AS
BEGIN
    IF p_IdCompra IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Compras
            WHERE IdCompra = p_IdCompra;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Compras;
    END IF;
END ObtenerCompras;
/

-- Para tabla inventario
CREATE OR REPLACE PROCEDURE InsertarInventario(
    p_IdInventario IN INT,
    p_FechaModificacion IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdCompra IN INT
) AS
BEGIN
    INSERT INTO Inventario (IdInventario, FechaModificacion, Estado, IdCompra)
    VALUES (p_IdInventario, p_FechaModificacion, p_Estado, p_IdCompra);

    COMMIT;
END InsertarInventario;
/

CREATE OR REPLACE PROCEDURE ActualizarInventario(
    p_IdInventario IN INT,
    p_FechaModificacion IN DATE,
    p_IdCompra IN INT
) AS
BEGIN
    UPDATE Inventario
    SET FechaModificacion = p_FechaModificacion,
        IdCompra = p_IdCompra
    WHERE IdInventario = p_IdInventario;

    COMMIT;
END ActualizarInventario;
/

CREATE OR REPLACE PROCEDURE EliminarInventario(
    p_IdInventario IN INT
) AS
BEGIN
    UPDATE Inventario
    SET Estado = 'N'
    WHERE IdInventario = p_IdInventario;

    COMMIT;
END EliminarInventario;
/

CREATE OR REPLACE PROCEDURE ObtenerInventario(
    p_IdInventario IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR           -- Cursor de salida
) AS
BEGIN
    IF p_IdInventario IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Inventario
            WHERE IdInventario = p_IdInventario;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Inventario;
    END IF;
END ObtenerInventario;
/

-- Para tabla Producto
CREATE OR REPLACE PROCEDURE InsertarProducto(
    p_IdProducto IN INT,
    p_NombreProducto IN VARCHAR2,
    p_PrecioUnitario IN NUMBER,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdCompra IN INT
) AS
BEGIN
    INSERT INTO Producto (IdProducto, NombreProducto, PrecioUnitario, Estado, IdCompra)
    VALUES (p_IdProducto, p_NombreProducto, p_PrecioUnitario, p_Estado, p_IdCompra);

    COMMIT;
END InsertarProducto;
/

CREATE OR REPLACE PROCEDURE ActualizarProducto(
    p_IdProducto IN INT,
    p_NombreProducto IN VARCHAR2,
    p_PrecioUnitario IN NUMBER,
    p_IdCompra IN INT
) AS
BEGIN
    UPDATE Producto
    SET NombreProducto = p_NombreProducto,
        PrecioUnitario = p_PrecioUnitario,
        IdCompra = p_IdCompra
    WHERE IdProducto = p_IdProducto;

    COMMIT;
END ActualizarProducto;
/

CREATE OR REPLACE PROCEDURE EliminarProducto(
    p_IdProducto IN INT
) AS
BEGIN
    UPDATE Producto
    SET Estado = 'N'
    WHERE IdProducto = p_IdProducto;

    COMMIT;
END EliminarProducto;
/

CREATE OR REPLACE PROCEDURE ObtenerProductos(
    p_IdProducto IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR          -- Cursor de salida
) AS
BEGIN
    IF p_IdProducto IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Producto
            WHERE IdProducto = p_IdProducto;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Producto;
    END IF;
END ObtenerProductos;
/

-- Para tabla Proveedores
CREATE OR REPLACE PROCEDURE InsertarProveedor(
    p_IdProveedor IN INT,
    p_Nombre IN VARCHAR2,
    p_Contacto IN VARCHAR2,
    p_Telefono IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdProducto IN INT
) AS
BEGIN
    INSERT INTO Proveedores (IdProveedor, Nombre, Contacto, Telefono, Estado, IdProducto)
    VALUES (p_IdProveedor, p_Nombre, p_Contacto, p_Telefono, p_Estado, p_IdProducto);

    COMMIT;
END InsertarProveedor;
/

CREATE OR REPLACE PROCEDURE ActualizarProveedor(
    p_IdProveedor IN INT,
    p_Nombre IN VARCHAR2,
    p_Contacto IN VARCHAR2,
    p_Telefono IN VARCHAR2,
    p_IdProducto IN INT
) AS
BEGIN
    UPDATE Proveedores
    SET Nombre = p_Nombre,
        Contacto = p_Contacto,
        Telefono = p_Telefono,
        IdProducto = p_IdProducto
    WHERE IdProveedor = p_IdProveedor;

    COMMIT;
END ActualizarProveedor;
/

CREATE OR REPLACE PROCEDURE EliminarProveedor(
    p_IdProveedor IN INT
) AS
BEGIN
    UPDATE Proveedores
    SET Estado = 'N'
    WHERE IdProveedor = p_IdProveedor;

    COMMIT;
END EliminarProveedor;
/

CREATE OR REPLACE PROCEDURE ObtenerProveedores(
    p_IdProveedor IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR           -- Cursor de salida
) AS
BEGIN
    IF p_IdProveedor IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Proveedores
            WHERE IdProveedor = p_IdProveedor;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Proveedores;
    END IF;
END ObtenerProveedores;
/

-- Para tabla Usuario
CREATE OR REPLACE PROCEDURE InsertarUsuario(
    p_IdUsuario IN INT,
    p_CodigoUsuario IN INT,
    p_NombreUsuario IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Contraseña IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y'
) AS
BEGIN
    INSERT INTO Usuario (IdUsuario, CodigoUsuario, NombreUsuario, Email, Contraseña, Estado)
    VALUES (p_IdUsuario, p_CodigoUsuario, p_NombreUsuario, p_Email, p_Contraseña, p_Estado);

    COMMIT;
END InsertarUsuario;
/

CREATE OR REPLACE PROCEDURE ActualizarUsuario(
    p_IdUsuario IN INT,
    p_CodigoUsuario IN INT,
    p_NombreUsuario IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Contraseña IN VARCHAR2
) AS
BEGIN
    UPDATE Usuario
    SET CodigoUsuario = p_CodigoUsuario,
        NombreUsuario = p_NombreUsuario,
        Email = p_Email,
        Contraseña = p_Contraseña
    WHERE IdUsuario = p_IdUsuario;

    COMMIT;
END ActualizarUsuario;
/

CREATE OR REPLACE PROCEDURE EliminarUsuario(
    p_IdUsuario IN INT
) AS
BEGIN
    UPDATE Usuario
    SET Estado = 'N'
    WHERE IdUsuario = p_IdUsuario;

    COMMIT;
END EliminarUsuario;
/

CREATE OR REPLACE PROCEDURE ObtenerUsuarios(
    p_IdUsuario IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR         -- Cursor de salida
) AS
BEGIN
    IF p_IdUsuario IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Usuario
            WHERE IdUsuario = p_IdUsuario;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Usuario;
    END IF;
END ObtenerUsuarios;
/

-- Para tabla Clientes
CREATE OR REPLACE PROCEDURE InsertarCliente(
    p_IdCliente IN INT,
    p_NombreCliente IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Telefono IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdUsuario IN INT
) AS
BEGIN
    INSERT INTO Clientes (IdCliente, NombreCliente, Email, Telefono, Estado, IdUsuario)
    VALUES (p_IdCliente, p_NombreCliente, p_Email, p_Telefono, p_Estado, p_IdUsuario);

    COMMIT;
END InsertarCliente;
/

CREATE OR REPLACE PROCEDURE ActualizarCliente(
    p_IdCliente IN INT,
    p_NombreCliente IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Telefono IN VARCHAR2,
    p_IdUsuario IN INT
) AS
BEGIN
    UPDATE Clientes
    SET NombreCliente = p_NombreCliente,
        Email = p_Email,
        Telefono = p_Telefono,
        IdUsuario = p_IdUsuario
    WHERE IdCliente = p_IdCliente;

    COMMIT;
END ActualizarCliente;
/

CREATE OR REPLACE PROCEDURE EliminarCliente(
    p_IdCliente IN INT
) AS
BEGIN
    UPDATE Clientes
    SET Estado = 'N'
    WHERE IdCliente = p_IdCliente;

    COMMIT;
END EliminarCliente;
/

CREATE OR REPLACE PROCEDURE ObtenerClientes(
    p_IdCliente IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR        -- Cursor de salida
) AS
BEGIN
    IF p_IdCliente IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Clientes
            WHERE IdCliente = p_IdCliente;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Clientes;
    END IF;
END ObtenerClientes;
/

-- Para tabla ComentariosDePersonal
CREATE OR REPLACE PROCEDURE InsertarComentarioDePersonal(
    p_IdComentario IN INT,
    p_Comentario IN VARCHAR2,
    p_FechaComentario IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdPersonal IN INT,
    p_IdCliente IN INT
) AS
BEGIN
    INSERT INTO ComentariosDePersonal (IdComentario, Comentario, FechaComentario, Estado, IdPersonal, IdCliente)
    VALUES (p_IdComentario, p_Comentario, p_FechaComentario, p_Estado, p_IdPersonal, p_IdCliente);

    COMMIT;
END InsertarComentarioDePersonal;
/

CREATE OR REPLACE PROCEDURE ActualizarComentarioDePersonal(
    p_IdComentario IN INT,
    p_Comentario IN VARCHAR2,
    p_FechaComentario IN DATE,
    p_IdPersonal IN INT,
    p_IdCliente IN INT
) AS
BEGIN
    UPDATE ComentariosDePersonal
    SET Comentario = p_Comentario,
        FechaComentario = p_FechaComentario,
        IdPersonal = p_IdPersonal,
        IdCliente = p_IdCliente
    WHERE IdComentario = p_IdComentario;

    COMMIT;
END ActualizarComentarioDePersonal;
/

CREATE OR REPLACE PROCEDURE EliminarComentarioDePersonal( --No elimina de la base, solo desactiva
    p_IdComentario IN INT
) AS
BEGIN
    UPDATE ComentariosDePersonal
    SET Estado = 'N'
    WHERE IdComentario = p_IdComentario;

    COMMIT;
END EliminarComentarioDePersonal;
/

CREATE OR REPLACE PROCEDURE ObtenerComentariosDePersonal(
    p_IdComentario IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR           -- Cursor de salida
) AS
BEGIN
    IF p_IdComentario IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM ComentariosDePersonal
            WHERE IdComentario = p_IdComentario;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM ComentariosDePersonal;
    END IF;
END ObtenerComentariosDePersonal;
/

-- Para tabla Eventos
CREATE OR REPLACE PROCEDURE InsertarEvento(
    p_IdEventos IN INT,
    p_Nombre IN VARCHAR2,
    p_FechaInicio IN DATE,
    p_FechaFin IN DATE,
    p_Descripcion IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT,
    p_IdCliente IN INT
) AS
BEGIN
    INSERT INTO Eventos (IdEventos, Nombre, FechaInicio, FechaFin, Descripcion, Estado, IdHotel, IdCliente)
    VALUES (p_IdEventos, p_Nombre, p_FechaInicio, p_FechaFin, p_Descripcion, p_Estado, p_IdHotel, p_IdCliente);

    COMMIT;
END InsertarEvento;
/

CREATE OR REPLACE PROCEDURE ActualizarEvento(
    p_IdEventos IN INT,
    p_Nombre IN VARCHAR2,
    p_FechaInicio IN DATE,
    p_FechaFin IN DATE,
    p_Descripcion IN VARCHAR2,
    p_IdHotel IN INT,
    p_IdCliente IN INT
) AS
BEGIN
    UPDATE Eventos
    SET Nombre = p_Nombre,
        FechaInicio = p_FechaInicio,
        FechaFin = p_FechaFin,
        Descripcion = p_Descripcion,
        IdHotel = p_IdHotel,
        IdCliente = p_IdCliente
    WHERE IdEventos = p_IdEventos;

    COMMIT;
END ActualizarEvento;
/

CREATE OR REPLACE PROCEDURE EliminarEvento( --No elimina de la base, solo descativa
    p_IdEventos IN INT
) AS
BEGIN
    UPDATE Eventos
    SET Estado = 'N'
    WHERE IdEventos = p_IdEventos;

    COMMIT;
END EliminarEvento;
/

CREATE OR REPLACE PROCEDURE ObtenerEventos(
    p_IdEventos IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR        -- Cursor de salida
) AS
BEGIN
    IF p_IdEventos IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Eventos
            WHERE IdEventos = p_IdEventos;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Eventos;
    END IF;
END ObtenerEventos;
/

-- Para tabla Promociones
CREATE OR REPLACE PROCEDURE InsertarPromocion(
    p_IdPromocion IN INT,
    p_Descripcion IN VARCHAR2,
    p_FechaInicio IN DATE,
    p_FechaFin IN DATE,
    p_Descuento IN DECIMAL,
    p_IdHotel IN INT,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdCliente IN INT
) AS
BEGIN
    INSERT INTO Promociones (IdPromocion, Descripcion, FechaInicio, FechaFin, Descuento, IdHotel, Estado, IdCliente)
    VALUES (p_IdPromocion, p_Descripcion, p_FechaInicio, p_FechaFin, p_Descuento, p_IdHotel, p_Estado, p_IdCliente);

    COMMIT;
END InsertarPromocion;
/

CREATE OR REPLACE PROCEDURE ActualizarPromocion(
    p_IdPromocion IN INT,
    p_Descripcion IN VARCHAR2,
    p_FechaInicio IN DATE,
    p_FechaFin IN DATE,
    p_Descuento IN DECIMAL,
    p_IdHotel IN INT,
    p_IdCliente IN INT
) AS
BEGIN
    UPDATE Promociones
    SET Descripcion = p_Descripcion,
        FechaInicio = p_FechaInicio,
        FechaFin = p_FechaFin,
        Descuento = p_Descuento,
        IdHotel = p_IdHotel,
        IdCliente = p_IdCliente
    WHERE IdPromocion = p_IdPromocion;

    COMMIT;
END ActualizarPromocion;
/

CREATE OR REPLACE PROCEDURE EliminarPromocion( -- No elimina de la base, solo desactiva
    p_IdPromocion IN INT
) AS
BEGIN
    UPDATE Promociones
    SET Estado = 'N'
    WHERE IdPromocion = p_IdPromocion;

    COMMIT;
END EliminarPromocion;
/

CREATE OR REPLACE PROCEDURE ObtenerPromociones(
    p_IdPromocion IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR          -- Cursor de salida
) AS
BEGIN
    IF p_IdPromocion IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Promociones
            WHERE IdPromocion = p_IdPromocion;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Promociones;
    END IF;
END ObtenerPromociones;
/

-- Para tabla Reservaciones
CREATE OR REPLACE PROCEDURE InsertarReservacion(
    p_IdReservacion IN INT,
    p_EstadoReservacion IN VARCHAR2,
    p_FechaReservacion IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT,
    p_IdCliente IN INT,
    p_IdHabitacion in INT
) AS
BEGIN
    INSERT INTO Reservaciones (IdReservacion, EstadoReservacion, FechaReservacion, Estado, IdHotel, IdCliente,IdHabitacion)
    VALUES (p_IdReservacion, p_EstadoReservacion, p_FechaReservacion, p_Estado, p_IdHotel, p_IdCliente, p_IdHabitacion);

    COMMIT;
END InsertarReservacion;
/

CREATE OR REPLACE PROCEDURE ActualizarReservacion(
    p_IdReservacion IN INT,
    p_EstadoReservacion IN VARCHAR2,
    p_FechaReservacion IN DATE,
    p_IdHotel IN INT,
    p_IdCliente IN INT,
    p_IdHabitacion in INT
) AS
BEGIN
    UPDATE Reservaciones
    SET EstadoReservacion = p_EstadoReservacion,
        FechaReservacion = p_FechaReservacion,
        IdHotel = p_IdHotel,
        IdCliente = p_IdCliente,
        IdHabitacion= p_IdHabitacion
    WHERE IdReservacion = p_IdReservacion;

    COMMIT;
END ActualizarReservacion;
/

CREATE OR REPLACE PROCEDURE EliminarReservacion( -- No elimina de la base, solo desactiva
    p_IdReservacion IN INT
) AS
BEGIN
    UPDATE Reservaciones
    SET Estado = 'N'
    WHERE IdReservacion = p_IdReservacion;

    COMMIT;
END EliminarReservacion;
/

CREATE OR REPLACE PROCEDURE ObtenerReservaciones(
    p_IdReservacion IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdReservacion IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Reservaciones
            WHERE IdReservacion = p_IdReservacion;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Reservaciones;
    END IF;
END ObtenerReservaciones;
/

-- Para tabla comentarios
CREATE OR REPLACE PROCEDURE InsertarComentario(
    p_IdComentarios IN INT,
    p_Asunto IN VARCHAR2,
    p_Descripcion IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdReservacion IN INT,
    p_IdCliente IN INT
) AS
BEGIN
    INSERT INTO Comentarios (IdComentarios, Asunto, Descripcion, Estado, IdReservacion, IdCliente)
    VALUES (p_IdComentarios, p_Asunto, p_Descripcion, p_Estado, p_IdReservacion, p_IdCliente);

    COMMIT;
END InsertarComentario;
/

CREATE OR REPLACE PROCEDURE ActualizarComentario(
    p_IdComentarios IN INT,
    p_Asunto IN VARCHAR2,
    p_Descripcion IN VARCHAR2,
    p_IdReservacion IN INT,
    p_IdCliente IN INT
) AS
BEGIN
    UPDATE Comentarios
    SET Asunto = p_Asunto,
        Descripcion = p_Descripcion,
        IdReservacion = p_IdReservacion,
        IdCliente = p_IdCliente
    WHERE IdComentarios = p_IdComentarios;

    COMMIT;
END ActualizarComentario;
/

CREATE OR REPLACE PROCEDURE EliminarComentario( -- No elimina de la base, solo desactiva
    p_IdComentarios IN INT
) AS
BEGIN
    UPDATE Comentarios
    SET Estado = 'N'
    WHERE IdComentarios = p_IdComentarios;

    COMMIT;
END EliminarComentario;
/

CREATE OR REPLACE PROCEDURE ObtenerComentarios(
    p_IdComentarios IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdComentarios IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Comentarios
            WHERE IdComentarios = p_IdComentarios;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Comentarios;
    END IF;
END ObtenerComentarios;
/

-- Tabla Habitaciones:
-- Procedimiento para insertar datos en Habitaciones
CREATE OR REPLACE PROCEDURE InsertarHabitaciones(
    p_IdHabitaciones IN INT,
    p_NumeroHabitacion IN INT,
    p_TipoHabitacion IN VARCHAR2,
    p_Precio IN DECIMAL,
    p_Estado IN CHAR DEFAULT 'Y'
) AS
BEGIN
    INSERT INTO Habitaciones (IdHabitaciones, NumeroHabitacion, TipoHabitacion, Precio, Estado)
    VALUES (p_IdHabitaciones, p_NumeroHabitacion, p_TipoHabitacion, p_Precio, p_Estado);
    
    COMMIT;
END InsertarHabitaciones;
/
-- Procedimiento para actualizar datos en Habitaciones
CREATE OR REPLACE PROCEDURE ActualizarHabitaciones(
    p_IdHabitaciones IN INT,
    p_NumeroHabitacion IN INT,
    p_TipoHabitacion IN VARCHAR2,
    p_Precio IN DECIMAL
) AS
BEGIN
    UPDATE Habitaciones
    SET NumeroHabitacion = p_NumeroHabitacion,
        TipoHabitacion = p_TipoHabitacion,
        Precio = p_Precio
    WHERE IdHabitaciones = p_IdHabitaciones;
    
    COMMIT;
END ActualizarHabitaciones;
/
-- Procedimiento para "eliminar" (desactivar) datos en Habitaciones
CREATE OR REPLACE PROCEDURE EliminarHabitaciones( --No lo elimina de la base, solo lo "desactiva"
    p_IdHabitaciones IN INT
) AS
BEGIN
    UPDATE Habitaciones
    SET Estado = 'N'
    WHERE IdHabitaciones = p_IdHabitaciones;

    COMMIT;
END EliminarHabitaciones;
/
-- Procedimiento para obtener datos de Habitaciones
CREATE OR REPLACE PROCEDURE ObtenerHabitaciones(
    p_IdHabitaciones IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdHabitaciones IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Habitaciones
            WHERE IdHabitaciones = p_IdHabitaciones;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Habitaciones;
    END IF;
END ObtenerHabitaciones;
/

-- Tabla HistorialReservaciones
-- Procedimiento para insertar datos en HistorialReservaciones
CREATE OR REPLACE PROCEDURE InsertarHistorialReservaciones(
    p_IdHistorial IN INT,
    p_Accion IN VARCHAR2,
    p_FechaModificacion IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdReservacion IN INT
) AS
BEGIN
    INSERT INTO HistorialReservaciones (IdHistorial, Accion, FechaModificacion, Estado, IdReservacion)
    VALUES (p_IdHistorial, p_Accion, p_FechaModificacion, p_Estado, p_IdReservacion);
    
    COMMIT;
END InsertarHistorialReservaciones;
/
-- Procedimiento para actualizar datos en HistorialReservaciones
CREATE OR REPLACE PROCEDURE ActualizarHistorialReservaciones(
    p_IdHistorial IN INT,
    p_Accion IN VARCHAR2,
    p_FechaModificacion IN DATE,
    p_IdReservacion IN INT
) AS
BEGIN
    UPDATE HistorialReservaciones
    SET Accion = p_Accion,
        FechaModificacion = p_FechaModificacion,
        IdReservacion = p_IdReservacion
    WHERE IdHistorial = p_IdHistorial;
    
    COMMIT;
END ActualizarHistorialReservaciones;
/
-- Procedimiento para "eliminar" (desactivar) datos en HistorialReservaciones
CREATE OR REPLACE PROCEDURE EliminarHistorialReservaciones( --No lo elimina de la base, solo lo "desactiva"
    p_IdHistorial IN INT
) AS
BEGIN
    UPDATE HistorialReservaciones
    SET Estado = 'N'
    WHERE IdHistorial = p_IdHistorial;

    COMMIT;
END EliminarHistorialReservaciones;
/
-- Procedimiento para obtener datos de HistorialReservaciones
CREATE OR REPLACE PROCEDURE ObtenerHistorialReservaciones(
    p_IdHistorial IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR            -- Cursor de salida
) AS
BEGIN
    IF p_IdHistorial IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM HistorialReservaciones
            WHERE IdHistorial = p_IdHistorial;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM HistorialReservaciones;
    END IF;
END ObtenerHistorialReservaciones;
/

-- Tabla Check_in
--Procedimientos para la tabla Check_In

CREATE OR REPLACE PROCEDURE InsertarCheckIn(
    p_IdCheckIn IN INT,
    p_FechaCheckIn IN DATE,
    p_HoraCheckIn IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdReservacion IN INT
) AS
BEGIN
    INSERT INTO Check_In (IdCheckIn, FechaCheckIn, HoraCheckIn, Estado, IdReservacion)
    VALUES (p_IdCheckIn, p_FechaCheckIn, p_HoraCheckIn, p_Estado, p_IdReservacion);
    
    COMMIT;
END InsertarCheckIn;
/
CREATE OR REPLACE PROCEDURE ActualizarCheckIn(
    p_IdCheckIn IN INT,
    p_FechaCheckIn IN DATE,
    p_HoraCheckIn IN DATE,
    p_IdReservacion IN INT
) AS
BEGIN
    UPDATE Check_In
    SET FechaCheckIn = p_FechaCheckIn,
        HoraCheckIn = p_HoraCheckIn,
        IdReservacion = p_IdReservacion
    WHERE IdCheckIn = p_IdCheckIn;
    
    COMMIT;
END ActualizarCheckIn;
/

CREATE OR REPLACE PROCEDURE EliminarCheckIn( --No lo elimina de la base, solo lo "desactiva"
    p_IdCheckIn IN INT
) AS
BEGIN
    UPDATE Check_In
    SET Estado = 'N'
    WHERE IdCheckIn = p_IdCheckIn;

    COMMIT;
END EliminarCheckIn;
/
CREATE OR REPLACE PROCEDURE ObtenerCheckIn(
    p_IdCheckIn IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR        -- Cursor de salida
) AS
BEGIN
    IF p_IdCheckIn IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Check_In
            WHERE IdCheckIn = p_IdCheckIn;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Check_In;
    END IF;
END ObtenerCheckIn;
/

-- Tabla Check_out
-- Insertar Check_Out
CREATE OR REPLACE PROCEDURE InsertarCheckOut(
    p_IdCheckOut IN INT,
    p_FechaCheckOut IN DATE,
    p_HoraCheckOut IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdReservacion IN INT
) AS
BEGIN
    INSERT INTO Check_Out (IdCeckOut, FecgaChekOut, HoraCheckOut, Estado, IdReservacion)
    VALUES (p_IdCheckOut, p_FechaCheckOut, p_HoraCheckOut, p_Estado, p_IdReservacion);

    COMMIT;
END InsertarCheckOut;
/

-- Actualizar Check_Out
CREATE OR REPLACE PROCEDURE ActualizarCheckOut(
    p_IdCheckOut IN INT,
    p_FechaCheckOut IN DATE,
    p_HoraCheckOut IN DATE,
    p_IdReservacion IN INT
) AS
BEGIN
    UPDATE Check_Out
    SET FecgaChekOut = p_FechaCheckOut,
        HoraCheckOut = p_HoraCheckOut,
        IdReservacion = p_IdReservacion
    WHERE IdCeckOut = p_IdCheckOut;

    COMMIT;
END ActualizarCheckOut;
/

-- Eliminar (Desactivar) Check_Out
CREATE OR REPLACE PROCEDURE EliminarCheckOut( --No lo elimina de la base, solo lo "desactiva"
    p_IdCheckOut IN INT
) AS
BEGIN
    UPDATE Check_Out
    SET Estado = 'N'
    WHERE IdCeckOut = p_IdCheckOut;

    COMMIT;
END EliminarCheckOut;
/

-- Obtener Check_Out(s)
CREATE OR REPLACE PROCEDURE ObtenerCheckOuts(
    p_IdCheckOut IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR         -- Cursor de salida
) AS
BEGIN
    IF p_IdCheckOut IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Check_Out
            WHERE IdCeckOut = p_IdCheckOut;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Check_Out;
    END IF;
END ObtenerCheckOuts;
/

-- Tabla Pago:
-- Insertar Pago
CREATE OR REPLACE PROCEDURE InsertarPago(
    p_IdPago IN INT,
    p_MetodoPago IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdReservacion IN INT
) AS
BEGIN
    INSERT INTO Pago (IdPago, MetodoPago, Estado, IdReservacion)
    VALUES (p_IdPago, p_MetodoPago, p_Estado, p_IdReservacion);

    COMMIT;
END InsertarPago;
/

-- Actualizar Pago
CREATE OR REPLACE PROCEDURE ActualizarPago(
    p_IdPago IN INT,
    p_MetodoPago IN VARCHAR2,
    p_IdReservacion IN INT
) AS
BEGIN
    UPDATE Pago
    SET MetodoPago = p_MetodoPago,
        IdReservacion = p_IdReservacion
    WHERE IdPago = p_IdPago;

    COMMIT;
END ActualizarPago;
/

-- Eliminar (Desactivar) Pago
CREATE OR REPLACE PROCEDURE EliminarPago( --No lo elimina de la base, solo lo "desactiva"
    p_IdPago IN INT
) AS
BEGIN
    UPDATE Pago
    SET Estado = 'N'
    WHERE IdPago = p_IdPago;

    COMMIT;
END EliminarPago;
/

-- Obtener Pago(s)
CREATE OR REPLACE PROCEDURE ObtenerPagos(
    p_IdPago IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR     -- Cursor de salida
) AS
BEGIN
    IF p_IdPago IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Pago
            WHERE IdPago = p_IdPago;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Pago;
    END IF;
END ObtenerPagos;
/

-- Tabla Factura:
-- Insertar Factura
CREATE OR REPLACE PROCEDURE InsertarFactura(
    p_IdFactura IN INT,
    p_FechaEmision IN DATE,
    p_MontoTotal IN NUMBER,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdPago IN INT
) AS
BEGIN
    INSERT INTO Factura (IdFactura, FechaEmision, MontoTotal, Estado, IdPago)
    VALUES (p_IdFactura, p_FechaEmision, p_MontoTotal, p_Estado, p_IdPago);

    COMMIT;
END InsertarFactura;
/

-- Actualizar Factura
CREATE OR REPLACE PROCEDURE ActualizarFactura(
    p_IdFactura IN INT,
    p_FechaEmision IN DATE,
    p_MontoTotal IN NUMBER,
    p_IdPago IN INT
) AS
BEGIN
    UPDATE Factura
    SET FechaEmision = p_FechaEmision,
        MontoTotal = p_MontoTotal,
        IdPago = p_IdPago
    WHERE IdFactura = p_IdFactura;

    COMMIT;
END ActualizarFactura;
/

-- Eliminar (Desactivar) Factura
CREATE OR REPLACE PROCEDURE EliminarFactura( --No lo elimina de la base, solo lo "desactiva"
    p_IdFactura IN INT
) AS
BEGIN
    UPDATE Factura
    SET Estado = 'N'
    WHERE IdFactura = p_IdFactura;

    COMMIT;
END EliminarFactura;
/

-- Obtener Factura(s)
CREATE OR REPLACE PROCEDURE ObtenerFacturas(
    p_IdFactura IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR         -- Cursor de salida
) AS
BEGIN
    IF p_IdFactura IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Factura
            WHERE IdFactura = p_IdFactura;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Factura;
    END IF;
END ObtenerFacturas;
/

-- Tabla Restaurantes:
-- Insertar Restaurante
CREATE OR REPLACE PROCEDURE InsertarRestaurante(
    p_IdRestaurante IN INT,
    p_NombreRestaurante IN VARCHAR2,
    p_Ubicacion IN VARCHAR2,
    p_HorarioApertura IN DATE,
    p_HorarioCierre IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT
) AS
BEGIN
    INSERT INTO Restaurantes (IdRestaurante, NombreRestaurante, Ubicacion, HorarioApertura, HorarioCierre, Estado, IdHotel)
    VALUES (p_IdRestaurante, p_NombreRestaurante, p_Ubicacion, p_HorarioApertura, p_HorarioCierre, p_Estado, p_IdHotel);

    COMMIT;
END InsertarRestaurante;
/

-- Actualizar Restaurante
CREATE OR REPLACE PROCEDURE ActualizarRestaurante(
    p_IdRestaurante IN INT,
    p_NombreRestaurante IN VARCHAR2,
    p_Ubicacion IN VARCHAR2,
    p_HorarioApertura IN DATE,
    p_HorarioCierre IN DATE,
    p_IdHotel IN INT
) AS
BEGIN
    UPDATE Restaurantes
    SET NombreRestaurante = p_NombreRestaurante,
        Ubicacion = p_Ubicacion,
        HorarioApertura = p_HorarioApertura,
        HorarioCierre = p_HorarioCierre,
        IdHotel = p_IdHotel
    WHERE IdRestaurante = p_IdRestaurante;

    COMMIT;
END ActualizarRestaurante;
/

-- Eliminar (Desactivar) Restaurante
CREATE OR REPLACE PROCEDURE EliminarRestaurante( --No lo elimina de la base, solo lo "desactiva"
    p_IdRestaurante IN INT
) AS
BEGIN
    UPDATE Restaurantes
    SET Estado = 'N'
    WHERE IdRestaurante = p_IdRestaurante;

    COMMIT;
END EliminarRestaurante;
/

-- Obtener Restaurante(s)
CREATE OR REPLACE PROCEDURE ObtenerRestaurantes(
    p_IdRestaurante IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR              -- Cursor de salida
) AS
BEGIN
    IF p_IdRestaurante IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Restaurantes
            WHERE IdRestaurante = p_IdRestaurante;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Restaurantes;
    END IF;
END ObtenerRestaurantes;
/

-- Tabla MenuRestaurantes:
-- Insertar Platillo
CREATE OR REPLACE PROCEDURE InsertarPlatillo(
    p_IdMenu IN INT,
    p_NombrePlatillo IN VARCHAR2,
    p_DescripcionPlatillo IN VARCHAR2,
    p_PrecioPlatillo IN DECIMAL,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdRestaurante IN INT
) AS
BEGIN
    INSERT INTO MenuRestautantes (IdMenu, NombrePlatillo, DescripcionPlatillo, PrecioPlatillo, Estado, IdRestaurante)
    VALUES (p_IdMenu, p_NombrePlatillo, p_DescripcionPlatillo, p_PrecioPlatillo, p_Estado, p_IdRestaurante);

    COMMIT;
END InsertarPlatillo;
/

-- Actualizar Platillo
CREATE OR REPLACE PROCEDURE ActualizarPlatillo(
    p_IdMenu IN INT,
    p_NombrePlatillo IN VARCHAR2,
    p_DescripcionPlatillo IN VARCHAR2,
    p_PrecioPlatillo IN DECIMAL,
    p_IdRestaurante IN INT
) AS
BEGIN
    UPDATE MenuRestautantes
    SET NombrePlatillo = p_NombrePlatillo,
        DescripcionPlatillo = p_DescripcionPlatillo,
        PrecioPlatillo = p_PrecioPlatillo,
        IdRestaurante = p_IdRestaurante
    WHERE IdMenu = p_IdMenu;

    COMMIT;
END ActualizarPlatillo;
/

-- Eliminar (Desactivar) Platillo
CREATE OR REPLACE PROCEDURE EliminarPlatillo( --No lo elimina de la base, solo lo "desactiva"
    p_IdMenu IN INT
) AS
BEGIN
    UPDATE MenuRestautantes
    SET Estado = 'N'
    WHERE IdMenu = p_IdMenu;

    COMMIT;
END EliminarPlatillo;
/

-- Obtener Platillo(s)
CREATE OR REPLACE PROCEDURE ObtenerPlatillos(
    p_IdMenu IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR      -- Cursor de salida
) AS
BEGIN
    IF p_IdMenu IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM MenuRestautantes
            WHERE IdMenu = p_IdMenu;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM MenuRestautantes;
    END IF;
END ObtenerPlatillos;
/

-- Tabla PedidosRestaurantes:
-- Insertar Pedido
CREATE OR REPLACE PROCEDURE InsertarPedido(
    p_IdPedido IN INT,
    p_Descripcion IN VARCHAR2,
    p_Cantidad IN INT,
    p_FechaPedido IN DATE,
    p_HoraPedido IN DATE,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdMenu IN INT
) AS
BEGIN
    INSERT INTO PedidosRestaurante (IdPedido, Descripcion, Cantidad, FechaPedido, HoraPedido, Estado, IdMenu)
    VALUES (p_IdPedido, p_Descripcion, p_Cantidad, p_FechaPedido, p_HoraPedido, p_Estado, p_IdMenu);

    COMMIT;
END InsertarPedido;
/

-- Actualizar Pedido
CREATE OR REPLACE PROCEDURE ActualizarPedido(
    p_IdPedido IN INT,
    p_Descripcion IN VARCHAR2,
    p_Cantidad IN INT,
    p_FechaPedido IN DATE,
    p_HoraPedido IN DATE,
    p_IdMenu IN INT
) AS
BEGIN
    UPDATE PedidosRestaurante
    SET Descripcion = p_Descripcion,
        Cantidad = p_Cantidad,
        FechaPedido = p_FechaPedido,
        HoraPedido = p_HoraPedido,
        IdMenu = p_IdMenu
    WHERE IdPedido = p_IdPedido;

    COMMIT;
END ActualizarPedido;
/

-- Eliminar (Desactivar) Pedido
CREATE OR REPLACE PROCEDURE EliminarPedido( --No lo elimina de la base, solo lo "desactiva"
    p_IdPedido IN INT
) AS
BEGIN
    UPDATE PedidosRestaurante
    SET Estado = 'N'
    WHERE IdPedido = p_IdPedido;

    COMMIT;
END EliminarPedido;
/

-- Obtener Pedido(s)
CREATE OR REPLACE PROCEDURE ObtenerPedidos(
    p_IdPedido IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR        -- Cursor de salida
) AS
BEGIN
    IF p_IdPedido IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM PedidosRestaurante
            WHERE IdPedido = p_IdPedido;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM PedidosRestaurante;
    END IF;
END ObtenerPedidos;
/

-- Tabla Personal:
-- Insertar Personal
CREATE OR REPLACE PROCEDURE InsertarPersonal(
    p_IdPersonal IN INT,
    p_Nombre IN VARCHAR2,
    p_Puesto IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Telefono IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdHotel IN INT,
    p_IdUsuario IN INT
) AS
BEGIN
    INSERT INTO Personal (IdPersonal, Nombre, Puesto, Email, Telefono, Estado, IdHotel, IdUsuario)
    VALUES (p_IdPersonal, p_Nombre, p_Puesto, p_Email, p_Telefono, p_Estado, p_IdHotel, p_IdUsuario);

    COMMIT;
END InsertarPersonal;
/

-- Actualizar Personal
CREATE OR REPLACE PROCEDURE ActualizarPersonal(
    p_IdPersonal IN INT,
    p_Nombre IN VARCHAR2,
    p_Puesto IN VARCHAR2,
    p_Email IN VARCHAR2,
    p_Telefono IN VARCHAR2,
    p_IdHotel IN INT,
    p_IdUsuario IN INT
) AS
BEGIN
    UPDATE Personal
    SET Nombre = p_Nombre,
        Puesto = p_Puesto,
        Email = p_Email,
        Telefono = p_Telefono,
        IdHotel = p_IdHotel,
        IdUsuario = p_IdUsuario
    WHERE IdPersonal = p_IdPersonal;

    COMMIT;
END ActualizarPersonal;
/

-- Eliminar (Desactivar) Personal
CREATE OR REPLACE PROCEDURE EliminarPersonal( --No lo elimina de la base, solo lo "desactiva"
    p_IdPersonal IN INT
) AS
BEGIN
    UPDATE Personal
    SET Estado = 'N'
    WHERE IdPersonal = p_IdPersonal;

    COMMIT;
END EliminarPersonal;
/

-- Obtener Personal(es)
CREATE OR REPLACE PROCEDURE ObtenerPersonal(
    p_IdPersonal IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR          -- Cursor de salida
) AS
BEGIN
    IF p_IdPersonal IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Personal
            WHERE IdPersonal = p_IdPersonal;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Personal;
    END IF;
END ObtenerPersonal;
/

-- Servicios:

-- ServiciosReservaciones
-- Insertar Servicios_Reservaciones
CREATE OR REPLACE PROCEDURE InsertarServiciosReservaciones(
    p_IdServiciosReservaciones IN INT,
    p_Cantidad IN NUMBER,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdReservacion IN INT,
    p_IdServicio IN INT
) AS
BEGIN
    INSERT INTO Servicios_Reservaciones (IdServiciosReservaciones, Cantidad, Estado, IdReservacion, IdServicio)
    VALUES (p_IdServiciosReservaciones, p_Cantidad, p_Estado, p_IdReservacion, p_IdServicio);

    COMMIT;
END InsertarServiciosReservaciones;
/

-- Actualizar Servicios_Reservaciones
CREATE OR REPLACE PROCEDURE ActualizarServiciosReservaciones(
    p_IdServiciosReservaciones IN INT,
    p_Cantidad IN NUMBER,
    p_IdReservacion IN INT,
    p_IdServicio IN INT
) AS
BEGIN
    UPDATE Servicios_Reservaciones
    SET Cantidad = p_Cantidad,
        IdReservacion = p_IdReservacion,
        IdServicio = p_IdServicio
    WHERE IdServiciosReservaciones = p_IdServiciosReservaciones;

    COMMIT;
END ActualizarServiciosReservaciones;
/

-- Eliminar (Desactivar) Servicios_Reservaciones
CREATE OR REPLACE PROCEDURE EliminarServiciosReservaciones( --No lo elimina de la base, solo lo "desactiva"
    p_IdServiciosReservaciones IN INT
) AS
BEGIN
    UPDATE Servicios_Reservaciones
    SET Estado = 'N'
    WHERE IdServiciosReservaciones = p_IdServiciosReservaciones;

    COMMIT;
END EliminarServiciosReservaciones;
/

-- Obtener Servicios_Reservaciones
CREATE OR REPLACE PROCEDURE ObtenerServiciosReservaciones(
    p_IdServiciosReservaciones IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR                          -- Cursor de salida
) AS
BEGIN
    IF p_IdServiciosReservaciones IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Servicios_Reservaciones
            WHERE IdServiciosReservaciones = p_IdServiciosReservaciones;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Servicios_Reservaciones;
    END IF;
END ObtenerServiciosReservaciones;
/


CREATE OR REPLACE PROCEDURE InsertarServicios(
    p_IdServicio IN INT,
    p_Total IN NUMBER,
    p_Descripcion IN VARCHAR2,
    p_Estado IN CHAR DEFAULT 'Y',
    p_IdSalaReunion IN INT,
    p_IdTransporte IN INT,
    p_IdPiscina IN INT,
    p_IdSpa IN INT,
    p_IdGimnasio IN INT,
    p_IdRestaurante IN INT,
    p_IdBiblioteca IN INT
) AS
BEGIN
    INSERT INTO Servicios (IdServicio, Total, descripcion, Estado, IdSalaReunion, IdTransporte, IdPiscina, IdSpa, IdGimnasio, IdRestaurante, IdBiblioteca)
    VALUES (p_IdServicio, p_Total, p_Descripcion, p_Estado, p_IdSalaReunion, p_IdTransporte, p_IdPiscina, p_IdSpa, p_IdGimnasio, p_IdRestaurante, p_IdBiblioteca);

    COMMIT;
END InsertarServicios;
/
CREATE OR REPLACE PROCEDURE ActualizarServicios(
    p_IdServicio IN INT,
    p_Total IN NUMBER,
    p_Descripcion IN VARCHAR2,
    p_IdSalaReunion IN INT,
    p_IdTransporte IN INT,
    p_IdPiscina IN INT,
    p_IdSpa IN INT,
    p_IdGimnasio IN INT,
    p_IdRestaurante IN INT,
    p_IdBiblioteca IN INT
) AS
BEGIN
    UPDATE Servicios
    SET Total = p_Total,
        descripcion = p_Descripcion,
        IdSalaReunion = p_IdSalaReunion,
        IdTransporte = p_IdTransporte,
        IdPiscina = p_IdPiscina,
        IdSpa = p_IdSpa,
        IdGimnasio = p_IdGimnasio,
        IdRestaurante = p_IdRestaurante,
        IdBiblioteca = p_IdBiblioteca
    WHERE IdServicio = p_IdServicio;

    COMMIT;
END ActualizarServicios;
/
CREATE OR REPLACE PROCEDURE EliminarServicios(
    p_IdServicio IN INT
) AS
BEGIN
    UPDATE Servicios
    SET Estado = 'N'
    WHERE IdServicio = p_IdServicio;

    COMMIT;
END EliminarServicios;
/
CREATE OR REPLACE PROCEDURE ObtenerServicios(
    p_IdServicio IN INT DEFAULT NULL,  -- Parámetro opcional para filtrar por ID
    o_Cursor OUT SYS_REFCURSOR          -- Cursor de salida
) AS
BEGIN
    IF p_IdServicio IS NOT NULL THEN
        OPEN o_Cursor FOR
            SELECT *
            FROM Servicios
            WHERE IdServicio = p_IdServicio;
    ELSE
        OPEN o_Cursor FOR
            SELECT *
            FROM Servicios;
    END IF;
END ObtenerServicios;
/

