/* 
    UNIVERSIDAD MARIANO GALVEZ DE GUATEMALA
    INGENIERIA EN SISTEMAS
            Víctor Gabriel Madrid Barrios		1690-22-4772
            Juan Marcos Castro Tolentino		1690-22-18398
			Rudy Jaser Samuel Castellanos Lopez	1690-22-9776

*/
CREATE VIEW VistaServiciosHotel AS
SELECT
    h.IdHotel,
    h.Nombre AS NombreHotel,
    h.Direccion AS DireccionHotel,
    h.Ranking AS RakingHotel,
    h.Estado AS HotelEstado,
    b.IdBiblioteca,
    b.Ubicacion AS UbicacionBiblioteca,
    b.HorarioApertura AS BibliotecaHorarioApertura,
    b.HorarioCierre AS BibliotecaHorarioCierre,
    b.Estado AS BibliotecaEstado,
    g.IdGimnasio,
    g.AreasDisponibles AS GimnasioAreasDisponibles,
    g.HorarioApertura AS GimnasioHorarioApertura,
    g.HorarioCierre AS GimnasioHorarioCierre,
    g.Estado AS GimnasioEstado,
    s.IdSpa,
    s.NombreSpa AS SpaNombre,
    s.Servicios AS SpaServicios,
    s.Estado AS SpaEstado,
    t.IdTransporte,
    t.Tipo AS TransporteTipo,
    t.costo AS TransporteCosto,
    t.Estado AS TransporteEstado,
    p.IdPiscina,
    p.NombrePscina AS PiscinaNombre,
    p.Altitud AS PiscinaAltitud,
    p.HorarioApertura AS PiscinaHorarioApertura,
    p.HorarioCierre AS PiscinaHorarioCierre,
    p.Estado AS PiscinaEstado,
    r.IdSalaReunion,
    r.NombreSala AS SalaNombre,
    r.Capacidad AS SalaCapacidad,
    r.Equipamiento AS SalaEquipamiento,
    r.PrecioHora AS SalaPrecioHora,
    r.Estado AS SalaEstado
FROM
    TablaHotel h
LEFT JOIN
    BIBLIOTECA b ON b.IdHotel = h.IdHotel
LEFT JOIN
    Gimnasio g ON g.IdHotel = h.IdHotel
LEFT JOIN
    TablaSpa s ON s.IdHotel = h.IdHotel
LEFT JOIN
    Transporte t ON t.IdHotel = h.IdHotel
LEFT JOIN
    Piscina p ON p.IdHotel = h.IdHotel
LEFT JOIN
    SalasDeReunion r ON r.IdHotel = h.IdHotel;
/
-- Vistas y procedimientos Mark

CREATE VIEW VistaProductosProveedoresCompras AS
SELECT
    p.IdProducto,
    p.NombreProducto AS NombreProducto,
    p.PrecioUnitario AS PrecioProducto,
    p.Estado AS ProductoEstado,
    pr.IdProveedor,
    pr.Nombre AS NombreProveedor,
    pr.Contacto AS ContactoProveedor,
    pr.Telefono AS TelefonoProveedor,
    pr.Estado AS ProveedorEstado,
    c.IdCompra,
    c.DescripcionCompras AS CompraDescripcion,
    c.Total AS CompraTotal,
    c.Estado AS CompraEstado,
    h.IdHotel,
    h.Nombre AS NombreHotel
FROM
    Producto p
LEFT JOIN
    Proveedores pr ON pr.IdProducto = p.IdProducto
LEFT JOIN
    Compras c ON c.IdCompra = p.IdCompra
LEFT JOIN
    TablaHotel h ON h.IdHotel = c.IdHotel;
/
--Vistas Vic
CREATE VIEW VistaRestaurantesYMenu AS
SELECT
    h.IdHotel,
    h.Nombre AS NombreHotel,
    h.Direccion AS DireccionHotel,
    h.Ranking AS RankingHotel,
    h.Estado AS HotelEstado,
    r.IdRestaurante,
    r.NombreRestaurante AS NombreRestaurante,
    r.Ubicacion AS UbicacionRestaurante,
    r.HorarioApertura AS RestauranteHorarioApertura,
    r.HorarioCierre AS RestauranteHorarioCierre,
    r.Estado AS RestauranteEstado,
    m.IdMenu,
    m.NombrePlatillo AS NombrePlatillo,
    m.DescripcionPlatillo AS DescripcionPlatillo,
    m.PrecioPlatillo AS PrecioPlatillo,
    m.Estado AS MenuEstado
FROM
    TablaHotel h
LEFT JOIN
    Restaurantes r ON r.IdHotel = h.IdHotel
LEFT JOIN
    MenuRestautantes m ON m.IdRestaurante = r.IdRestaurante;
/

--/////////////////////////////////////////////////////////
CREATE OR REPLACE TRIGGER No_Eliminar_Reserva_Activa
BEFORE UPDATE ON Reservaciones
FOR EACH ROW
BEGIN
    IF :NEW.Estado = 'N' AND :OLD.EstadoReservacion = 'activa' THEN
        RAISE_APPLICATION_ERROR(-20004, 'No se puede modificar el estado a "N" cuando la reservación está activa.');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER VerificarMetodoPago
BEFORE INSERT ON Pago
FOR EACH ROW
BEGIN
    IF :NEW.MetodoPago IS NULL OR TRIM(:NEW.MetodoPago) = '' THEN
        RAISE_APPLICATION_ERROR(-20004, 'El método de pago no puede estar vacío.');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER VerificarCorreoCliente
BEFORE INSERT ON Clientes
FOR EACH ROW
DECLARE
    v_count INTEGER;
BEGIN
    -- Contamos cuántas filas tienen el mismo correo
    SELECT COUNT(*) INTO v_count 
    FROM Clientes 
    WHERE Email = :NEW.Email;

    -- Si hay al menos un registro, lanzamos el error
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El email ya está registrado.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER PrecioHaabitacion
BEFORE UPDATE ON Habitaciones
FOR EACH ROW
BEGIN
    IF :NEW.Precio <= 0 THEN
        RAISE_APPLICATION_ERROR(-20006, 'El precio de la habitación debe ser mayor que cero.');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER FechaFinMayorInicio
BEFORE UPDATE ON Promociones
FOR EACH ROW
BEGIN
    IF :NEW.FechaFin <= :NEW.FechaInicio THEN
        RAISE_APPLICATION_ERROR(-20010, 'La fecha de fin debe ser posterior a la fecha de inicio.');
    END IF;
END;
/
CREATE OR REPLACE TRIGGER ReservaClienteActivo
BEFORE INSERT ON Reservaciones
FOR EACH ROW
DECLARE
    v_estado CHAR(1);
BEGIN
    SELECT Estado INTO v_estado 
    FROM Clientes 
    WHERE IdCliente = :NEW.IdCliente;

    IF v_estado = 'N' THEN
        RAISE_APPLICATION_ERROR(-20013, 'El cliente asociado no está activo.');
    END IF;
END;
/
--///////////////////////////////////////////////////////////////////
CREATE OR REPLACE TRIGGER InsertarReservaEnLog
AFTER INSERT ON Reservaciones
FOR EACH ROW
BEGIN
    INSERT INTO log (mensaje, fecha) 
    VALUES ('Nueva reservación creada: ID ' || :NEW.IdReservacion || ' para el cliente ' || :NEW.IdCliente, SYSDATE);
END;
/
CREATE OR REPLACE TRIGGER ActualizarReservaEnLog
AFTER UPDATE ON Reservaciones
FOR EACH ROW
BEGIN
    INSERT INTO log (mensaje, fecha) 
    VALUES ('Reservación actualizada: ID ' || :OLD.IdReservacion || ', nuevo estado: ' || :NEW.EstadoReservacion, SYSDATE);
END;
/
CREATE OR REPLACE TRIGGER InsertCompraEnLog
AFTER INSERT ON Compras
FOR EACH ROW
BEGIN
    INSERT INTO log (mensaje, fecha) 
    VALUES ('Nueva compra registrada: ID ' || :NEW.IdCompra || ' - ' || :NEW.DescripcionCompras, SYSDATE);
END;
/
CREATE OR REPLACE TRIGGER InsertPersonalLog
AFTER INSERT ON Personal
FOR EACH ROW
BEGIN
    INSERT INTO log (mensaje, fecha) 
    VALUES ('Nuevo personal creado: ID ' || :NEW.IdPersonal || ' - Nombre: ' || :NEW.Nombre, SYSDATE);
END;
/
---///////////////////////////////////////////////////////////////////
CREATE OR REPLACE FUNCTION TotalReservasPorCliente(p_IdCliente INT) 
RETURN NUMBER IS
    v_TotalReservas INT;
BEGIN
    SELECT COUNT(*) INTO v_TotalReservas 
    FROM Reservaciones 
    WHERE IdCliente = p_IdCliente AND Estado = 'Y';

    RETURN v_TotalReservas;
END;
/
--EJECUTABLE
SELECT 
    c.NombreCliente,
    TotalReservasPorCliente(c.IdCliente) AS TotalReservas
FROM 
    Clientes c
