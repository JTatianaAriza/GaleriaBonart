create database ProyectoFinal_GaleriaBonart;
use ProyectoFinal_GaleriaBonart;

-- Creación de tablas principales:
 -- Creación de la tabla de Artistas
CREATE TABLE Artista (
    ID_Artista INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Ciudad VARCHAR(255),
    ExposicionesAnteriores TEXT
);

-- Creación de la tabla de TelefonosArtistas
CREATE TABLE TelefonoArtista (
    ID_Artista INT,
    Telefono VARCHAR(20),
    PRIMARY KEY (ID_Artista, Telefono),
    FOREIGN KEY (ID_Artista) REFERENCES Artista(ID_Artista)
);

-- Creación de la tabla de Obras
CREATE TABLE Obra (
    ID_Obra INT PRIMARY KEY,
    ID_Artista INT,
    NombreObra VARCHAR(255),
    Precio DECIMAL(10, 2),
    EnVenta BOOLEAN,
    Categoria varchar (255),
    FOREIGN KEY (ID_Artista) REFERENCES Artista(ID_Artista)
);

-- Creación de la tabla de Responsables
CREATE TABLE Responsable (
    ID_Responsable INT PRIMARY KEY,
    NombreResponsable VARCHAR(255),
    Telefono VARCHAR(255),
    CorreoElectronico VARCHAR(255)
);

-- Creación de la tabla de Salas
CREATE TABLE Sala (
    ID_Sala INT PRIMARY KEY,
    NombreSala VARCHAR(255),
    ID_Responsable INT,
    FechaAsignacion DATE,
    FOREIGN KEY (ID_Responsable) REFERENCES Responsable(ID_Responsable)
);

-- Creación de la tabla de ObrasEnSalas
CREATE TABLE ObraEnSala (
    ID_Obra INT,
    ID_Sala INT,
    FechaInicio DATE,
    FechaFin DATE,
    primary key (ID_Obra, ID_Sala),
    FOREIGN KEY (ID_Obra) REFERENCES Obra(ID_Obra),
    FOREIGN KEY (ID_Sala) REFERENCES Sala(ID_Sala)
);

-- Creación de la tabla de Clientes
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    NombreCliente VARCHAR(255),
    CorreoElectronico VARCHAR(255)
);

-- Creación de la tabla de TelefonosClientes
CREATE TABLE Telefono_Cliente (
    ID_Cliente INT,
    Telefono VARCHAR(20),
    PRIMARY KEY (ID_Cliente, Telefono),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Creación de la tabla de Ventas
CREATE TABLE Venta (
    ID_Venta INT PRIMARY KEY,
    ID_Obra INT,
    ID_Cliente INT,
    ID_Sala INT,
    ID_Responsable INT,
    ValorPagado DECIMAL(10, 2),
    FechaVenta DATE,
    FOREIGN KEY (ID_Obra) REFERENCES Obra(ID_Obra),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Sala) REFERENCES Sala(ID_Sala),
	FOREIGN KEY (ID_responsable) REFERENCES Sala(ID_Responsable)
);

