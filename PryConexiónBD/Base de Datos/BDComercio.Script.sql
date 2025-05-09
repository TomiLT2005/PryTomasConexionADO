USE [master]
GO
/****** Object:  Database [Comercio]    Script Date: 5/5/2025 08:03:40 ******/
CREATE DATABASE [Comercio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Comercio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Comercio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Comercio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Comercio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Comercio] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Comercio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Comercio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Comercio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Comercio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Comercio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Comercio] SET ARITHABORT OFF 
GO
ALTER DATABASE [Comercio] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Comercio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Comercio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Comercio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Comercio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Comercio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Comercio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Comercio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Comercio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Comercio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Comercio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Comercio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Comercio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Comercio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Comercio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Comercio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Comercio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Comercio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Comercio] SET  MULTI_USER 
GO
ALTER DATABASE [Comercio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Comercio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Comercio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Comercio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Comercio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Comercio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Comercio] SET QUERY_STORE = ON
GO
ALTER DATABASE [Comercio] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Comercio]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 5/5/2025 08:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 5/5/2025 08:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 5/5/2025 08:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](255) NULL,
	[Precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[CategoriaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 5/5/2025 08:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (1, N'Tecnología')
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (2, N'Hogar')
INSERT [dbo].[Categorias] ([Id], [Nombre]) VALUES (3, N'Ropa')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
INSERT [dbo].[Estados] ([Id], [Nombre]) VALUES (1, N'Activo')
INSERT [dbo].[Estados] ([Id], [Nombre]) VALUES (2, N'Bloqueado')
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (1, N'Notebook Lenovo', N'Notebook i5 8GB RAM', CAST(850000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (3, N'Mouse Logitech', N'Gamer y Profesional', CAST(25000.00 AS Decimal(10, 2)), 30, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (4, N'Teclado Redragon', N'Mecánico RGB', CAST(45000.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (5, N'Monitor Samsung', N'24", Full HD', CAST(95000.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (6, N'Impresora Epson', N'Multifunción Wi-Fi', CAST(120000.00 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (7, N'Auriculares Sony', N'Bluetooth con micrófono', CAST(68000.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (8, N'Parlante JBL', N'Portátil, resistente al agua', CAST(92000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (9, N'Disco SSD Kingston', N'480GB, SATA III', CAST(38000.00 AS Decimal(10, 2)), 28, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (10, N'Tablet Samsung', N'10", 64GB', CAST(210000.00 AS Decimal(10, 2)), 9, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (11, N'Cámara Canon', N'Reflex, 24MP, lente 18-55mm', CAST(600000.00 AS Decimal(10, 2)), 4, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (12, N'Smartwatch Xiaomi', N'Pantalla AMOLED, GPS', CAST(130000.00 AS Decimal(10, 2)), 11, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (13, N'Smart TV LG', N'50", 4K UHD, WebOS', CAST(550000.00 AS Decimal(10, 2)), 6, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (14, N'Router TP-Link', N'Wi-Fi 6, doble banda', CAST(65000.00 AS Decimal(10, 2)), 14, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (15, N'Disco Externo WD', N'1TB, USB 3.0', CAST(72000.00 AS Decimal(10, 2)), 8, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (16, N'Notebook Dell', N'Ryzen 5, 16GB RAM, 512GB SSD', CAST(1120000.00 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (17, N'Placa de Video NVIDIA', N'RTX 3060, 12GB', CAST(390000.00 AS Decimal(10, 2)), 3, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (18, N'Procesador AMD Ryzen 7', N'8 núcleos, 4.4GHz', CAST(250000.00 AS Decimal(10, 2)), 6, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (19, N'Motherboard ASUS', N'B550, AM4, DDR4', CAST(140000.00 AS Decimal(10, 2)), 7, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (20, N'Memoria RAM Corsair', N'16GB DDR4 3200MHz', CAST(68000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (21, N'Teclado Logitech MX', N'Ergonómico, silencioso', CAST(86000.00 AS Decimal(10, 2)), 9, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (22, N'Mouse Gamer Razer', N'RGB, 16000 DPI', CAST(72000.00 AS Decimal(10, 2)), 13, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (23, N'Webcam Logitech', N'Full HD 1080p, micrófono', CAST(85000.00 AS Decimal(10, 2)), 6, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (24, N'Micrófono Blue Yeti', N'USB, profesional', CAST(155000.00 AS Decimal(10, 2)), 4, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (25, N'Monitor LG UltraWide', N'34", IPS, 144Hz', CAST(320000.00 AS Decimal(10, 2)), 3, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (26, N'Fuente EVGA', N'750W, 80+ Gold', CAST(95000.00 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (27, N'Gabinete NZXT', N'Cristal templado, RGB', CAST(120000.00 AS Decimal(10, 2)), 4, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (28, N'Cargador Anker', N'USB-C 65W, portátil', CAST(38000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (29, N'Hub USB-C', N'7 puertos, aluminio', CAST(42000.00 AS Decimal(10, 2)), 8, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (30, N'Cable HDMI 4K', N'2 metros, alta velocidad', CAST(18000.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (31, N'SSD NVMe Samsung', N'1TB, PCIe 4.0', CAST(165000.00 AS Decimal(10, 2)), 6, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (32, N'Power Bank Xiaomi', N'10000mAh, carga rápida', CAST(46000.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (33, N'Auriculares Apple', N'AirPods 3ra Gen', CAST(180000.00 AS Decimal(10, 2)), 7, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (34, N'Proyector Epson', N'Full HD, HDMI, portátil', CAST(350000.00 AS Decimal(10, 2)), 2, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (35, N'Joystick Xbox', N'Inalámbrico, vibración', CAST(82000.00 AS Decimal(10, 2)), 9, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (36, N'Consola PS5', N'825GB, edición estándar', CAST(1100000.00 AS Decimal(10, 2)), 3, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (37, N'Cámara de Seguridad', N'Wi-Fi, visión nocturna', CAST(78000.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (38, N'Lámpara LED Inteligente', N'Wi-Fi, RGB, control app', CAST(32000.00 AS Decimal(10, 2)), 10, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (39, N'Kit Domótica', N'Sensor puerta + luz + cámara', CAST(155000.00 AS Decimal(10, 2)), 4, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (40, N'Adaptador Bluetooth USB', N'5.0, mini', CAST(12000.00 AS Decimal(10, 2)), 25, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (41, N'Soporte Monitor', N'Brazos duales ajustables', CAST(54000.00 AS Decimal(10, 2)), 6, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (42, N'Impresora 3D Creality', N'Modelos PLA y ABS', CAST(410000.00 AS Decimal(10, 2)), 2, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (43, N'Cooler para Notebook', N'5 ventiladores, LED azul', CAST(28000.00 AS Decimal(10, 2)), 13, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (44, N'Ventilador RGB CPU', N'ARGB 120mm', CAST(22000.00 AS Decimal(10, 2)), 14, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (45, N'Antena Wi-Fi USB', N'600Mbps, dual band', CAST(25000.00 AS Decimal(10, 2)), 15, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (46, N'Kit Raspberry Pi 4', N'4GB RAM + accesorios', CAST(125000.00 AS Decimal(10, 2)), 3, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (47, N'Tablet Lenovo', N'8", Android, 32GB', CAST(135000.00 AS Decimal(10, 2)), 6, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (48, N'Auriculares HyperX', N'Cloud II, con micrófono', CAST(142000.00 AS Decimal(10, 2)), 5, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (49, N'Soporte Celular Auto', N'Magnético, rejilla aire', CAST(17000.00 AS Decimal(10, 2)), 20, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (50, N'Alfombrilla Gamer XL', N'80x30cm, antideslizante', CAST(20000.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (51, N'Mate', N'Mate con Bombilla', CAST(15000.00 AS Decimal(10, 2)), 4, 2)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (52, N'Termo Solar', N'Termo Stanley', CAST(20000.00 AS Decimal(10, 2)), 20, 2)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (53, N'Mate', N'Mate de cuero', CAST(15000.00 AS Decimal(10, 2)), 4, 2)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (54, N'dds', N'sdsdsd', CAST(1500.00 AS Decimal(10, 2)), 23, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (56, N'Taza', N'Taza Inteligente', CAST(15000.00 AS Decimal(10, 2)), 1, 2)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (58, N'Celualr', N'dssds', CAST(1500.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (59, N'Vetntilador', N'Ventilador Lliliana', CAST(10000.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (60, N'Bombilla', N'sdsd', CAST(1500.00 AS Decimal(10, 2)), 1, 2)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (61, N'Perfume Glade', N'perfume para ropa', CAST(1500.00 AS Decimal(10, 2)), 10, 2)
INSERT [dbo].[Productos] ([Codigo], [Nombre], [Descripcion], [Precio], [Stock], [CategoriaId]) VALUES (62, N'Pefume Morita', N'Perfume para Interior', CAST(2000.00 AS Decimal(10, 2)), 1, 2)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (1, N'JuanPerez', N'clave123')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (2, N'AnaGomez', N'segura456')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (3, N'MarioLopez', N'pass789')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (4, N'LuciaDiaz', N'contraseña321')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (5, N'CarlosRuiz', N'miClave2025')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [Contraseña]) VALUES (6, N'tomi', N'admin')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Comercio] SET  READ_WRITE 
GO