WHERE 
    TotalReservasPorCliente(c.IdCliente) > 0
ORDER BY 
    TotalReservas DESC
FETCH FIRST 5 ROWS ONLY; -- Muestra los 5 clientes más frecuentes
/
CREATE OR REPLACE FUNCTION TotalComprasPorProveedor(p_IdProveedor INT) 
RETURN NUMBER IS
    v_TotalCompras NUMBER;
BEGIN
    SELECT SUM(c.Total) INTO v_TotalCompras 
    FROM Compras c
    JOIN Producto p ON c.IdCompra = p.IdCompra
    JOIN Proveedores pr ON p.IdProducto = pr.IdProveedor
    WHERE pr.IdProveedor = p_IdProveedor AND c.Estado = 'Y';

    RETURN NVL(v_TotalCompras, 0);
END;
/
--EJECUTABLE
SELECT 
    pr.Nombre AS Proveedor,
    TotalComprasPorProveedor(pr.IdProveedor) AS TotalCompras
FROM 
    Proveedores pr;
/
CREATE OR REPLACE FUNCTION VerificarDisponibilidadHabitaciones(p_IdHotel INT) 
RETURN VARCHAR2 IS
    v_TotalHabitaciones NUMBER;
    v_HabitacionesOcupadas NUMBER;
BEGIN
    -- Contar las habitaciones activas para el hotel especificado
    SELECT COUNT(*) INTO v_TotalHabitaciones 
    FROM Habitaciones 
    WHERE Estado = 'Y';

    -- Contar las reservaciones activas para el hotel especificado
    SELECT COUNT(*) INTO v_HabitacionesOcupadas 
    FROM Reservaciones 
    WHERE IdHotel = p_IdHotel AND EstadoReservacion = 'Y';

    -- Verificar la disponibilidad
    IF v_TotalHabitaciones > v_HabitacionesOcupadas THEN
        RETURN 'Hay habitaciones disponibles.';
    ELSE
        RETURN 'No hay habitaciones disponibles.';
    END IF;
END;
/

CREATE OR REPLACE FUNCTION CalcularVentasPeriodo(p_FechaInicio DATE, p_FechaFin DATE) 
RETURN NUMBER IS
    v_TotalVentas NUMBER;
BEGIN
    SELECT SUM(MontoTotal) INTO v_TotalVentas 
    FROM Factura 
    WHERE FechaEmision BETWEEN p_FechaInicio AND p_FechaFin;

    RETURN NVL(v_TotalVentas, 0); -- Devuelve 0 si no hay ventas
END;
/
CREATE OR REPLACE FUNCTION TotalServiciosCliente(p_IdCliente INT) 
RETURN NUMBER IS
    v_TotalServicios NUMBER;
BEGIN
    SELECT SUM(s.Total) INTO v_TotalServicios 
    FROM Servicios_Reservaciones sr
    JOIN Servicios s ON sr.IdServicio = s.IdServicio
    JOIN Reservaciones r ON sr.IdReservacion = r.IdReservacion
    WHERE r.IdCliente = p_IdCliente AND r.Estado = 'Y';

    RETURN NVL(v_TotalServicios, 0); -- Devuelve 0 si no hay servicios
END;
/
CREATE OR REPLACE FUNCTION EstadoReservacion(p_IdReservacion INT) 
RETURN VARCHAR2 IS
    v_EstadoReservacion VARCHAR2(80);
BEGIN
    SELECT EstadoReservacion INTO v_EstadoReservacion
    FROM Reservaciones
    WHERE IdReservacion = p_IdReservacion;

    RETURN v_EstadoReservacion;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No existe la reservación.';
END;
/
CREATE OR REPLACE FUNCTION ContarClientesHotel(p_IdHotel INT) 
RETURN INT IS
    v_CantidadClientes INT;
BEGIN
    SELECT COUNT(DISTINCT c.IdCliente) INTO v_CantidadClientes
    FROM Reservaciones r
    JOIN Clientes c ON r.IdCliente = c.IdCliente
    WHERE r.Estado = 'Y' AND r.IdHotel = p_IdHotel;

    RETURN NVL(v_CantidadClientes, 0); -- Devuelve 0 si no hay clientes
END;
/
CREATE OR REPLACE FUNCTION ContarComentariosCliente(p_IdCliente INT) 
RETURN INT IS
    v_CantidadComentarios INT;
BEGIN
    SELECT COUNT(*) INTO v_CantidadComentarios 
    FROM Comentarios
    WHERE IdCliente = p_IdCliente AND Estado = 'Y';

    RETURN NVL(v_CantidadComentarios, 0); -- Devuelve 0 si no hay comentarios
END;
/