-- Creación de la tabla de Ingresos
CREATE TABLE Ingreso (
    ID_Ingreso INT PRIMARY KEY,
    TipoCliente ENUM('Adulto', 'Menor') NOT NULL,
    ValorIngreso DECIMAL(10, 2),
    ID_Cliente INT,
    FechaIngreso DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Insercción de datos

-- Inserción de datos de muestra en la tabla de Artistas
INSERT INTO Artista (ID_Artista, Nombre, Direccion, Ciudad, ExposicionesAnteriores)
VALUES
	(1, 'Pablo Picasso', 'Calle Artista 123', 'Barcelona', 'Expo1, Expo2'),
	(2, 'Frida Kahlo', 'Avenida Pintor 456', 'Ciudad de México', 'Expo3'),
	(3, 'Leonardo da Vinci', 'Via Artista 789', 'Florencia', 'Expo4, Expo5'), 
	(4, 'Vincent van Gogh', 'Rue Peintre 101', 'Amsterdam', 'Expo6'),
    (5, 'Salvador Dalí', 'Carrer Pintor 234', 'Figueres', 'Expo7, Expo8'),
    (6, 'Georgia O Keeffe', 'Artist Street 567', 'Santa Fe', 'Expo9'),
    (7, 'Diego Rivera', 'Calle Muralista 890', 'Ciudad de México', 'Expo10, Expo11'),
    (8, 'Fernando Botero', 'Carrera Pintor 789', 'Medellín', 'Expo12, Expo13'),
    (9, 'Yayoi Kusama', 'Street Artist 456', 'Tokio', 'Expo14'),
    (10, 'Banksy', 'Graffiti Road 101', 'Bristol', 'Expo15');
    
-- Inserción de datos de muestra en la tabla de TelefonosArtistas
INSERT INTO TelefonoArtista (ID_Artista, Telefono)
VALUES
	(1, '123-456-7890'),
	(1, '987-654-3210'),
	(2, '555-123-4567'),
	(3, '956-854-9564'),
	(4, '212-922-3133'),
	(4, '444-555-6656'),
	(5, '768-853-9646'),
	(6, '111-222-3333'),
	(7, '555-444-3333'),
	(7, '999-888-7777'),
	(8, '123-456-7890'),
	(9, '555-666-7777'), 
    (10, '666-666-6660');

-- Inserción de datos de muestra en la tabla de Obras
INSERT INTO Obra (ID_Obra, ID_Artista, NombreObra, Precio, EnVenta, Categoria)
VALUES
	(1, 4, 'La Noche Estrellada', 15000.00, TRUE, 'Escultura'),
	(2, 1, 'Les Demoiselles d''Avignon', 20000.00, TRUE, 'Dibujo'),
	(3, 2, 'Autorretrato con collar de espinas y colibrí', 18000.00, TRUE, 'Garabato'),
	(4, 5, 'La persistencia de la memoria', 22000.00, TRUE, 'Pintura'),
	(5, 3, 'La última cena', 25000.00, TRUE, 'Dibujo'),
	(6, 5, 'Los elefantes', 19000.00, FALSE, 'Garabato'),
	(7, 4, 'Lirios', 12000.00, TRUE, 'Escultura'),
	(8, 7, 'Sueño de una tarde dominical en la Alameda Central', 18000.00, TRUE, 'Garabato'),
	(9, 1, 'Mujer en el espejo', 20000.00, TRUE, 'Pintura'),
	(10, 9, 'Dots Obsession', 30000.00, TRUE, 'Escultura'),
	(11, 10, 'Girl with a Balloon', 17000.00, FALSE, 'Escultura'),
    (12, 6, 'Jimson Weed', 45000.00, FALSE, 'Garabato'),
    (13, 8, 'Dancers at the Bar', 29000.00, FALSE, 'Dibujo'),
    (14, 8, 'Dead Bishops', 56700.00, FALSE, 'Pintura');

-- Inserción de datos de muestra en la tabla de Responsables
INSERT INTO Responsable (ID_Responsable, NombreResponsable, Telefono, CorreoElectronico)
VALUES
	(1, 'Ana Martínez', '555-789-1234', 'ana@example.com'),
	(2, 'Juan Sánchez', '555-456-7890', 'juan@example.com'),
	(3, 'María Rodríguez', '555-111-2222', 'maria@example.com'),
	(4, 'Carlos López', '555-333-4444', 'carlos@example.com'),
	(5, 'Laura García', '555-555-6666', 'laura@example.com'),
	(6, 'Pedro Martínez', '555-777-8888', 'pedro@example.com');

-- Inserción de datos de muestra en la tabla de Salas
INSERT INTO Sala (ID_Sala, NombreSala, ID_Responsable, FechaAsignacion)
VALUES
	(1, 'Sala Picasso', 1, '2023-01-01'),
	(2, 'Sala Kahlo', 2, '2023-01-05'),
	(3, 'Sala Dalí', 3, '2023-01-10'),
	(4, 'Sala O''Keeffe', 4, '2023-01-15'),
	(5, 'Sala Rivera', 5, '2023-01-20'),
	(6, 'Sala Botero', 6, '2023-01-25');

-- Inserción de datos de muestra en la tabla de ObrasEnSalas
INSERT INTO ObraEnSala (ID_Obra, ID_Sala, FechaInicio, FechaFin)
VALUES
	(1, 1, '2023-01-01', '2023-01-07'),
	(2, 2, '2023-01-08', '2023-01-14'),
	(3, 3, '2023-01-05', '2023-01-12'),
	(4, 4, '2023-01-15', '2023-01-22'),
	(5, 5, '2023-01-23', '2023-01-30'),
	(6, 6, '2023-01-20', '2023-01-27'),
	(7, 1, '2023-01-28', '2023-02-04'),
	(8, 2, '2023-01-25', '2023-02-01'),
	(9, 3, '2023-02-02', '2023-02-09'),
	(10, 4, '2023-02-01', '2023-02-08'),
	(11, 5, '2023-02-09', '2023-02-16'),
	(12, 6, '2023-01-10', '2023-01-17'),
	(13, 1, '2023-01-18', '2023-01-25'),
	(14, 2, '2023-01-15', '2023-01-22');

-- Inserción de datos de muestra en la tabla de Clientes
INSERT INTO Cliente (ID_Cliente, NombreCliente, CorreoElectronico)
VALUES
	(1, 'María Rodríguez', 'maria@example.com'),
	(2, 'Carlos Pérez', 'carlos@example.com'),
	(3, 'Laura Gómez', 'laura@example.com'),
	(4, 'Javier Martínez', 'javier@example.com'),
	(5, 'Ana García', 'ana@example.com'),
	(6, 'Pedro Sánchez', 'pedro@example.com'),
	(7, 'Isabel López', 'isabel@example.com'),
	(8, 'Miguel Torres', 'miguel@example.com'),
	(9, 'Carmen Ruiz', 'carmen@example.com'),
	(10, 'Francisco Gutiérrez', 'francisco@example.com'),
	(11, 'Sana Minatozaki', 'sana@example.com'),
	(12, 'Laura Murillo', 'lauvv@example.com');
    
-- Inserción de datos de muestra en la tabla de TelefonosClientes
INSERT INTO Telefono_Cliente (ID_Cliente, Telefono)
VALUES
	(1, '555-111-2222'),
	(2, '555-333-4444'),
	(3, '555-555-6666'),
	(4, '555-777-8888'),
	(5, '555-999-0000'),
	(6, '666-666-666'),
	(7, '555-315-4800'),
	(8, '555-555-555'),
	(9, '554-713-5897'),
	(10, '555-952-5123'),
	(11, '555-111-6664'),
	(12, '555-333-2129');
    
-- Inserción de datos de muestra en la tabla de Ventas
INSERT INTO Venta (ID_Venta, ID_Obra, ID_Cliente, ID_Sala, ID_Responsable, ValorPagado, FechaVenta)
VALUES
	(1, 1, 1, 6, 1, 12000.00, '2023-01-02'),
	(2, 2, 2, 5, 2, 18000.00, '2023-01-05'),
	(3, 3, 3, 4, 3, 20000.00, '2023-01-05'),
	(4, 4, 4, 3, 5, 15000.00, '2023-01-10'),
	(5, 5, 5, 2, 4, 22000.00, '2023-01-20'),
	(6, 6, 6, 1, 6, 25000.00, '2023-01-29'),
    (7, 9, 11, 5, 4, 1.00, '2023-01-25');
    
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`proyectofinal_galeriabonart`.`venta`, CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`ID_Sala`) REFERENCES `sala` (`ID_Sala`))
    

