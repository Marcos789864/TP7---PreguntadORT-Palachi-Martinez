USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 31/8/2023 09:07:10 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadOrt', N'ON'
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 31/8/2023 09:07:10 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 31/8/2023 09:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 31/8/2023 09:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[idDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[idDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 31/8/2023 09:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idDificultad] [int] NOT NULL,
	[Enunciado] [varchar](250) NOT NULL,
	[Foto] [varchar](250) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 31/8/2023 09:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuestas] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuestas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (1, N'atractivos turisticos', N'')
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (2, N'deportes', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (3, N'atractivos turisticos', NULL)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (1, N'facil')
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (2, N'medio')
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (3, N'dificil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (22, 1, 1, N'¿Cuantos metros de alto tiene la torre Eiffel?', N'https://phantom-elmundo.unidadeditorial.es/89f06d4e53f097cf025bdf7470ed128e/resize/473/f/webp/assets/multimedia/imagenes/2023/03/30/16801663970469.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (23, 1, 2, N'¿Cuanta capacidad tiene el coliseo Romano?', N'https://www.enroma.com/wp-content/uploads/elementor/thumbs/Coliseo-Romano-p9hfybrrriyw7zyeoat3i5xq91dbuq09smp8uhsmrk.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (24, 1, 3, N'¿Cuantos grados se inclina la torre de pisa?', N'https://es.wikipedia.org/wiki/Archivo:The_Leaning_Tower_of_Pisa_SB.jpeg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (25, 1, 2, N'¿Cual es la estructura mas alta del mundo?', N'https://static.hipertextual.com/wp-content/uploads/2008/03/burj-dubai.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (26, 1, 1, N'¿Que paises componen las cataratas del Iguazú?', N'https://www.losandes.com.ar/resizer/krK2wcE3J95WoQAEa1jGGVRjHVI=/980x640/smart/filters:quality(75):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/DCSODAKQANGJBINPVYTGR5YGZU.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (27, 1, 1, N'¿Cuantas maravillas del mundo hay en Argentina?', N'https://www.pngwing.com/es/free-png-kvqlq')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (28, 1, 2, N'¿Donde se ubica el obelisco mas alto del mundo?', N'https://assets.dev-filo.dift.io/img/2017/05/23/home_obelisco_sq.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (29, 2, 1, N'¿Cuantos goles hizo messi en su ultimo mundial?', N'https://cadenaser.com/resizer/9UOTKKBXiRNjikaOyhCV-aLQpuk=/768x576/filters:format(jpg):quality(70)/cloudfront-eu-central-1.images.arcpublishing.com/prisaradio/TOLWBLP2DRFWZPVWKRWIQ4WH3I.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (30, 2, 1, N'¿Quien fue el goleaor del mundial Qatar 2022?', N'https://phantom-marca.unidadeditorial.es/77d2a9db2a6eaf0de3beff50e30e40b9/crop/0x799/2047x2161/resize/660/f/webp/assets/multimedia/imagenes/2022/12/18/16713819058623.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (31, 2, 2, N'¿Quien es el mejor boxeador actual?', N'https://media.gq.com.mx/photos/5c12d53f5ec369d87638cfcf/16:9/w_1920,c_limit/Canelo.png')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (32, 2, 3, N'¿Cual es la mejor seleccion femenina de hockey?', N'https://sisanjuan.b-cdn.net/media/k2/items/cache/48ae95f5c34510f7ed2a3a1c039b1d51_L.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (33, 2, 1, N'¿Cual es la seleccion que mas copas Americas tuvo?', N'https://www.lavoz.com.ar/resizer/1KSSMHCRbw_LXEEO8Zb7OYtQWpA=/980x640/smart/filters:quality(75):format(webp)/cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/EOIDEHRTZNE2TLXBVRS5OTJC3Q.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (34, 2, 2, N'¿Cuantas copas del mundo se jugaron en total?', N'https://media.tycsports.com/files/2022/11/14/504707/copa-del-mundo-trofeo_862x485.webp')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (35, 2, 1, N'¿En cuantos equipos jugó Cristiano Ronaldo?', N'https://phantom-marca-mx.unidadeditorial.es/d8ff4a51f6aa3c9c6a8d36939afc6514/resize/660/f/webp/mx/assets/multimedia/imagenes/2023/06/05/16859985858899.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (36, 3, 2, N'¿Como se llama el ultimo album de callejero fino?', N'https://media.c5n.com/p/34ec87f9eb7df1372a490c3138c41e61/adjuntos/326/imagenes/000/201/0000201992/790x0/smart/callejero-fino.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (40, 3, 3, N'¿Con quien fue el ultimo lanzamiento de miranda?', N'https://img2.rtve.es/i/?w=1600&i=1647266349316.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (43, 3, 1, N'¿Quien es el artista mas escuchado en spotify?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Spotify_logo_without_text.svg/150px-Spotify_logo_without_text.svg.png')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (44, 3, 2, N'¿quien es el artista con mas grammys?', N'https://indiehoy.com/wp-content/uploads/2020/11/grammy-award.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (45, 3, 1, N'¿Quien canta "lloviendo estrellas"?', N'https://www.mdzol.com/u/fotografias/m/2020/4/17/f848x477-35381_93184_5050.jpg')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (47, 3, 3, N'¿Cuantos movistar arena hizo Luis Miguel en Arg?', N'https://images.hola.com/imagenes/actualidad/20230804236906/luis-miguel-comienzo-gira/1-290-3/luis-miguel-gtres-t.jpg?tx=w_1200')
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (48, 3, 1, N'¿Cuantos river hizo Coldplay?', N'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/ColdplayBBC071221_%28cropped%29.jpg/250px-ColdplayBBC071221_%28cropped%29.jpg')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 22, 3, N'300', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 23, 2, N'50.000', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 24, 1, N'4', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 25, 4, N'The Kindom Tower', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 26, 3, N'Argentina y Brasil', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 27, 1, N'1', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 28, 3, N'EEUU', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 29, 3, N'8', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 30, 4, N'Mbappe', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 31, 3, N'Canelo', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 32, 1, N'Holanda', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 33, 4, N'Urugay y Argentina', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 34, 2, N'21', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 35, 4, N'4', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 36, 1, N'Hagan caso', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 40, 3, N'Robleis', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 43, 1, N'The Weekend', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (29, 44, 3, N'Beyonce', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (30, 45, 2, N'Cristian Castro', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (32, 47, 2, N'10', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 48, 4, N'10', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 22, 1, N'200', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 22, 2, N'250', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 22, 4, N'420', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 23, 1, N'40.000', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (38, 23, 3, N'60.000', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (39, 23, 4, N'63.000', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (40, 24, 2, N'5', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (41, 24, 3, N'6', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 24, 4, N'7', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 25, 1, N'CN tower', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 25, 2, N'Burj Khalifa', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 25, 3, N'The Tower', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 26, 1, N'Argentina y Paraguay', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 26, 2, N'Argentina y Uruguay', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 26, 4, N'ninguna es correcta', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 27, 2, N'2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 27, 3, N'3', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 27, 4, N'4', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 28, 1, N'Argentina', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 28, 2, N'italia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 28, 4, N'Uruguay', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 29, 1, N'6', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 29, 2, N'7', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 29, 4, N'9', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 30, 1, N'messi', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 30, 2, N'Gakpo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 30, 3, N'Julian Alvarez', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 31, 1, N'Mike Tyson', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 31, 2, N'Dmitry Bivol', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 31, 4, N'Manny Pacquiao', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 32, 2, N'argentina', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 32, 3, N'ghana', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 32, 4, N'australia', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 33, 1, N'Argentina y Brasil', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 33, 2, N'Uruguay Brasil', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (75, 33, 3, N'Brasil y Chile', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (76, 34, 1, N'18', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 34, 3, N'23', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 34, 4, N'20', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 35, 1, N'1', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 35, 2, N'2', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 35, 3, N'3', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (82, 36, 2, N'Hagan Caso', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (83, 36, 3, N'los giles', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 36, 4, N'ATR', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 40, 1, N'sofia reyes', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 40, 2, N'Maria Becerra', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 40, 3, N'FMK', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 43, 2, N'Miley Cyrus', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (92, 43, 3, N'Tylor Swift', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 43, 4, N'Bad Bunny', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 44, 1, N'George solti', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 44, 2, N'Quincy Jones', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (97, 44, 4, N'Alison Krauss', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (98, 45, 1, N'cacho castaña', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (99, 45, 3, N'luis miguel', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (101, 45, 4, N'sergio denis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (102, 47, 1, N'9', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (103, 47, 3, N'11', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (104, 47, 4, N'12', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (105, 48, 1, N'13', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (106, 48, 2, N'12', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuestas], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (107, 48, 3, N'11', 0, NULL)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([idDificultad])
REFERENCES [dbo].[Dificultades] ([idDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO
