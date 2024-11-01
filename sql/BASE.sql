/* 
    UNIVERSIDAD MARIANO GALVEZ DE GUATEMALA
    INGENIERIA EN SISTEMAS
            Víctor Gabriel Madrid Barrios		1690-22-4772
            Juan Marcos Castro Tolentino		1690-22-18398
			Rudy Jaser Samuel Castellanos Lopez	1690-22-9776

*/
-- TABLAS MARK
Create Table TablaHotel (
    IdHotel Int PRIMARY KEY,
    Nombre VARCHAR (80),
    Direccion VARCHAR (200),
    Ranking NUMBER,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')) --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
);
Create Table Compras (
    IdCompra Int PRIMARY KEY,
    DescripcionCompras VARCHAR(80),
    Total NUMBER (15,2),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel Int REFERENCES TablaHotel(IdHotel));

Create Table Inventario (
    IdInventario Int PRIMARY KEY,
    FechaModificacion DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdCompra Int REFERENCES Compras(IdCompra));

Create Table Producto (
    IdProducto Int PRIMARY KEY,
    NombreProducto VARCHAR(80),
    PrecioUnitario NUMBER(10,2),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdCompra REFERENCES Compras(IdCompra));

Create Table Proveedores (
    IdProveedor Int PRIMARY KEY,
    Nombre VARCHAR(50),
    Contacto VARCHAR(80),
    Telefono VARCHAR(30),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdProducto REFERENCES Producto(IdProducto));

Create Table Usuario (
    IdUsuario Int PRIMARY KEY,
    CodigoUsuario Int,
    NombreUsuario VARCHAR (80),
    Email VARCHAR(80),
    Contraseña VARCHAR (30),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')) --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
);

Create Table Clientes (
    IdCliente Int PRIMARY KEY,
    NombreCliente VARCHAR(80),
    Email VARCHAR (80),
    Telefono VARCHAR (80),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdUsuario Int REFERENCES Usuario(IdUsuario));


Create Table Eventos (
    IdEventos Int PRIMARY KEY,
    Nombre VARCHAR(100),
    FechaInicio DATE,
    FechaFin DATE,
    Descripcion VARCHAR(200),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel Int REFERENCES TablaHotel(IdHotel),
    IdCliente Int REFERENCES Clientes(IdCliente));

Create Table Promociones (
    IdPromocion Int PRIMARY KEY,
    Descripcion VARCHAR(200),
    FechaInicio DATE,
    FechaFin DATE,
    Descuento DECIMAL(5,2),
    IdHotel Int REFERENCES TablaHotel(IdHotel),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdCliente Int REFERENCES Clientes(IdCliente));
    
Create Table Habitaciones (
    IdHabitaciones Int PRIMARY KEY,
    NumeroHabitacion Int,
    TipoHabitacion VARCHAR (50),
    Precio DECIMAL (10,2),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')) --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
);

Create Table Reservaciones (
    IdReservacion Int PRIMARY KEY,
    EstadoReservacion VARCHAR (80),
    FechaReservacion DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel REFERENCES TablaHotel(IdHotel),
    IdCliente REFERENCES Clientes(IdCliente),
    IdHabitacion REFERENCES Habitaciones(IdHabitaciones));

Create Table Comentarios (
    IdComentarios Int PRIMARY KEY,
    Asunto VARCHAR (100),
    Descripcion VARCHAR(250),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdReservacion REFERENCES Reservaciones(IdReservacion),
    IdCliente REFERENCES Clientes(IdCliente));


--Jaser
CREATE TABLE BIBLIOTECA(
    IdBiblioteca int Primary Key,
    Ubicacion varchar(100),
    HorarioApertura DATE,
    HorarioCierre DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel int References TablaHotel(idHotel)
);

CREATE TABLE Gimnasio(
    IdGimnasio int Primary Key,
    AreasDisponibles varchar(100),
    HorarioApertura DATE,
    HorarioCierre DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel int References TablaHotel(idHotel)
);

CREATE TABLE TablaSpa(
    IdSpa int Primary Key,
    NombreSpa varchar(100),
    Servicios varchar(80),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel int References TablaHotel(idHotel)
);



CREATE TABLE Transporte(
    IdTransporte int Primary Key,
    Tipo varchar(50),
    costo number(10,2),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel int References TablaHotel(idHotel)
);