-- Inserción de datos de muestra en la tabla de Ingresos
INSERT INTO Ingreso (ID_Ingreso, TipoCliente, ValorIngreso, ID_Cliente, FechaIngreso)
VALUES
	(1, 'Adulto', 10.00, 1, '2023-01-02'),
	(2, 'Menor', 5.00, 2, '2023-01-05'),
	(3, 'Adulto', 10.00, 3, '2023-01-05'),
	(4, 'Menor', 5.00, 4, '2023-01-10'),
	(5, 'Adulto', 10.00, 5, '2023-01-20'),
	(6, 'Menor', 5.00, 6, '2023-01-29'),
	(7, 'Adulto', 10.00, 7, '2023-01-15'),
	(8, 'Menor', 5.00, 8, '2023-01-18'),
	(9, 'Adulto', 10.00, 9, '2023-01-18'),
	(10, 'Menor', 5.00, 10, '2023-01-07'),
	(11, 'Adulto', 10.00, 11, '2023-01-22'),
	(12, 'Menor', 5.00, 12, '2023-01-24');

-- Consultas

-- DATOS DE ARTISTA
SELECT Artista.*, TelefonoArtista.Telefono
FROM Artista 
LEFT JOIN TelefonoArtista ON Artista.ID_Artista = TelefonoArtista.ID_Artista;

