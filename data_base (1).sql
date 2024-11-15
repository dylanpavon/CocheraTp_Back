
CREATE DATABASE [db_cocheras_final]
GO
USE [db_cocheras_final]
GO
/****** Object:  Table [dbo].[ABONOS]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ABONOS](
	[id_abono] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[precio] [decimal](10, 2) NULL,
 CONSTRAINT [pk_abono] PRIMARY KEY CLUSTERED 
(
	[id_abono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[id_tipo_doc] [int] NULL,
	[nro_documento] [varchar](30) NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[id_iva_condicion] [int] NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE_FACTURAS]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_FACTURAS](
	[id_detalle_factura] [int] IDENTITY(1,1) NOT NULL,
	[id_factura] [int] NULL,
	[id_vehiculo] [int] NULL,
	[fecha_entrada] [datetime] NULL,
	[fecha_salida] [datetime] NULL,
	[id_lugar] [varchar](10) NULL,
	[id_abono] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[descuento] [decimal](4, 2) NULL,
	[recargo] [decimal](4, 2) NULL,
 CONSTRAINT [pk_detalle_factura] PRIMARY KEY CLUSTERED 
(
	[id_detalle_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURAS]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURAS](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[id_cliente] [int] NULL,
	[id_tipo_factura] [int] NULL,
	[id_forma_pago] [int] NULL,
	[id_usuario] [int] NULL,
 CONSTRAINT [pk_factura] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FORMAS_DE_PAGO]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FORMAS_DE_PAGO](
	[id_forma_pago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_forma_pago] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IVA_CONDICIONES]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IVA_CONDICIONES](
	[id_iva_condicion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_iva_condicion] PRIMARY KEY CLUSTERED 
(
	[id_iva_condicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LUGARES]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUGARES](
	[id_lugar] [varchar](10) NOT NULL,
	[seccion_uno] [bit] NULL,
	[seccion_dos] [bit] NULL,
 CONSTRAINT [pk_lugar] PRIMARY KEY CLUSTERED 
(
	[id_lugar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre_marca] [varchar](50) NULL,
 CONSTRAINT [pk_marcas] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MODELOS]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MODELOS](
	[id_modelo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[id_marca] [int] NULL,
 CONSTRAINT [pk_modelo] PRIMARY KEY CLUSTERED 
(
	[id_modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REMITO]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REMITO](
	[id_remito] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NULL,
	[id_lugar] [varchar](10) NULL,
	[fecha_entrada] [datetime] NULL,
 CONSTRAINT [pk_remito] PRIMARY KEY CLUSTERED 
(
	[id_remito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLES]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLES](
	[id_roles] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_roles] PRIMARY KEY CLUSTERED 
(
	[id_roles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPOS_DOC]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOS_DOC](
	[id_tipo_doc] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_doc] PRIMARY KEY CLUSTERED 
(
	[id_tipo_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPOS_FACTURAS]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOS_FACTURAS](
	[id_tipo_factura] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [pk_tipo_factura] PRIMARY KEY CLUSTERED 
(
	[id_tipo_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPOS_VEHICULOS]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOS_VEHICULOS](
	[id_tipo_vehiculo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[precio] [decimal](10, 2) NULL,
 CONSTRAINT [pk_tipo_vehiculo] PRIMARY KEY CLUSTERED 
(
	[id_tipo_vehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[contrasenia] [varchar](50) NULL,
	[id_rol] [int] NULL,
 CONSTRAINT [pk_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VEHICULOS]    Script Date: 09/11/2024 10:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEHICULOS](
	[id_vehiculo] [int] IDENTITY(1,1) NOT NULL,
	[patente] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[id_tipo_vehiculo] [int] NULL,
	[id_modelo] [int] NULL,
 CONSTRAINT [pk_vehiculo] PRIMARY KEY CLUSTERED 
(
	[id_vehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD  CONSTRAINT [fk_iva_condicion] FOREIGN KEY([id_iva_condicion])
REFERENCES [dbo].[IVA_CONDICIONES] ([id_iva_condicion])
GO
ALTER TABLE [dbo].[CLIENTES] CHECK CONSTRAINT [fk_iva_condicion]
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD  CONSTRAINT [fk_tipo_doc] FOREIGN KEY([id_tipo_doc])
REFERENCES [dbo].[TIPOS_DOC] ([id_tipo_doc])
GO
ALTER TABLE [dbo].[CLIENTES] CHECK CONSTRAINT [fk_tipo_doc]
GO
ALTER TABLE [dbo].[DETALLE_FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_abono] FOREIGN KEY([id_abono])
REFERENCES [dbo].[ABONOS] ([id_abono])
GO
ALTER TABLE [dbo].[DETALLE_FACTURAS] CHECK CONSTRAINT [fk_abono]
GO
ALTER TABLE [dbo].[DETALLE_FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_facturas] FOREIGN KEY([id_factura])
REFERENCES [dbo].[FACTURAS] ([id_factura])
GO
ALTER TABLE [dbo].[DETALLE_FACTURAS] CHECK CONSTRAINT [fk_facturas]
GO
ALTER TABLE [dbo].[DETALLE_FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_lugar] FOREIGN KEY([id_lugar])
REFERENCES [dbo].[LUGARES] ([id_lugar])
GO
ALTER TABLE [dbo].[DETALLE_FACTURAS] CHECK CONSTRAINT [fk_lugar]
GO
ALTER TABLE [dbo].[DETALLE_FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_vehiculo] FOREIGN KEY([id_vehiculo])
REFERENCES [dbo].[VEHICULOS] ([id_vehiculo])
GO
ALTER TABLE [dbo].[DETALLE_FACTURAS] CHECK CONSTRAINT [fk_vehiculo]
GO
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[CLIENTES] ([id_cliente])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [fk_cliente]
GO
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_forma_pago] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[FORMAS_DE_PAGO] ([id_forma_pago])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [fk_forma_pago]
GO
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_tipo_factura] FOREIGN KEY([id_tipo_factura])
REFERENCES [dbo].[TIPOS_FACTURAS] ([id_tipo_factura])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [fk_tipo_factura]
GO
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [fk_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[USUARIOS] ([id_usuario])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [fk_usuario]
GO
ALTER TABLE [dbo].[MODELOS]  WITH CHECK ADD  CONSTRAINT [fk_marcas] FOREIGN KEY([id_marca])
REFERENCES [dbo].[MARCAS] ([id_marca])
GO
ALTER TABLE [dbo].[MODELOS] CHECK CONSTRAINT [fk_marcas]
GO
ALTER TABLE [dbo].[REMITO]  WITH CHECK ADD  CONSTRAINT [fk_lugar_remito] FOREIGN KEY([id_lugar])
REFERENCES [dbo].[LUGARES] ([id_lugar])
GO
ALTER TABLE [dbo].[REMITO] CHECK CONSTRAINT [fk_lugar_remito]
GO
ALTER TABLE [dbo].[REMITO]  WITH CHECK ADD  CONSTRAINT [fk_vehiculo_remito] FOREIGN KEY([id_vehiculo])
REFERENCES [dbo].[VEHICULOS] ([id_vehiculo])
GO
ALTER TABLE [dbo].[REMITO] CHECK CONSTRAINT [fk_vehiculo_remito]
GO
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD  CONSTRAINT [fk_roles] FOREIGN KEY([id_rol])
REFERENCES [dbo].[ROLES] ([id_roles])
GO
ALTER TABLE [dbo].[USUARIOS] CHECK CONSTRAINT [fk_roles]
GO
ALTER TABLE [dbo].[VEHICULOS]  WITH CHECK ADD  CONSTRAINT [fk_modelo] FOREIGN KEY([id_modelo])
REFERENCES [dbo].[MODELOS] ([id_modelo])
GO
ALTER TABLE [dbo].[VEHICULOS] CHECK CONSTRAINT [fk_modelo]
GO
ALTER TABLE [dbo].[VEHICULOS]  WITH CHECK ADD  CONSTRAINT [fk_tipo_vehiculos] FOREIGN KEY([id_tipo_vehiculo])
REFERENCES [dbo].[TIPOS_VEHICULOS] ([id_tipo_vehiculo])
GO
ALTER TABLE [dbo].[VEHICULOS] CHECK CONSTRAINT [fk_tipo_vehiculos]
GO
USE [master]
GO
ALTER DATABASE [db_cocheras_final] SET  READ_WRITE 
GO

INSERT INTO MARCAS (nombre_marca) VALUES ('Toyota');
INSERT INTO MARCAS (nombre_marca) VALUES ('Honda');
INSERT INTO MARCAS (nombre_marca) VALUES ('Ford');
INSERT INTO MARCAS (nombre_marca) VALUES ('Chevrolet');
INSERT INTO MARCAS (nombre_marca) VALUES ('Nissan');
INSERT INTO MARCAS (nombre_marca) VALUES ('Volkswagen');
INSERT INTO MARCAS (nombre_marca) VALUES ('Hyundai');
INSERT INTO MARCAS (nombre_marca) VALUES ('Kia');
INSERT INTO MARCAS (nombre_marca) VALUES ('Mazda');
INSERT INTO MARCAS (nombre_marca) VALUES ('Subaru');

INSERT INTO ROLES (descripcion) VALUES ('Administrador');
INSERT INTO ROLES (descripcion) VALUES ('Empleado');


INSERT INTO MODELOS (descripcion, id_marca) VALUES ('Corolla', 1);
INSERT INTO MODELOS (descripcion, id_marca) VALUES ('Civic', 2); 
INSERT INTO MODELOS (descripcion, id_marca) VALUES ('F-150', 3);  
INSERT INTO MODELOS (descripcion, id_marca) VALUES ('Malibu', 4); 
INSERT INTO MODELOS (descripcion, id_marca) VALUES ('Altima', 5);
INSERT INTO MODELOS (descripcion, id_marca) VALUES ('Jetta', 6);
INSERT INTO MODELOS (descripcion, id_marca) VALUES ('Elantra', 7);
INSERT INTO MODELOS (descripcion, id_marca) VALUES ('Sportage', 8);
INSERT INTO MODELOS (descripcion, id_marca) VALUES ('Mazda3', 9);
INSERT INTO MODELOS (descripcion, id_marca) VALUES ('Outback', 10);

INSERT INTO TIPOS_VEHICULOS(descripcion, precio) VALUES ('Automóvil', 2000.00);
INSERT INTO TIPOS_VEHICULOS (descripcion, precio) VALUES ('Motocicleta', 1000.00);
INSERT INTO TIPOS_VEHICULOS (descripcion, precio) VALUES ('Camioneta', 3000.00);


INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('ABC123', 'Rojo', 1, 1);
INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('XYZ456', 'Azul', 1, 2);
INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('LMN789', 'Negro', 3, 3);
INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('JKL012', 'Blanco', 1, 4);
INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('DEF345', 'Verde', 2, 5);
INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('GHI678', 'Gris', 1, 6);
INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('OPQ901', 'Amarillo', 1, 7);
INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('RST234', 'Marrón', 3, 8);
INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('UVW567', 'Violeta', 1, 9);
INSERT INTO VEHICULOS (patente, color, id_tipo_vehiculo, id_modelo) VALUES ('XYZ890', 'Celeste', 1, 10);

INSERT INTO ABONOS (descripcion, precio) VALUES ('Abono Mensual', 40000.00);
INSERT INTO ABONOS (descripcion, precio) VALUES ('Abono Quincenal', 25000.00);
INSERT INTO ABONOS (descripcion, precio) VALUES ('Abono Semanal', 15000.00);

-- Inserts para los primeros 20 registros con 'PA' y un número
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA1', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA2', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA3', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA4', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA5', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA6', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA7', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA8', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA9', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA10', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA11', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA12', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA13', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA14', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA15', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA16', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA17', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA18', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA19', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PA20', 0,0);

-- Inserts para los siguientes 20,0 registros con 'PB' y un número
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB1', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB2', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB3', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB4', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB5', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB6', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB7', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB8', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB9', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB10', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB11', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB12', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB13', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB14', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB15', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB16', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB17', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB18', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB19', 0,0);
INSERT INTO LUGARES (id_lugar, seccion_uno,seccion_dos) VALUES ('PB20', 0,0);


INSERT INTO IVA_CONDICIONES(descripcion) VALUES ('Consumidor Final');
INSERT INTO IVA_CONDICIONES(descripcion) VALUES ('IVA Responsable Inscripto');
INSERT INTO IVA_CONDICIONES(descripcion) VALUES ('IVA Sujeto Externo');
INSERT INTO IVA_CONDICIONES(descripcion) VALUES ('Sujeto No Categorizado');
INSERT INTO IVA_CONDICIONES(descripcion) VALUES ('IVA No Alcanzado');
INSERT INTO IVA_CONDICIONES(descripcion) VALUES ('Responsable Monotributo');

INSERT INTO TIPOS_DOC (descripcion) VALUES ('DNI');
INSERT INTO TIPOS_DOC (descripcion) VALUES ('Pasaporte');
INSERT INTO TIPOS_DOC (descripcion) VALUES ('Cédula de Identidad');
INSERT INTO TIPOS_DOC (descripcion) VALUES ('Libreta De Enrolamiento');
INSERT INTO TIPOS_DOC (descripcion) VALUES ('Libreta Cívica');

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion)
VALUES ('Juan', 'Pérez', 1  , '12345678', 'Ovidio Lagos 262', '01123456789', 'juan.perez@example.com', 1);

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion)
VALUES ('María', 'Gómez', 1, '23456789', 'San Martín 100', '01198765432', 'maria.gomez@example.com', 1);

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion) 
VALUES ('Carlos', 'López', 1, '34567890', 'Rivadavia 62', '01112345678', 'carlos.lopez@example.com', 1);

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion) 
VALUES ('Ana', 'Martínez', 1, '45678901', 'General Alvear 26', '01123456789', 'ana.martinez@example.com', 1);

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion)  
VALUES ('Luis', 'Fernández', 1, '56789012', 'Rivera Indarte 53', '01198765432', 'luis.fernandez@example.com', 1);

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion) 
VALUES ('Lucía', 'Sánchez', 1, '67890123', 'General Paz 22', '01112345678', 'lucia.sanchez@example.com', 1);

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion) 
VALUES ('Javier', 'Rodríguez', 1, '78901234', 'Av. Colón 2632', '01123456789', 'javier.rodriguez@example.com', 1);

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion) 
VALUES ('Gabriela', 'Ramírez', 1, '89012345', '9 de Julio 62', '01198765432', 'gabriela.ramirez@example.com', 1);

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion) 
VALUES ('Diego', 'Torres', 1, '90123456', 'Deán Funes 2692', '01112345678', 'diego.torres@example.com', 1);

INSERT INTO CLIENTES (nombre, apellido, id_tipo_doc, nro_documento, direccion, telefono, email, id_iva_condicion)  
VALUES ('Sofía', 'Vázquez', 1, '01234567', 'Santa Rosa 669', '01123456789', 'sofia.vazquez@example.com', 1);


INSERT INTO TIPOS_FACTURAS(descripcion) VALUES ('Factura C');
INSERT INTO TIPOS_FACTURAS (descripcion) VALUES ('Nota de Débito C');
INSERT INTO TIPOS_FACTURAS (descripcion) VALUES ('Nota de Crédito C');
INSERT INTO TIPOS_FACTURAS (descripcion) VALUES ('Recibo C');

INSERT INTO FORMAS_DE_PAGO (descripcion) VALUES ('Contado');
INSERT INTO FORMAS_DE_PAGO (descripcion) VALUES ('Tarjeta de Crédito');
INSERT INTO FORMAS_DE_PAGO (descripcion) VALUES ('Tarjeta de Débito');
INSERT INTO FORMAS_DE_PAGO (descripcion) VALUES ('QR');

INSERT INTO USUARIOS (usuario, contrasenia,id_rol) VALUES ('usuario1', 'usuario1',1);
INSERT INTO USUARIOS (usuario, contrasenia,id_rol) VALUES ('usuario2', 'usuario2',2);

INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2015-03-15', 1, 1, 1, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2016-07-22', 2, 1, 1, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2018-11-05', 3, 2, 1, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2019-01-18', 4, 2, 1, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2020-09-30', 5, 1, 1, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2021-06-14', 6, 1, 1, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2022-10-09', 7, 2, 1, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2023-02-25', 8, 2, 1, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2024-05-12', 9, 1, 1, 1);
INSERT INTO FACTURAS (fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario) VALUES ('2024-08-19', 10, 1, 1, 1);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2024-04-15 09:30', '2024-04-15 21:30', 1, 5, 'PA1', 1, 600.00, 50.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2019-08-20 10:00', '2019-08-20 22:00', 2, 1, 'PA2', 2, 3200.00, 200.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2018-05-05 22:00', '2018-05-06 08:00', 3, 3, 'PA15', 1, 300.00, 10.00, 5.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2020-07-12 12:00', '2020-07-12 22:00', 4, 4, 'PA16', 2, 700.00, 50.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2021-03-15 07:30', '2021-03-15 19:30', 5, 2, 'PA17', 2, 1500.00, 100.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2023-09-25 09:15', '2023-09-25 17:15', 6, 6, 'PA18', 1, 400.00, 20.00, 10.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2022-11-10 08:00', '2022-11-10 20:00', 7, 7, 'PA19', 2, 800.00, 0.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2024-01-30 21:00', '2024-01-31 09:00', 8, 8, 'PA8', 1, 350.00, 0.00, 5.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2023-06-15 10:00', '2023-06-15 22:00', 9, 3, 'PA9', 2, 600.00, 50.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2022-10-20 08:00', '2022-10-20 20:00', 10, 4, 'PB1', 1, 500.00, 0.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2023-07-11 09:00', '2023-07-11 18:00', 1, 5, 'PB12', 2, 750.00, 0.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2020-12-01 08:30', '2020-12-01 19:30', 2, 2, 'PB3', 1, 450.00, 20.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2024-08-10 20:00', '2024-08-11 08:00', 3, 3, 'PB14', 1, 380.00, 0.00, 30.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2021-09-10 07:00', '2021-09-10 19:00', 4, 4, 'PB5', 2, 500.00, 50.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2023-10-15 09:00', '2023-10-15 18:00', 5, 5, 'PB16', 1, 600.00, 0.00, 15.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2021-11-16 22:00', '2021-11-17 08:00', 6, 6, 'PB7', 1, 300.00, 0.00, 10.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2023-02-28 08:00', '2023-02-28 20:00', 7, 7, 'PB18', 2, 400.00, 0.00, 5.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2022-05-14 21:00', '2022-05-15 09:00', 8, 8, 'PB9', 1, 350.00, 0.00, 0.00);

INSERT INTO DETALLE_FACTURAS (fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar, id_abono, precio, descuento, recargo) 
VALUES ('2024-03-22 10:00', '2024-03-22 20:00', 9, 9, 'PB20', 1, 550.00, 25.00, 0.00);


CREATE PROCEDURE [dbo].[SP_INSERTAR_FACTURA] 
	@fecha DATETIME,
	@id_cliente INT,
	@id_tipo_factura INT,
	@id_forma_pago INT,
	@id_usuario INT,
	@nro_factura int output

AS
BEGIN
	INSERT INTO FACTURAS(fecha, id_cliente, id_tipo_factura, id_forma_pago, id_usuario)
	VALUES (@fecha, @id_cliente, @id_tipo_factura, @id_forma_pago, @id_usuario);
	
	set @nro_factura = SCOPE_IDENTITY(); 
END


ALTER PROCEDURE [dbo].[SP_INSERTAR_DETALLE] 
	@fecha_entrada datetime,
	@fecha_salida datetime,
	@id_factura int,
	@id_vehiculo int,
	@id_lugar varchar(10),
	@id_abono INT,
	@precio decimal(10,2),
	@descuento decimal(10,2),
	@recargo decimal(10,2)

AS
declare @tipo_veiculo int
BEGIN
	INSERT INTO DETALLE_FACTURAS(fecha_entrada, fecha_salida, id_factura, id_vehiculo, id_lugar,id_abono,precio,descuento,recargo )
	VALUES (@fecha_entrada, @fecha_salida, @id_factura, @id_vehiculo, @id_lugar, @id_abono, @precio, @descuento, @recargo);
	
END