CREATE TABLE Piscina(
    IdPiscina int Primary Key,
    NombrePscina varchar(100),
    Altitud number,
    HorarioApertura DATE,
    HorarioCierre DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel int References TablaHotel(idHotel)
);

CREATE TABLE SalasDeReunion(
    IdSalaReunion int Primary Key,
    NombreSala varchar(100),
    Capacidad number,
    Equipamiento varchar(120),
    PrecioHora Number(10,2),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel int References TablaHotel(idHotel)
);

-- Gabriel


Create Table HistorialReservaciones (
    IdHistorial Int PRIMARY KEY,
    Accion VARCHAR (80),
    FechaModificacion DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdReservacion Int REFERENCES Reservaciones(IdReservacion));

Create Table Check_In (
    IdCheckIn  Int PRIMARY KEY,
    FechaCheckIn DATE,
    HoraCheckIn DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdReservacion REFERENCES Reservaciones(IdReservacion));

Create Table Check_Out (
    IdCeckOut Int PRIMARY KEY,
    FecgaChekOut DATE,
    HoraCheckOut DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdReservacion Int REFERENCES Reservaciones(IdReservacion));

Create Table Pago (
    IdPago Int PRIMARY KEY,
    MetodoPago VARCHAR (80),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdReservacion Int REFERENCES Reservaciones(IdReservacion));

Create Table Factura (
    IdFactura Int PRIMARY KEY,
    FechaEmision DATE,
    MontoTotal NUMBER (10,2),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdPago Int REFERENCES Pago(IdPago));

Create Table Restaurantes (
    IdRestaurante Int PRIMARY KEY,
    NombreRestaurante VARCHAR (50),
    Ubicacion VARCHAR (100),
    HorarioApertura DATE,
    HorarioCierre DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel Int REFERENCES TablaHotel(IdHotel));

Create Table MenuRestautantes (
    IdMenu Int PRIMARY KEY,
    NombrePlatillo VARCHAR (80),
    DescripcionPlatillo VARCHAR (100),
    PrecioPlatillo DECIMAL (10,2),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdRestaurante Int REFERENCES Restaurantes (IdRestaurante));

Create Table PedidosRestaurante (
    IdPedido Int PRIMARY KEY,
    Descripcion VARCHAR (100),
    Cantidad Int,
    FechaPedido DATE,
    HoraPedido DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdMenu Int REFERENCES MenuRestautantes(IdMenu));

Create Table Personal (
    IdPersonal Int PRIMARY KEY,
    Nombre VARCHAR (80),
    Puesto VARCHAR (80),
    Email VARCHAR (100),
    Telefono VARCHAR (50),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdHotel Int REFERENCES TablaHotel (IdHotel),
    IdUsuario Int REFERENCES Usuario (IdUsuario));

Create Table ComentariosDePersonal (
    IdComentario Int PRIMARY KEY,
    Comentario VARCHAR (800),
    FechaComentario DATE,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdPersonal Int REFERENCES Personal(IdPersonal),
    IdCliente Int REFERENCES Clientes(IdCliente));

Create Table Servicios (
    IdServicio Int PRIMARY KEY,
    Total number(10,2),
    descripcion varchar(80),
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdSalaReunion Int REFERENCES SalasDeReunion (IdSalaReunion),
    IdTransporte Int REFERENCES Transporte (IdTransporte),
    IdPiscina Int REFERENCES Piscina (IdPiscina),
    IdSpa Int REFERENCES TablaSpa (IdSpa),
    IdGimnasio Int REFERENCES Gimnasio (IdGimnasio),
    IdRestaurante Int REFERENCES Restaurantes (IdRestaurante),
    IdBiblioteca Int REFERENCES BIBLIOTECA (IdBiblioteca));


Create Table Servicios_Reservaciones (
    IdServiciosReservaciones Int PRIMARY KEY,
    Cantidad number,
    Estado CHAR(1) CHECK (Estado IN ('Y', 'N')), --Verifica Y es dato Activo, N es dato No Activo, solo permite esos 2 datos
    IdReservacion Int REFERENCES Reservaciones(IdReservacion),
    IdServicio Int REFERENCES Servicios(IdServicio));
    
--LOG
CREATE TABLE log (
    id_log INT PRIMARY KEY,
    mensaje VARCHAR(255),
    fecha DATE
);