-- DATOS DE LAS OBRAS VENDIDAS
-- obras vendidas en una sala especifica
SELECT Sala.NombreSala, COUNT(Venta.ID_Obra) AS 'Obras Vendidas'
FROM Sala
INNER JOIN Venta ON Sala.ID_Sala = Venta.ID_Sala
GROUP BY Sala.NombreSala; 

-- tarifa/ingreso/entrada por cliente general 
select * from Ingreso;

-- tarifa/ingreso/entrada por cliente especifico
SELECT 
    FechaIngreso,
    SUM(CASE WHEN TipoCliente = 'Adulto' THEN ValorIngreso ELSE 0 END) AS 'Total Adultos',
    SUM(CASE WHEN TipoCliente = 'Menor' THEN ValorIngreso ELSE 0 END) AS 'Total Menores',
    SUM(ValorIngreso) AS 'Total Recaudado'
FROM Ingreso
GROUP BY FechaIngreso;

-- clientes
SELECT Cliente.*, Telefono_Cliente.Telefono
FROM Cliente
LEFT JOIN Telefono_Cliente ON Cliente.ID_Cliente = Telefono_Cliente.ID_Cliente;

-- obras de cada artista
SELECT Artista.Nombre AS 'Nombre Artista', Obra.NombreObra AS 'Nombre Obra', Obra.Categoria, CASE Obra.EnVenta
        WHEN 1 THEN 'Sí'
        WHEN 0 THEN 'No'
    END AS 'En Venta'
FROM Artista
JOIN Obra ON Artista.ID_Artista = Obra.ID_Artista;

-- Listado de salas
SELECT Sala.*, Responsable.NombreResponsable, Responsable.Telefono
FROM Sala
JOIN Responsable ON Sala.ID_Responsable = Responsable.ID_Responsable;
 
-- Obras ubicadas en cada sala
select * from ObraEnSala;

-- ventas día
SELECT FechaVenta, COUNT(ID_Obra) AS 'Obras Vendidas', SUM(ValorPagado) AS 'Valor Ventas'
FROM Venta
GROUP BY FechaVenta;

-- Ventas semana
SELECT YEAR(FechaVenta) AS Año, WEEK(FechaVenta) AS Semana, COUNT(ID_Obra) AS 'Obras Vendidas', SUM(ValorPagado) AS 'Valor Ventas'
FROM Venta
GROUP BY Año, Semana ORDER BY Año, Semana;

-- Ventas Total
SELECT COUNT(ID_Obra) AS 'Obras Vendidas', SUM(ValorPagado) AS 'Valor Ventas'
FROM Venta;

-- Ventas por día específico
SELECT * FROM Venta WHERE Venta.FechaVenta = '2023-01-29';
