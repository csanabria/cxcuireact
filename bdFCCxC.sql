USE [master]
GO
/****** Object:  Database [bdFCCxC]    Script Date: 25/4/2020 08:54:05 ******/
CREATE DATABASE [bdFCCxC] ON  PRIMARY 
( NAME = N'bdFCCxC', FILENAME = N'E:\bd\data\bdFCCxC.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bdFCCxC_log', FILENAME = N'E:\bd\logs\bdFCCxC_log.ldf' , SIZE = 26816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bdFCCxC] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdFCCxC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdFCCxC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdFCCxC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdFCCxC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdFCCxC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdFCCxC] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdFCCxC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdFCCxC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdFCCxC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdFCCxC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdFCCxC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdFCCxC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdFCCxC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdFCCxC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdFCCxC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdFCCxC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdFCCxC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdFCCxC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdFCCxC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdFCCxC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdFCCxC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdFCCxC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdFCCxC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdFCCxC] SET RECOVERY FULL 
GO
ALTER DATABASE [bdFCCxC] SET  MULTI_USER 
GO
ALTER DATABASE [bdFCCxC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdFCCxC] SET DB_CHAINING OFF 
GO
USE [bdFCCxC]
GO
/****** Object:  User [USR_TecServicios]    Script Date: 25/4/2020 08:54:06 ******/
CREATE USER [USR_TecServicios] FOR LOGIN [USR_TecServicios] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pgamboa]    Script Date: 25/4/2020 08:54:06 ******/
CREATE USER [pgamboa] FOR LOGIN [pgamboa] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [jcarmona]    Script Date: 25/4/2020 08:54:06 ******/
CREATE USER [jcarmona] FOR LOGIN [jcarmona] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ITCR\mvgomez]    Script Date: 25/4/2020 08:54:06 ******/
CREATE USER [ITCR\mvgomez] FOR LOGIN [ITCR\mvgomez] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ITCR\csanabria]    Script Date: 25/4/2020 08:54:06 ******/
CREATE USER [ITCR\csanabria] FOR LOGIN [ITCR\csanabria] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [gvega]    Script Date: 25/4/2020 08:54:06 ******/
CREATE USER [gvega] FOR LOGIN [gvega] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [gcordero]    Script Date: 25/4/2020 08:54:06 ******/
CREATE USER [gcordero] FOR LOGIN [gcordero] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [USR_TecServicios]
GO
ALTER ROLE [db_owner] ADD MEMBER [pgamboa]
GO
ALTER ROLE [db_owner] ADD MEMBER [jcarmona]
GO
ALTER ROLE [db_owner] ADD MEMBER [ITCR\mvgomez]
GO
ALTER ROLE [db_owner] ADD MEMBER [ITCR\csanabria]
GO
ALTER ROLE [db_owner] ADD MEMBER [gvega]
GO
ALTER ROLE [db_owner] ADD MEMBER [gcordero]
GO
/****** Object:  Table [dbo].[FCCxCActiEconomica]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCActiEconomica](
	[IdActiEconomica] [int] IDENTITY(1,1) NOT NULL,
	[CodMdH] [int] NULL,
	[DscActividad] [varchar](100) NULL,
	[IndDevuelveIVA] [int] NULL,
	[IndActiPrincipal] [bit] NULL,
	[IdImporteIVA] [int] NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCxCActiEconomica] PRIMARY KEY CLUSTERED 
(
	[IdActiEconomica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCAuxiliar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCAuxiliar](
	[IdAuxiliar] [int] IDENTITY(1,1) NOT NULL,
	[DscAuxiliar] [varchar](60) NOT NULL,
	[CodEstado] [char](1) NOT NULL,
 CONSTRAINT [PK_FCCCxCAuxiliares] PRIMARY KEY CLUSTERED 
(
	[IdAuxiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCBienoServicio]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCBienoServicio](
	[IdBoS] [int] IDENTITY(1,1) NOT NULL,
	[DscBoS] [varchar](150) NOT NULL,
	[IdAuxiliar] [int] NOT NULL,
	[IdConcepto] [int] NOT NULL,
	[IndTipo] [char](1) NULL CONSTRAINT [DF_FCCxCBienoServicio_IndTipo]  DEFAULT ('S'),
	[IndFacturar] [bit] NULL,
	[IndDescuento] [bit] NULL,
	[IndPagaImpuesto] [bit] NULL,
	[CodPartidaArancelaria] [int] NULL,
	[IdMedida] [int] NULL,
	[Id_SP] [int] NULL,
	[FecCreacion] [datetime] NOT NULL,
	[UsrCreacion] [varchar](50) NOT NULL,
	[FecUltModif] [datetime] NOT NULL,
	[UsrUltModif] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FCCxCBienoServicio] PRIMARY KEY CLUSTERED 
(
	[IdBoS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCBitacoraSucesos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCBitacoraSucesos](
	[IdSuceso] [int] IDENTITY(1,1) NOT NULL,
	[FecSuceso] [datetime] NOT NULL,
	[IdAuxiliar] [int] NOT NULL,
	[DscSuceso] [varchar](500) NOT NULL,
	[DscExcepcion] [varchar](1000) NULL,
	[UsrActual] [varchar](50) NOT NULL,
	[TipSuceso] [char](1) NOT NULL,
 CONSTRAINT [PK_FCCxCBitacoraSucesos] PRIMARY KEY CLUSTERED 
(
	[IdSuceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCBoSPrecio]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCBoSPrecio](
	[IdBoSPrecio] [int] IDENTITY(1,1) NOT NULL,
	[IdBoS] [int] NOT NULL,
	[IdMoneda] [int] NULL,
	[MonPrecio] [money] NOT NULL,
	[MonCosto] [money] NOT NULL,
	[NumPeriodo] [int] NOT NULL,
	[FecCreacion] [datetime] NOT NULL,
	[UsrCreacion] [varchar](50) NOT NULL,
	[FecUltModif] [datetime] NOT NULL,
	[UsrUltModif] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FCCxCBoSPrecio] PRIMARY KEY CLUSTERED 
(
	[IdBoSPrecio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCConcepto]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCConcepto](
	[IdConcepto] [int] IDENTITY(1,1) NOT NULL,
	[DscTipo] [varchar](100) NOT NULL,
	[CodEstado] [char](1) NOT NULL,
	[CtaFinancieraDebito] [varchar](100) NOT NULL,
	[CtaFinancieraCredito] [varchar](100) NULL,
	[UsarExpiracion] [char](1) NOT NULL,
	[NumDiasExpira] [int] NOT NULL,
	[EnviaNotificacion] [char](1) NOT NULL,
 CONSTRAINT [PK_FCCCxCTipo] PRIMARY KEY CLUSTERED 
(
	[IdConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCCondicionVenta]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCCondicionVenta](
	[IdCondicionVenta] [int] NOT NULL,
	[DscCondcionVenta] [varchar](50) NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCXCCondicionVenta] PRIMARY KEY CLUSTERED 
(
	[IdCondicionVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCDetalles]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FCCXCDetalles](
	[IdDetalleDocumento] [int] NOT NULL,
	[IdDocumentoElectronico] [int] NULL,
	[NumLinea] [int] NULL,
	[CanBienoServicio] [real] NULL,
	[IdBoS] [int] NULL,
	[MonPrecio] [money] NULL,
	[MonDescuento] [money] NULL,
	[MonImpuesto] [money] NULL,
 CONSTRAINT [PK_FCCXCDetalles] PRIMARY KEY CLUSTERED 
(
	[IdDetalleDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FCCXCDocumentoElectronico]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCDocumentoElectronico](
	[IdDocumentoElectronico] [int] IDENTITY(1,1) NOT NULL,
	[IdActiEonomica] [int] NULL,
	[IdTipoDocumento] [int] NULL,
	[NumDocumento] [varchar](100) NULL,
	[FecVencimiento] [datetime] NULL,
	[IdSocio] [int] NULL,
	[IdFormaPago] [int] NULL,
	[IdCondicionVenta] [int] NULL,
	[eMailEnvio] [varchar](100) NULL,
	[PorDescuento] [real] NULL,
	[IdRazonExoneración] [int] NULL,
	[IdMoneda] [int] NOT NULL,
	[DscDocumento] [varchar](255) NULL,
	[IdReferencia] [int] NULL,
	[IdTipoReferencia] [int] NULL,
	[NumDocumentoReferencia] [varchar](50) NULL,
	[DscRazonReferencia] [varchar](255) NULL,
	[IndMdH] [int] NULL,
	[IndEstadoConta] [int] NULL,
	[NumPeriodosConta] [int] NULL,
	[IndRazonExonera] [int] NULL,
	[MontoSubTotal] [real] NULL,
	[MontoDescuento] [real] NULL,
	[MontoImpuesto] [real] NULL,
	[MontoExonerado] [real] NULL,
	[MontoOtrosCargos] [real] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecCreacion] [datetime] NULL,
 CONSTRAINT [PK_FCCXCDocumentoElectronico] PRIMARY KEY CLUSTERED 
(
	[IdDocumentoElectronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCEstado]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCEstado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[DscEstado] [varchar](30) NOT NULL,
 CONSTRAINT [PK_FCCxCEstado] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCEstadoPago]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCEstadoPago](
	[IdEstadoPago] [int] IDENTITY(1,1) NOT NULL,
	[DscEstadoPago] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FCCxCEstadoPago] PRIMARY KEY CLUSTERED 
(
	[IdEstadoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCFormaPago]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCFormaPago](
	[IdFormaPago] [int] IDENTITY(1,1) NOT NULL,
	[DscFormaPago] [varchar](50) NOT NULL,
	[CodEstado] [char](1) NOT NULL,
 CONSTRAINT [PK_FCCxCFormaPago] PRIMARY KEY CLUSTERED 
(
	[IdFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCIdentificacionTipo]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCIdentificacionTipo](
	[Id_TipoIdentif] [int] IDENTITY(1,1) NOT NULL,
	[Dsc_TipoIdentif] [varchar](60) NOT NULL,
 CONSTRAINT [PK_FCCxCIdentificacionTipo] PRIMARY KEY CLUSTERED 
(
	[Id_TipoIdentif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCImporteIVA]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCImporteIVA](
	[IdImporteIVA] [int] IDENTITY(1,1) NOT NULL,
	[DscTarifaria] [varchar](50) NULL,
	[PorTarifa] [real] NULL,
 CONSTRAINT [PK_FCCxCImporteIVA] PRIMARY KEY CLUSTERED 
(
	[IdImporteIVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCImpuestosBoS]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCImpuestosBoS](
	[IdImpuestoBoS] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoImpuesto] [int] NULL,
	[IdBoS] [int] NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
 CONSTRAINT [PK_FCCXCImpuestosBoS] PRIMARY KEY CLUSTERED 
(
	[IdImpuestoBoS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCInfoAdicional]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCInfoAdicional](
	[IdInfoAdicional] [int] NOT NULL,
	[IdDocumentoElectronico] [int] NULL,
	[DscInformacion] [varchar](50) NULL,
	[Valinformacion] [varchar](150) NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
 CONSTRAINT [PK_FCCXCInfoAdicional] PRIMARY KEY CLUSTERED 
(
	[IdInfoAdicional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCMaestro]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCMaestro](
	[IdCuenta] [int] IDENTITY(1,1) NOT NULL,
	[IdAuxiliar] [int] NOT NULL,
	[IdBoS] [int] NOT NULL,
	[Cantidad] [float] NULL,
	[TipMovimiento] [char](1) NOT NULL,
	[IdSocio] [int] NULL,
	[FecRegistro] [datetime] NOT NULL,
	[FecInicioMorosidad] [datetime] NOT NULL,
	[FecExpiracion] [datetime] NULL,
	[IdEstado] [int] NOT NULL,
	[EstadoCobro] [varchar](2) NOT NULL,
	[IdLlaveExterna] [varchar](50) NULL,
	[DscCargo] [varchar](200) NULL,
	[IdCuentaAnterior] [int] NULL,
	[UsrCreacion] [varchar](50) NOT NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCxCMaestro] PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCMonedas]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCMonedas](
	[IdMoneda] [int] IDENTITY(1,1) NOT NULL,
	[DscMoneda] [varchar](50) NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCxCMonedas] PRIMARY KEY CLUSTERED 
(
	[IdMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCMovimientoCuenta]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCMovimientoCuenta](
	[IdMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[IdCuenta] [int] NOT NULL,
	[Monto] [money] NOT NULL,
	[FechaRegistroMovimiento] [datetime] NOT NULL,
	[IdFormaPago] [int] NOT NULL,
	[IdEstadoPago] [int] NOT NULL,
	[Num_Documento] [varchar](50) NULL,
	[IdAuxiliar] [int] NOT NULL,
	[Dsc_Detalle] [varchar](200) NOT NULL,
	[UsrCreacion] [varchar](50) NOT NULL,
	[UsrUltModif] [varchar](50) NOT NULL,
	[FecUltModif] [datetime] NOT NULL,
 CONSTRAINT [PK_FCCxCPagos] PRIMARY KEY CLUSTERED 
(
	[IdMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCOtrosCargos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FCCXCOtrosCargos](
	[IdOtrosCargos] [int] NOT NULL,
	[IdDocumento] [int] NULL,
	[IdTipoCargo] [int] NULL,
	[PorOtrosCargos] [real] NULL,
	[MonOtrosCargos] [money] NULL,
	[IndTercero] [bit] NULL,
	[IdTercero] [int] NOT NULL,
 CONSTRAINT [PK_FCCXCOtrosCargos] PRIMARY KEY CLUSTERED 
(
	[IdOtrosCargos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FCCxCPeriodo]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCPeriodo](
	[IdPeriodo] [int] IDENTITY(1,1) NOT NULL,
	[IdAuxiliar] [int] NOT NULL,
	[DscPeriodo] [varchar](50) NOT NULL,
	[FecInicio] [datetime] NOT NULL,
	[FecFinal] [datetime] NOT NULL,
 CONSTRAINT [PK_FCCxCPeriodo] PRIMARY KEY CLUSTERED 
(
	[IdPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCRazonExoneracion]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCRazonExoneracion](
	[IdRazonExoneracion] [int] NOT NULL,
	[DscExoneracion] [varchar](50) NULL,
	[PorExoneracion] [real] NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCXCRazonExoneracion] PRIMARY KEY CLUSTERED 
(
	[IdRazonExoneracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCReferencia]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCReferencia](
	[IdReferencia] [int] NOT NULL,
	[DscReferencia] [varchar](50) NULL,
	[IdTipoDocumento] [int] NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCXCReferencia] PRIMARY KEY CLUSTERED 
(
	[IdReferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCSocio]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCSocio](
	[Id_Socio] [int] IDENTITY(1,1) NOT NULL,
	[Num_Identificacion] [varchar](50) NOT NULL,
	[Id_TipoIdentif] [int] NOT NULL,
	[Num_Identificacion2] [varchar](50) NULL,
	[Dsc_NombreSocio] [varchar](80) NOT NULL,
	[Dsc_NombreSocio2] [varchar](120) NULL,
	[Id_TipoSocio] [int] NOT NULL,
	[Email_Socio] [varchar](80) NULL,
	[num_CelularSocio] [varchar](20) NULL,
	[num_TelefonoSocio] [varchar](20) NULL,
	[Dsc_Info1Socio] [varchar](128) NULL,
	[Dsc_Info2Socio] [varchar](128) NULL,
	[Fec_Creacion] [datetime] NOT NULL,
	[Usr_Creacion] [varchar](50) NOT NULL,
	[Fec_UltModif] [datetime] NULL,
	[Usr_UltModif] [varchar](30) NULL,
 CONSTRAINT [PK_FCCxCDeudor] PRIMARY KEY CLUSTERED 
(
	[Id_Socio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCSocioTipo]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCSocioTipo](
	[IdTipoDeudor] [int] IDENTITY(1,1) NOT NULL,
	[DscTipoDeudor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FCCxCTipoDeudor] PRIMARY KEY CLUSTERED 
(
	[IdTipoDeudor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCStoreProc]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCStoreProc](
	[Id_SP] [int] IDENTITY(1,1) NOT NULL,
	[Nom_SP] [varchar](256) NOT NULL,
	[Dsc_SP] [varchar](1048) NOT NULL,
 CONSTRAINT [PK_FCCxCStoreProc] PRIMARY KEY CLUSTERED 
(
	[Id_SP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCTipoCambio]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCTipoCambio](
	[IdTipoCambio] [int] IDENTITY(1,1) NOT NULL,
	[IdMoneda] [int] NULL,
	[MonCompra] [money] NULL,
	[MonVenta] [money] NULL,
	[FecCreacion] [date] NULL,
	[UsrCreacion] [varchar](50) NULL,
 CONSTRAINT [PK_FCCxCTipoCambio] PRIMARY KEY CLUSTERED 
(
	[IdTipoCambio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCTipoCargoTerceros]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCTipoCargoTerceros](
	[IdTercero] [int] NOT NULL,
	[DscTercero] [varchar](100) NULL,
	[IndEsPorcentual] [bit] NULL,
	[PorTercero] [real] NOT NULL,
	[MonTercero] [money] NOT NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCXCTipoCargoTerceros] PRIMARY KEY CLUSTERED 
(
	[IdTercero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCTipoDocumento]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCTipoDocumento](
	[IdTipoDocumento] [int] NOT NULL,
	[DscTipoDocumento] [varchar](50) NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrultModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCXCTipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IdTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCTipoImpuesto]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCTipoImpuesto](
	[IdTipoImpuesto] [int] IDENTITY(1,1) NOT NULL,
	[DscImpuesto] [varchar](50) NOT NULL,
	[PorImpuesto] [float] NOT NULL,
	[ForCalculo] [varchar](100) NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
 CONSTRAINT [PK_FCCxCTiposImpuestos] PRIMARY KEY CLUSTERED 
(
	[IdTipoImpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCTipoOtrosCargos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCTipoOtrosCargos](
	[IdTipoCargo] [int] NOT NULL,
	[DscTipoCargo] [varchar](50) NULL,
	[PorCargo] [real] NULL,
	[MonCargo] [money] NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCXCTipoOtrosCargos] PRIMARY KEY CLUSTERED 
(
	[IdTipoCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCXCTipoReferencia]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCXCTipoReferencia](
	[IdTipoReferencia] [int] NOT NULL,
	[DscTipoReferencia] [varchar](50) NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCXCTipoReferencia] PRIMARY KEY CLUSTERED 
(
	[IdTipoReferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FCCxCUMedidas]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FCCxCUMedidas](
	[IdUMedida] [int] IDENTITY(1,1) NOT NULL,
	[DscUMedida] [varchar](50) NULL,
	[IndEntero] [bit] NULL,
	[FecCreacion] [datetime] NULL,
	[UsrCreacion] [varchar](50) NULL,
	[FecUltModif] [datetime] NULL,
	[UsrUltModif] [varchar](50) NULL,
 CONSTRAINT [PK_FCCxCUMedidas] PRIMARY KEY CLUSTERED 
(
	[IdUMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TPruebas]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TPruebas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [varchar](120) NOT NULL,
 CONSTRAINT [PK_TPruebas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[FCCxCAuxiliar] ON 

INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (1, N'Auxiliar1', N'A')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (2, N'Auxiliar2', N'A')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (5, N'Auxiliar04', N'I')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (7, N'Auxiliar06', N'A')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (8, N'Auxiliar 8', N'A')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (13, N'Nuevo auxiliar csanabria', N'?')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (14, N'Nuevo auxiliar csanabria', N'?')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (15, N'Nuevo auxiliar csanabria', N'?')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (16, N'Modif 14:41', N'A')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (17, N'Nuevo auxiliar csanabria', N'?')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (18, N'Nuevo auxiliar csanabria', N'?')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (19, N'Nuevo auxiliar csanabria', N'?')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (20, N'Nuevo auxiliar csanabria', N'?')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (21, N'Nuevo auxiliar csanabria', N'?')
INSERT [dbo].[FCCxCAuxiliar] ([IdAuxiliar], [DscAuxiliar], [CodEstado]) VALUES (22, N'Nuevo auxiliar csanabria', N'?')
SET IDENTITY_INSERT [dbo].[FCCxCAuxiliar] OFF
SET IDENTITY_INSERT [dbo].[FCCxCBienoServicio] ON 

INSERT [dbo].[FCCxCBienoServicio] ([IdBoS], [DscBoS], [IdAuxiliar], [IdConcepto], [IndTipo], [IndFacturar], [IndDescuento], [IndPagaImpuesto], [CodPartidaArancelaria], [IdMedida], [Id_SP], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (1, N'Modif prueba unit14:41', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-21 14:41:45.370' AS DateTime), N'pruebaUnit', CAST(N'2020-04-21 14:41:45.370' AS DateTime), N'pruebaunit')
INSERT [dbo].[FCCxCBienoServicio] ([IdBoS], [DscBoS], [IdAuxiliar], [IdConcepto], [IndTipo], [IndFacturar], [IndDescuento], [IndPagaImpuesto], [CodPartidaArancelaria], [IdMedida], [Id_SP], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (2, N'Certificación 2', 1, 1, N'S', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2017-01-01 00:00:00.000' AS DateTime), N'gvega', CAST(N'2017-01-01 00:00:00.000' AS DateTime), N'gvega')
INSERT [dbo].[FCCxCBienoServicio] ([IdBoS], [DscBoS], [IdAuxiliar], [IdConcepto], [IndTipo], [IndFacturar], [IndDescuento], [IndPagaImpuesto], [CodPartidaArancelaria], [IdMedida], [Id_SP], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (3, N'Certificacion 3', 1, 3, N'S', NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2019-11-06 00:00:00.000' AS DateTime), N'mvgomez', CAST(N'2019-11-20 15:47:17.923' AS DateTime), N'mvgomez@itcr.ac.cr')
INSERT [dbo].[FCCxCBienoServicio] ([IdBoS], [DscBoS], [IdAuxiliar], [IdConcepto], [IndTipo], [IndFacturar], [IndDescuento], [IndPagaImpuesto], [CodPartidaArancelaria], [IdMedida], [Id_SP], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (7, N'Servicio 01', 2, 1, N'S', NULL, NULL, NULL, NULL, NULL, 4, CAST(N'2019-11-20 15:45:49.000' AS DateTime), N'mvgomez@itcr.ac.cr', CAST(N'2019-11-20 15:46:28.230' AS DateTime), N'mvgomez@itcr.ac.cr')
INSERT [dbo].[FCCxCBienoServicio] ([IdBoS], [DscBoS], [IdAuxiliar], [IdConcepto], [IndTipo], [IndFacturar], [IndDescuento], [IndPagaImpuesto], [CodPartidaArancelaria], [IdMedida], [Id_SP], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (8, N'Servicio 02', 2, 3, N'S', NULL, NULL, NULL, NULL, NULL, 3, CAST(N'2019-11-20 15:46:48.757' AS DateTime), N'mvgomez@itcr.ac.cr', CAST(N'2019-11-20 15:46:48.757' AS DateTime), N'mvgomez@itcr.ac.cr')
INSERT [dbo].[FCCxCBienoServicio] ([IdBoS], [DscBoS], [IdAuxiliar], [IdConcepto], [IndTipo], [IndFacturar], [IndDescuento], [IndPagaImpuesto], [CodPartidaArancelaria], [IdMedida], [Id_SP], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (12, N'Nuevo bien o servicio csanabria', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-15 13:31:37.973' AS DateTime), N'pruebaUnit', CAST(N'2020-04-15 13:31:37.973' AS DateTime), N'pruebaunit')
INSERT [dbo].[FCCxCBienoServicio] ([IdBoS], [DscBoS], [IdAuxiliar], [IdConcepto], [IndTipo], [IndFacturar], [IndDescuento], [IndPagaImpuesto], [CodPartidaArancelaria], [IdMedida], [Id_SP], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (17, N'Nuevo bien o servicio csanabria', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-20 08:56:28.037' AS DateTime), N'pruebaUnit', CAST(N'2020-04-20 08:56:28.047' AS DateTime), N'pruebaunit')
INSERT [dbo].[FCCxCBienoServicio] ([IdBoS], [DscBoS], [IdAuxiliar], [IdConcepto], [IndTipo], [IndFacturar], [IndDescuento], [IndPagaImpuesto], [CodPartidaArancelaria], [IdMedida], [Id_SP], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (19, N'Nuevo bien o servicio csanabria', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-21 14:39:43.960' AS DateTime), N'pruebaUnit', CAST(N'2020-04-21 14:39:43.960' AS DateTime), N'pruebaunit')
INSERT [dbo].[FCCxCBienoServicio] ([IdBoS], [DscBoS], [IdAuxiliar], [IdConcepto], [IndTipo], [IndFacturar], [IndDescuento], [IndPagaImpuesto], [CodPartidaArancelaria], [IdMedida], [Id_SP], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (21, N'Nuevo bien o servicio csanabria', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-04-21 14:41:45.297' AS DateTime), N'pruebaUnit', CAST(N'2020-04-21 14:41:45.297' AS DateTime), N'pruebaunit')
SET IDENTITY_INSERT [dbo].[FCCxCBienoServicio] OFF
SET IDENTITY_INSERT [dbo].[FCCxCBitacoraSucesos] ON 

INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (1, CAST(N'2017-09-27 14:25:02.400' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=50, IdDeudorNum=0, IdDeudorTxt=151515, IdTipoDeudor=1, emailDeudor=hhh, numCelularDeudor=8788, fecInicioMorosidad=07/10/2017 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=1547.12, idLLaveExterna=7474, DscCargo=certificacion DAR, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.The INSERT statement conflicted with the FOREIGN KEY constraint "FK_FCCxCMaestro_FCCxCBienoServicio". The conflict occurred in database "bdFCCxC", table "dbo.FCCxCBienoServicio", column ''IdBoS''.
The statement has been terminated.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (2, CAST(N'2017-10-23 09:44:13.057' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=50, IdDeudorNum=0, IdDeudorTxt=151515, IdTipoDeudor=1, emailDeudor=hhh, numCelularDeudor=8788, fecInicioMorosidad=02/11/2017 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=1547.12, idLLaveExterna=7474, DscCargo=certificacion DAR, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.The INSERT statement conflicted with the FOREIGN KEY constraint "FK_FCCxCMaestro_FCCxCBienoServicio". The conflict occurred in database "bdFCCxC", table "dbo.FCCxCBienoServicio", column ''IdBoS''.
Cannot insert the value NULL into column ''IdCuenta'', table ''bdFCCxC.dbo.FCCxCMovimientoCuenta''; column does not allow nulls. INSERT fails.
The statement has been terminated.
The statement has been terminated.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (3, CAST(N'2017-10-23 09:48:51.377' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=50, IdDeudorNum=0, IdDeudorTxt=151515, IdTipoDeudor=1, emailDeudor=hhh, numCelularDeudor=8788, fecInicioMorosidad=02/11/2017 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=1547.12, idLLaveExterna=7474, DscCargo=certificacion DAR, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.The INSERT statement conflicted with the FOREIGN KEY constraint "FK_FCCxCMaestro_FCCxCBienoServicio". The conflict occurred in database "bdFCCxC", table "dbo.FCCxCBienoServicio", column ''IdBoS''.
Cannot insert the value NULL into column ''IdCuenta'', table ''bdFCCxC.dbo.FCCxCMovimientoCuenta''; column does not allow nulls. INSERT fails.
The statement has been terminated.
The statement has been terminated.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (4, CAST(N'2017-10-23 09:50:32.323' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=50, IdDeudorNum=0, IdDeudorTxt=151515, IdTipoDeudor=1, emailDeudor=hhh, numCelularDeudor=8788, fecInicioMorosidad=02/11/2017 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=1547.12, idLLaveExterna=7474, DscCargo=certificacion DAR, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.The INSERT statement conflicted with the FOREIGN KEY constraint "FK_FCCxCMaestro_FCCxCBienoServicio". The conflict occurred in database "bdFCCxC", table "dbo.FCCxCBienoServicio", column ''IdBoS''.
Cannot insert the value NULL into column ''IdCuenta'', table ''bdFCCxC.dbo.FCCxCMovimientoCuenta''; column does not allow nulls. INSERT fails.
The statement has been terminated.
The statement has been terminated.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (5, CAST(N'2017-10-23 09:52:40.040' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=50, IdDeudorNum=0, IdDeudorTxt=151515, IdTipoDeudor=1, emailDeudor=hhh, numCelularDeudor=8788, fecInicioMorosidad=02/11/2017 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=1547.12, idLLaveExterna=7474, DscCargo=certificacion DAR, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.The INSERT statement conflicted with the FOREIGN KEY constraint "FK_FCCxCMaestro_FCCxCBienoServicio". The conflict occurred in database "bdFCCxC", table "dbo.FCCxCBienoServicio", column ''IdBoS''.
The statement has been terminated.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (6, CAST(N'2017-10-23 11:04:41.840' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=1, IdDeudorNum=0, IdDeudorTxt=151515, IdTipoDeudor=1, emailDeudor=hhh, numCelularDeudor=8788, fecInicioMorosidad=02/11/2017 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=1547.12, idLLaveExterna=7474, DscCargo=certificacion DAR, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.Cannot insert the value NULL into column ''Monto'', table ''bdFCCxC.dbo.FCCxCMovimientoCuenta''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (7, CAST(N'2017-10-23 16:59:01.173' AS DateTime), 1, N'Inserción del movimiento a la CxC fallida! IdCuenta=27, Monto=1547.12, Dsc_Detalle=Prueba, UsrCreacion=gvega, UsrUltModif=gvega', N'No se encontró el elemento de extremo predeterminado que hace referencia al contrato ''wsSeguridad.SeguridadSoap'' en la sección de configuración de cliente de ServiceModel. La razón puede ser que no se encontró ningún archivo de configuración para la aplicación o que no se encontró ningún elemento de extremo correspondiente a este contrato en el elemento de cliente.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (8, CAST(N'2017-10-23 17:00:00.387' AS DateTime), 1, N'Inserción del movimiento a la CxC fallida! IdCuenta=27, Monto=1547.12, Dsc_Detalle=Prueba, UsrCreacion=gvega, UsrUltModif=gvega', N'No se encontró el elemento de extremo predeterminado que hace referencia al contrato ''wsSeguridad.SeguridadSoap'' en la sección de configuración de cliente de ServiceModel. La razón puede ser que no se encontró ningún archivo de configuración para la aplicación o que no se encontró ningún elemento de extremo correspondiente a este contrato en el elemento de cliente.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (9, CAST(N'2017-10-23 17:02:09.237' AS DateTime), 1, N'Inserción del movimiento a la CxC fallida! IdCuenta=27, Monto=1547.12, Dsc_Detalle=Prueba, UsrCreacion=gvega, UsrUltModif=gvega', N'No se encontró el elemento de extremo predeterminado que hace referencia al contrato ''wsSeguridad.SeguridadSoap'' en la sección de configuración de cliente de ServiceModel. La razón puede ser que no se encontró ningún archivo de configuración para la aplicación o que no se encontró ningún elemento de extremo correspondiente a este contrato en el elemento de cliente.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (10, CAST(N'2017-11-13 09:42:28.173' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=1, IdDeudorNum=0, IdDeudorTxt=12311212, IdTipoDeudor=0, emailDeudor=hjhjhjjhhj, numCelularDeudor=5464, fecInicioMorosidad=19/11/2017 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=350, idLLaveExterna=45, DscCargo=prueba greivin, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.The INSERT statement conflicted with the FOREIGN KEY constraint "FK_FCCxCMaestro_FCCxCTipoDeudor". The conflict occurred in database "bdFCCxC", table "dbo.FCCxCTipoDeudor", column ''IdTipoDeudor''.
Cannot insert the value NULL into column ''IdCuenta'', table ''bdFCCxC.dbo.FCCxCMovimientoCuenta''; column does not allow nulls. INSERT fails.
The statement has been terminated.
The statement has been terminated.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (11, CAST(N'2017-11-13 10:44:26.113' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=1, IdDeudorNum=0, IdDeudorTxt=7777, IdTipoDeudor=1, emailDeudor=hhh, numCelularDeudor=3333, fecInicioMorosidad=23/11/2017 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=1294.24, idLLaveExterna=7474, DscCargo=Prueba Greivin, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.Cannot insert the value NULL into column ''Dsc_Detalle'', table ''bdFCCxC.dbo.FCCxCMovimientoCuenta''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (12, CAST(N'2019-10-07 07:36:53.000' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=1, IdSocio=1, fecInicioMorosidad=17/10/2019 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=1294.24, idLLaveExterna=7474, DscCargo=Prueba Greivin, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.Cannot insert the value NULL into column ''Cantidad'', table ''bdFCCxC.dbo.FCCxCMovimientoCuenta''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'gvega', N'1')
INSERT [dbo].[FCCxCBitacoraSucesos] ([IdSuceso], [FecSuceso], [IdAuxiliar], [DscSuceso], [DscExcepcion], [UsrActual], [TipSuceso]) VALUES (13, CAST(N'2019-10-08 11:25:02.480' AS DateTime), 1, N'Inserción de CxC fallida! IdBoS=1, IdSocio=1, fecInicioMorosidad=17/10/2019 12:00:00 a.m., FecExpiracion=Null, IdEstado=1, EstCobro=NO, MonCuenta=1294.24, idLLaveExterna=7474, DscCargo=Prueba Greivin, idCuentaAnterior=0, UsrCreacion=gvega, UsrUltModif=gvega', N'cFCCxCMaestroBase::Insertar::Ocurrió un error.Cannot insert the value NULL into column ''Cantidad'', table ''bdFCCxC.dbo.FCCxCMovimientoCuenta''; column does not allow nulls. INSERT fails.
The statement has been terminated.', N'gvega', N'1')
SET IDENTITY_INSERT [dbo].[FCCxCBitacoraSucesos] OFF
SET IDENTITY_INSERT [dbo].[FCCxCBoSPrecio] ON 

INSERT [dbo].[FCCxCBoSPrecio] ([IdBoSPrecio], [IdBoS], [IdMoneda], [MonPrecio], [MonCosto], [NumPeriodo], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (1, 1, NULL, 3500.0000, 3700.0000, 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), N'gvega', CAST(N'2019-11-20 08:01:47.553' AS DateTime), N'mvgomez@itcr.ac.cr')
INSERT [dbo].[FCCxCBoSPrecio] ([IdBoSPrecio], [IdBoS], [IdMoneda], [MonPrecio], [MonCosto], [NumPeriodo], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (2, 1, NULL, 4000.0000, 3300.0000, 2, CAST(N'2017-01-01 00:00:00.000' AS DateTime), N'gvega', CAST(N'2017-01-01 00:00:00.000' AS DateTime), N'gvega')
INSERT [dbo].[FCCxCBoSPrecio] ([IdBoSPrecio], [IdBoS], [IdMoneda], [MonPrecio], [MonCosto], [NumPeriodo], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (3, 2, NULL, 2500.0000, 2000.0000, 2, CAST(N'2017-01-01 00:00:00.000' AS DateTime), N'gvega', CAST(N'2017-01-01 00:00:00.000' AS DateTime), N'gvega')
INSERT [dbo].[FCCxCBoSPrecio] ([IdBoSPrecio], [IdBoS], [IdMoneda], [MonPrecio], [MonCosto], [NumPeriodo], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (4, 3, NULL, 2500.0000, 2000.0000, 2, CAST(N'2019-12-06 00:00:00.000' AS DateTime), N'mvgomez', CAST(N'2019-12-06 00:00:00.000' AS DateTime), N'mvgomez')
INSERT [dbo].[FCCxCBoSPrecio] ([IdBoSPrecio], [IdBoS], [IdMoneda], [MonPrecio], [MonCosto], [NumPeriodo], [FecCreacion], [UsrCreacion], [FecUltModif], [UsrUltModif]) VALUES (5, 2, NULL, 2100.0000, 1500.0000, 4, CAST(N'2019-11-19 16:13:28.000' AS DateTime), N'mvgomez@itcr.ac.cr', CAST(N'2019-11-21 15:46:36.647' AS DateTime), N'mvgomez@itcr.ac.cr')
SET IDENTITY_INSERT [dbo].[FCCxCBoSPrecio] OFF
SET IDENTITY_INSERT [dbo].[FCCxCConcepto] ON 

INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (1, N'Certificación DAR', N'A', N'123456789', NULL, N'S', 10, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (3, N'Certificacion de Notas Semestrales', N'A', N'123456', NULL, N'S', 15, N'S')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (20, N'Modif 14:41', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (21, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (22, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (23, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (24, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (25, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (26, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (27, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (28, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (29, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (30, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (31, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (32, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
INSERT [dbo].[FCCxCConcepto] ([IdConcepto], [DscTipo], [CodEstado], [CtaFinancieraDebito], [CtaFinancieraCredito], [UsarExpiracion], [NumDiasExpira], [EnviaNotificacion]) VALUES (33, N'Nuevo concepto csanabria', N'A', N'1', NULL, N'N', 0, N'N')
SET IDENTITY_INSERT [dbo].[FCCxCConcepto] OFF
SET IDENTITY_INSERT [dbo].[FCCxCEstado] ON 

INSERT [dbo].[FCCxCEstado] ([IdEstado], [DscEstado]) VALUES (1, N'Pendiente')
SET IDENTITY_INSERT [dbo].[FCCxCEstado] OFF
SET IDENTITY_INSERT [dbo].[FCCxCEstadoPago] ON 

INSERT [dbo].[FCCxCEstadoPago] ([IdEstadoPago], [DscEstadoPago]) VALUES (1, N'Activo')
INSERT [dbo].[FCCxCEstadoPago] ([IdEstadoPago], [DscEstadoPago]) VALUES (2, N'Inactivo')
SET IDENTITY_INSERT [dbo].[FCCxCEstadoPago] OFF
SET IDENTITY_INSERT [dbo].[FCCxCFormaPago] ON 

INSERT [dbo].[FCCxCFormaPago] ([IdFormaPago], [DscFormaPago], [CodEstado]) VALUES (1, N'Indefinida', N'A')
INSERT [dbo].[FCCxCFormaPago] ([IdFormaPago], [DscFormaPago], [CodEstado]) VALUES (2, N'Tarjeta Credito', N'A')
INSERT [dbo].[FCCxCFormaPago] ([IdFormaPago], [DscFormaPago], [CodEstado]) VALUES (3, N'Efectivo', N'A')
INSERT [dbo].[FCCxCFormaPago] ([IdFormaPago], [DscFormaPago], [CodEstado]) VALUES (4, N'Pagare', N'I')
SET IDENTITY_INSERT [dbo].[FCCxCFormaPago] OFF
SET IDENTITY_INSERT [dbo].[FCCxCIdentificacionTipo] ON 

INSERT [dbo].[FCCxCIdentificacionTipo] ([Id_TipoIdentif], [Dsc_TipoIdentif]) VALUES (1, N'Cédula de Identidad')
INSERT [dbo].[FCCxCIdentificacionTipo] ([Id_TipoIdentif], [Dsc_TipoIdentif]) VALUES (2, N'Pasaporte')
INSERT [dbo].[FCCxCIdentificacionTipo] ([Id_TipoIdentif], [Dsc_TipoIdentif]) VALUES (4, N'Permiso de conducir')
INSERT [dbo].[FCCxCIdentificacionTipo] ([Id_TipoIdentif], [Dsc_TipoIdentif]) VALUES (5, N'Seguro Social')
SET IDENTITY_INSERT [dbo].[FCCxCIdentificacionTipo] OFF
SET IDENTITY_INSERT [dbo].[FCCxCMaestro] ON 

INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (27, 1, 1, 0, N'M', NULL, CAST(N'2017-10-23 11:07:41.313' AS DateTime), CAST(N'2017-11-02 00:00:00.000' AS DateTime), NULL, 1, N'NO', N'7474', N'certificacion DAR', NULL, N'gvega', N'gvega')
INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (29, 1, 1, 0, N'M', NULL, CAST(N'2017-11-13 10:40:02.893' AS DateTime), CAST(N'2017-11-23 00:00:00.000' AS DateTime), NULL, 1, N'NO', N'7474', N'Prueba Greivin', NULL, N'gvega', N'gvega')
INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (30, 1, 1, 0, N'M', NULL, CAST(N'2017-11-13 10:46:44.580' AS DateTime), CAST(N'2017-11-23 00:00:00.000' AS DateTime), NULL, 1, N'NO', N'7474', N'Prueba Greivin', NULL, N'gvega', N'gvega')
INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (31, 1, 1, 0, N'M', 1, CAST(N'2019-10-07 07:35:45.127' AS DateTime), CAST(N'2019-10-17 00:00:00.000' AS DateTime), NULL, 1, N'NO', N'7474', N'Prueba Greivin', NULL, N'gvega', N'gvega')
INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (32, 1, 1, 0, N'M', 1, CAST(N'2019-10-07 13:28:39.500' AS DateTime), CAST(N'2019-10-17 00:00:00.000' AS DateTime), NULL, 1, N'NO', N'7474', N'Prueba Greivin', NULL, N'gvega', N'gvega')
INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (33, 1, 1, 0, N'M', 1, CAST(N'2019-10-07 13:28:39.500' AS DateTime), CAST(N'2019-10-17 00:00:00.000' AS DateTime), NULL, 1, N'NO', N'7474', N'Prueba Greivin', NULL, N'gvega', N'gvega')
INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (34, 1, 1, 0, N'M', 1, CAST(N'2019-10-11 13:56:41.840' AS DateTime), CAST(N'2019-10-21 00:00:00.000' AS DateTime), NULL, 1, N'NO', N'7474', N'Prueba Greivin777', NULL, N'gvega', N'gvega')
INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (36, 1, 1, NULL, N'C', NULL, CAST(N'2020-04-20 09:15:46.287' AS DateTime), CAST(N'2020-04-21 09:15:46.287' AS DateTime), NULL, 1, N'P', NULL, NULL, NULL, N'pruebasUnit', NULL)
INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (37, 1, 1, NULL, N'C', NULL, CAST(N'2020-04-21 14:39:43.737' AS DateTime), CAST(N'2020-04-22 14:39:43.737' AS DateTime), NULL, 1, N'P', NULL, NULL, NULL, N'pruebasUnit', NULL)
INSERT [dbo].[FCCxCMaestro] ([IdCuenta], [IdAuxiliar], [IdBoS], [Cantidad], [TipMovimiento], [IdSocio], [FecRegistro], [FecInicioMorosidad], [FecExpiracion], [IdEstado], [EstadoCobro], [IdLlaveExterna], [DscCargo], [IdCuentaAnterior], [UsrCreacion], [UsrUltModif]) VALUES (38, 1, 1, NULL, N'C', NULL, CAST(N'2020-04-21 14:41:45.427' AS DateTime), CAST(N'2020-04-22 14:41:45.427' AS DateTime), NULL, 1, N'P', NULL, NULL, NULL, N'pruebasUnit', NULL)
SET IDENTITY_INSERT [dbo].[FCCxCMaestro] OFF
SET IDENTITY_INSERT [dbo].[FCCxCMovimientoCuenta] ON 

INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (5, 27, 1547.1200, CAST(N'2017-10-23 11:07:41.313' AS DateTime), 1, 1, N'0', 1, N'Apertura', N'gvega', N'gvega', CAST(N'2017-10-23 11:07:41.313' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (6, 27, 300.0000, CAST(N'2017-10-24 00:00:00.000' AS DateTime), 1, 1, N'0', 1, N'modificacion', N'gvega', N'gvega', CAST(N'2017-10-24 00:00:00.000' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (8, 27, -100.0000, CAST(N'2017-10-25 00:00:00.000' AS DateTime), 1, 1, N'0', 1, N'modificacion', N'gvega', N'gvega', CAST(N'2017-10-24 00:00:00.000' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (9, 27, 1547.1200, CAST(N'2017-10-23 17:04:17.507' AS DateTime), 1, 1, N'0', 1, N'Prueba', N'gvega', N'gvega', CAST(N'2017-10-23 17:04:17.507' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (10, 27, -1294.2400, CAST(N'2017-10-23 17:13:09.143' AS DateTime), 1, 1, N'0', 1, N'Prueba', N'gvega', N'gvega', CAST(N'2017-10-23 17:13:09.143' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (11, 27, 1500.0000, CAST(N'2017-10-23 18:15:15.770' AS DateTime), 1, 1, NULL, 1, N'sdfsadf', N'gvega', N'gvega', CAST(N'2017-10-23 18:15:15.770' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (12, 27, -500.0000, CAST(N'2017-10-23 18:15:47.257' AS DateTime), 1, 1, NULL, 1, N'sdfsadf', N'gvega', N'gvega', CAST(N'2017-10-23 18:15:47.257' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (15, 30, 1294.2400, CAST(N'2017-11-13 10:46:44.580' AS DateTime), 1, 1, N'0', 1, N'Creación de Cuenta', N'gvega', N'gvega', CAST(N'2017-11-13 10:46:44.580' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (19, 34, 1294.2400, CAST(N'2019-10-11 13:56:41.840' AS DateTime), 1, 1, N'0', 1, N'Creacion de Cuenta', N'gvega', N'gvega', CAST(N'2019-10-11 13:56:41.840' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (23, 27, 100.0000, CAST(N'2020-04-21 14:07:53.040' AS DateTime), 1, 1, NULL, 1, N'Prueba Unit', N'pruebasunit', N'pruebasunit', CAST(N'2020-04-21 14:07:53.040' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (24, 27, 100.0000, CAST(N'2020-04-21 14:10:54.213' AS DateTime), 1, 1, NULL, 1, N'Prueba Unit', N'pruebasunit', N'pruebasunit', CAST(N'2020-04-21 14:10:54.213' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (25, 27, 100.0000, CAST(N'2020-04-21 14:27:16.807' AS DateTime), 1, 1, NULL, 1, N'Prueba Unit', N'pruebasunit', N'pruebasunit', CAST(N'2020-04-21 14:27:16.807' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (26, 27, 100.0000, CAST(N'2020-04-21 14:27:46.690' AS DateTime), 1, 1, NULL, 1, N'Prueba Unit', N'pruebasunit', N'pruebasunit', CAST(N'2020-04-21 14:27:46.690' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (27, 27, 100.0000, CAST(N'2020-04-21 14:30:09.247' AS DateTime), 1, 1, NULL, 1, N'Prueba Unit', N'pruebasunit', N'pruebasunit', CAST(N'2020-04-21 14:30:09.247' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (28, 27, 100.0000, CAST(N'2020-04-21 14:39:44.023' AS DateTime), 1, 1, NULL, 1, N'Prueba Unit', N'pruebasunit', N'pruebasunit', CAST(N'2020-04-21 14:39:44.023' AS DateTime))
INSERT [dbo].[FCCxCMovimientoCuenta] ([IdMovimiento], [IdCuenta], [Monto], [FechaRegistroMovimiento], [IdFormaPago], [IdEstadoPago], [Num_Documento], [IdAuxiliar], [Dsc_Detalle], [UsrCreacion], [UsrUltModif], [FecUltModif]) VALUES (29, 27, 100.0000, CAST(N'2020-04-21 14:41:45.503' AS DateTime), 1, 1, NULL, 1, N'Prueba Unit', N'pruebasunit', N'pruebasunit', CAST(N'2020-04-21 14:41:45.503' AS DateTime))
SET IDENTITY_INSERT [dbo].[FCCxCMovimientoCuenta] OFF
SET IDENTITY_INSERT [dbo].[FCCxCPeriodo] ON 

INSERT [dbo].[FCCxCPeriodo] ([IdPeriodo], [IdAuxiliar], [DscPeriodo], [FecInicio], [FecFinal]) VALUES (1, 1, N'2016', CAST(N'2016-01-01 00:00:00.000' AS DateTime), CAST(N'2016-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[FCCxCPeriodo] ([IdPeriodo], [IdAuxiliar], [DscPeriodo], [FecInicio], [FecFinal]) VALUES (2, 2, N'2017', CAST(N'2017-01-01 00:00:00.000' AS DateTime), CAST(N'2017-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[FCCxCPeriodo] ([IdPeriodo], [IdAuxiliar], [DscPeriodo], [FecInicio], [FecFinal]) VALUES (3, 8, N'2018', CAST(N'2018-01-01 00:00:00.000' AS DateTime), CAST(N'2018-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[FCCxCPeriodo] ([IdPeriodo], [IdAuxiliar], [DscPeriodo], [FecInicio], [FecFinal]) VALUES (4, 5, N'2019', CAST(N'2019-01-02 00:00:00.000' AS DateTime), CAST(N'2019-12-31 00:00:00.000' AS DateTime))
INSERT [dbo].[FCCxCPeriodo] ([IdPeriodo], [IdAuxiliar], [DscPeriodo], [FecInicio], [FecFinal]) VALUES (5, 1, N'2020', CAST(N'2020-01-01 00:00:00.000' AS DateTime), CAST(N'2020-12-31 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[FCCxCPeriodo] OFF
SET IDENTITY_INSERT [dbo].[FCCxCSocio] ON 

INSERT [dbo].[FCCxCSocio] ([Id_Socio], [Num_Identificacion], [Id_TipoIdentif], [Num_Identificacion2], [Dsc_NombreSocio], [Dsc_NombreSocio2], [Id_TipoSocio], [Email_Socio], [num_CelularSocio], [num_TelefonoSocio], [Dsc_Info1Socio], [Dsc_Info2Socio], [Fec_Creacion], [Usr_Creacion], [Fec_UltModif], [Usr_UltModif]) VALUES (1, N'1122334455', 1, N'998877', N'Juana de Arco2', NULL, 5, N'juanadearco@prueba.com', N'88776655', NULL, NULL, NULL, CAST(N'2019-09-04 00:00:00.000' AS DateTime), N'gvega', CAST(N'2019-11-15 16:08:32.167' AS DateTime), N'mvgomez@itcr.ac.cr')
INSERT [dbo].[FCCxCSocio] ([Id_Socio], [Num_Identificacion], [Id_TipoIdentif], [Num_Identificacion2], [Dsc_NombreSocio], [Dsc_NombreSocio2], [Id_TipoSocio], [Email_Socio], [num_CelularSocio], [num_TelefonoSocio], [Dsc_Info1Socio], [Dsc_Info2Socio], [Fec_Creacion], [Usr_Creacion], [Fec_UltModif], [Usr_UltModif]) VALUES (2, N'123456', 1, NULL, N'Perico de los palotes', NULL, 1, N'Perico@hotmail.com', N'', NULL, NULL, NULL, CAST(N'2019-10-07 07:43:11.930' AS DateTime), N'gvega', CAST(N'2019-10-07 07:43:11.930' AS DateTime), N'gvega')
INSERT [dbo].[FCCxCSocio] ([Id_Socio], [Num_Identificacion], [Id_TipoIdentif], [Num_Identificacion2], [Dsc_NombreSocio], [Dsc_NombreSocio2], [Id_TipoSocio], [Email_Socio], [num_CelularSocio], [num_TelefonoSocio], [Dsc_Info1Socio], [Dsc_Info2Socio], [Fec_Creacion], [Usr_Creacion], [Fec_UltModif], [Usr_UltModif]) VALUES (3, N'987654', 1, N'443423', N'hola mundo cruel2', N'Juana de Arco2', 1, N'Perico@hotmail.com', N'', N'12345-2', N'abc', N'dfg2', CAST(N'2019-10-10 16:02:20.630' AS DateTime), N'gvega', CAST(N'2019-10-10 16:26:09.637' AS DateTime), N'gvega')
INSERT [dbo].[FCCxCSocio] ([Id_Socio], [Num_Identificacion], [Id_TipoIdentif], [Num_Identificacion2], [Dsc_NombreSocio], [Dsc_NombreSocio2], [Id_TipoSocio], [Email_Socio], [num_CelularSocio], [num_TelefonoSocio], [Dsc_Info1Socio], [Dsc_Info2Socio], [Fec_Creacion], [Usr_Creacion], [Fec_UltModif], [Usr_UltModif]) VALUES (4, N'900840031', 1, N'900840033', N'Marco Vinicio', NULL, 2, N'mvgomez@itcr.ac.cr', N'8710 5527', NULL, NULL, NULL, CAST(N'2019-11-07 00:00:00.000' AS DateTime), N'mvgomez', CAST(N'2019-11-14 14:37:09.403' AS DateTime), N'mvgomez@itcr.ac.cr')
INSERT [dbo].[FCCxCSocio] ([Id_Socio], [Num_Identificacion], [Id_TipoIdentif], [Num_Identificacion2], [Dsc_NombreSocio], [Dsc_NombreSocio2], [Id_TipoSocio], [Email_Socio], [num_CelularSocio], [num_TelefonoSocio], [Dsc_Info1Socio], [Dsc_Info2Socio], [Fec_Creacion], [Usr_Creacion], [Fec_UltModif], [Usr_UltModif]) VALUES (5, N'504060268', 4, NULL, N'Marcela Ramirez Flores', NULL, 1, N'marrollo@gmail.com', N'78958521', N'25503124', NULL, NULL, CAST(N'2019-11-14 14:51:49.000' AS DateTime), N'mvgomez@itcr.ac.cr', CAST(N'2019-11-15 16:09:42.677' AS DateTime), N'mvgomez@itcr.ac.cr')
SET IDENTITY_INSERT [dbo].[FCCxCSocio] OFF
SET IDENTITY_INSERT [dbo].[FCCxCSocioTipo] ON 

INSERT [dbo].[FCCxCSocioTipo] ([IdTipoDeudor], [DscTipoDeudor]) VALUES (1, N'Estudiante')
INSERT [dbo].[FCCxCSocioTipo] ([IdTipoDeudor], [DscTipoDeudor]) VALUES (2, N'Funcionario')
INSERT [dbo].[FCCxCSocioTipo] ([IdTipoDeudor], [DscTipoDeudor]) VALUES (3, N'Profesor')
INSERT [dbo].[FCCxCSocioTipo] ([IdTipoDeudor], [DscTipoDeudor]) VALUES (5, N'Externo')
SET IDENTITY_INSERT [dbo].[FCCxCSocioTipo] OFF
SET IDENTITY_INSERT [dbo].[FCCxCStoreProc] ON 

INSERT [dbo].[FCCxCStoreProc] ([Id_SP], [Nom_SP], [Dsc_SP]) VALUES (1, N'sp_Prueba', N'Este es el sp de prueba')
INSERT [dbo].[FCCxCStoreProc] ([Id_SP], [Nom_SP], [Dsc_SP]) VALUES (3, N'GetConceptos', N'Obtiene los conceptos para el socio respectivo ')
INSERT [dbo].[FCCxCStoreProc] ([Id_SP], [Nom_SP], [Dsc_SP]) VALUES (4, N'ListaEstudianesM', N'Genera la lista de estudiantes morosos')
SET IDENTITY_INSERT [dbo].[FCCxCStoreProc] OFF
SET IDENTITY_INSERT [dbo].[TPruebas] ON 

INSERT [dbo].[TPruebas] ([Id], [Desc]) VALUES (1, N'Esta es una prueba de comunicación')
INSERT [dbo].[TPruebas] ([Id], [Desc]) VALUES (2, N'mamá')
INSERT [dbo].[TPruebas] ([Id], [Desc]) VALUES (3, N'pelé')
INSERT [dbo].[TPruebas] ([Id], [Desc]) VALUES (4, N'mama')
SET IDENTITY_INSERT [dbo].[TPruebas] OFF
ALTER TABLE [dbo].[FCCxCActiEconomica]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCActiEconomica_FCCxCImporteIVA] FOREIGN KEY([IdImporteIVA])
REFERENCES [dbo].[FCCxCImporteIVA] ([IdImporteIVA])
GO
ALTER TABLE [dbo].[FCCxCActiEconomica] CHECK CONSTRAINT [FK_FCCxCActiEconomica_FCCxCImporteIVA]
GO
ALTER TABLE [dbo].[FCCxCBienoServicio]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCBienoServicio_FCCxCAuxiliar] FOREIGN KEY([IdAuxiliar])
REFERENCES [dbo].[FCCxCAuxiliar] ([IdAuxiliar])
GO
ALTER TABLE [dbo].[FCCxCBienoServicio] CHECK CONSTRAINT [FK_FCCxCBienoServicio_FCCxCAuxiliar]
GO
ALTER TABLE [dbo].[FCCxCBienoServicio]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCBienoServicio_FCCxCConcepto] FOREIGN KEY([IdConcepto])
REFERENCES [dbo].[FCCxCConcepto] ([IdConcepto])
GO
ALTER TABLE [dbo].[FCCxCBienoServicio] CHECK CONSTRAINT [FK_FCCxCBienoServicio_FCCxCConcepto]
GO
ALTER TABLE [dbo].[FCCxCBienoServicio]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCBienoServicio_FCCxCStoreProc] FOREIGN KEY([Id_SP])
REFERENCES [dbo].[FCCxCStoreProc] ([Id_SP])
GO
ALTER TABLE [dbo].[FCCxCBienoServicio] CHECK CONSTRAINT [FK_FCCxCBienoServicio_FCCxCStoreProc]
GO
ALTER TABLE [dbo].[FCCxCBienoServicio]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCBienoServicio_FCCxCUMedidas] FOREIGN KEY([IdMedida])
REFERENCES [dbo].[FCCxCUMedidas] ([IdUMedida])
GO
ALTER TABLE [dbo].[FCCxCBienoServicio] CHECK CONSTRAINT [FK_FCCxCBienoServicio_FCCxCUMedidas]
GO
ALTER TABLE [dbo].[FCCxCBitacoraSucesos]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCBitacoraSucesos_FCCxCAuxiliar] FOREIGN KEY([IdAuxiliar])
REFERENCES [dbo].[FCCxCAuxiliar] ([IdAuxiliar])
GO
ALTER TABLE [dbo].[FCCxCBitacoraSucesos] CHECK CONSTRAINT [FK_FCCxCBitacoraSucesos_FCCxCAuxiliar]
GO
ALTER TABLE [dbo].[FCCxCBoSPrecio]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCBoSPrecio_FCCxCBienoServicio] FOREIGN KEY([IdBoS])
REFERENCES [dbo].[FCCxCBienoServicio] ([IdBoS])
GO
ALTER TABLE [dbo].[FCCxCBoSPrecio] CHECK CONSTRAINT [FK_FCCxCBoSPrecio_FCCxCBienoServicio]
GO
ALTER TABLE [dbo].[FCCxCBoSPrecio]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCBoSPrecio_FCCxCPeriodo] FOREIGN KEY([NumPeriodo])
REFERENCES [dbo].[FCCxCPeriodo] ([IdPeriodo])
GO
ALTER TABLE [dbo].[FCCxCBoSPrecio] CHECK CONSTRAINT [FK_FCCxCBoSPrecio_FCCxCPeriodo]
GO
ALTER TABLE [dbo].[FCCXCDetalles]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDetalles_FCCxCBienoServicio] FOREIGN KEY([IdBoS])
REFERENCES [dbo].[FCCxCBienoServicio] ([IdBoS])
GO
ALTER TABLE [dbo].[FCCXCDetalles] CHECK CONSTRAINT [FK_FCCXCDetalles_FCCxCBienoServicio]
GO
ALTER TABLE [dbo].[FCCXCDetalles]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDetalles_FCCXCDocumentoElectronico] FOREIGN KEY([IdDocumentoElectronico])
REFERENCES [dbo].[FCCXCDocumentoElectronico] ([IdDocumentoElectronico])
GO
ALTER TABLE [dbo].[FCCXCDetalles] CHECK CONSTRAINT [FK_FCCXCDetalles_FCCXCDocumentoElectronico]
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCxCActiEconomica] FOREIGN KEY([IdActiEonomica])
REFERENCES [dbo].[FCCxCActiEconomica] ([IdActiEconomica])
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico] CHECK CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCxCActiEconomica]
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCCondicionVenta] FOREIGN KEY([IdCondicionVenta])
REFERENCES [dbo].[FCCXCCondicionVenta] ([IdCondicionVenta])
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico] CHECK CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCCondicionVenta]
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCxCFormaPago] FOREIGN KEY([IdFormaPago])
REFERENCES [dbo].[FCCxCFormaPago] ([IdFormaPago])
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico] CHECK CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCxCFormaPago]
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCxCMonedas] FOREIGN KEY([IdMoneda])
REFERENCES [dbo].[FCCxCMonedas] ([IdMoneda])
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico] CHECK CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCxCMonedas]
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCRazonExoneracion] FOREIGN KEY([IdRazonExoneración])
REFERENCES [dbo].[FCCXCRazonExoneracion] ([IdRazonExoneracion])
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico] CHECK CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCRazonExoneracion]
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCReferencia] FOREIGN KEY([IdReferencia])
REFERENCES [dbo].[FCCXCReferencia] ([IdReferencia])
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico] CHECK CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCReferencia]
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCxCSocio] FOREIGN KEY([IdSocio])
REFERENCES [dbo].[FCCxCSocio] ([Id_Socio])
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico] CHECK CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCxCSocio]
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCTipoDocumento] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[FCCXCTipoDocumento] ([IdTipoDocumento])
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico] CHECK CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCTipoDocumento]
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCTipoReferencia] FOREIGN KEY([IdTipoReferencia])
REFERENCES [dbo].[FCCXCTipoReferencia] ([IdTipoReferencia])
GO
ALTER TABLE [dbo].[FCCXCDocumentoElectronico] CHECK CONSTRAINT [FK_FCCXCDocumentoElectronico_FCCXCTipoReferencia]
GO
ALTER TABLE [dbo].[FCCXCImpuestosBoS]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCImpuestosBoS_FCCxCBienoServicio] FOREIGN KEY([IdBoS])
REFERENCES [dbo].[FCCxCBienoServicio] ([IdBoS])
GO
ALTER TABLE [dbo].[FCCXCImpuestosBoS] CHECK CONSTRAINT [FK_FCCXCImpuestosBoS_FCCxCBienoServicio]
GO
ALTER TABLE [dbo].[FCCXCImpuestosBoS]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCImpuestosBoS_FCCxCTipoImpuestos] FOREIGN KEY([IdTipoImpuesto])
REFERENCES [dbo].[FCCxCTipoImpuesto] ([IdTipoImpuesto])
GO
ALTER TABLE [dbo].[FCCXCImpuestosBoS] CHECK CONSTRAINT [FK_FCCXCImpuestosBoS_FCCxCTipoImpuestos]
GO
ALTER TABLE [dbo].[FCCXCInfoAdicional]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCInfoAdicional_FCCXCDocumentoElectronico] FOREIGN KEY([IdDocumentoElectronico])
REFERENCES [dbo].[FCCXCDocumentoElectronico] ([IdDocumentoElectronico])
GO
ALTER TABLE [dbo].[FCCXCInfoAdicional] CHECK CONSTRAINT [FK_FCCXCInfoAdicional_FCCXCDocumentoElectronico]
GO
ALTER TABLE [dbo].[FCCxCMaestro]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCMaestro_FCCCxCAuxiliares] FOREIGN KEY([IdAuxiliar])
REFERENCES [dbo].[FCCxCAuxiliar] ([IdAuxiliar])
GO
ALTER TABLE [dbo].[FCCxCMaestro] CHECK CONSTRAINT [FK_FCCxCMaestro_FCCCxCAuxiliares]
GO
ALTER TABLE [dbo].[FCCxCMaestro]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCMaestro_FCCxCBienoServicio] FOREIGN KEY([IdBoS])
REFERENCES [dbo].[FCCxCBienoServicio] ([IdBoS])
GO
ALTER TABLE [dbo].[FCCxCMaestro] CHECK CONSTRAINT [FK_FCCxCMaestro_FCCxCBienoServicio]
GO
ALTER TABLE [dbo].[FCCxCMaestro]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCMaestro_FCCxCEstado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[FCCxCEstado] ([IdEstado])
GO
ALTER TABLE [dbo].[FCCxCMaestro] CHECK CONSTRAINT [FK_FCCxCMaestro_FCCxCEstado]
GO
ALTER TABLE [dbo].[FCCxCMaestro]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCMaestro_FCCxCMaestro] FOREIGN KEY([IdCuentaAnterior])
REFERENCES [dbo].[FCCxCMaestro] ([IdCuenta])
GO
ALTER TABLE [dbo].[FCCxCMaestro] CHECK CONSTRAINT [FK_FCCxCMaestro_FCCxCMaestro]
GO
ALTER TABLE [dbo].[FCCxCMaestro]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCMaestro_FCCxCSocio] FOREIGN KEY([IdSocio])
REFERENCES [dbo].[FCCxCSocio] ([Id_Socio])
GO
ALTER TABLE [dbo].[FCCxCMaestro] CHECK CONSTRAINT [FK_FCCxCMaestro_FCCxCSocio]
GO
ALTER TABLE [dbo].[FCCxCMovimientoCuenta]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCMovimientoCuenta_FCCxCFormaPago] FOREIGN KEY([IdFormaPago])
REFERENCES [dbo].[FCCxCFormaPago] ([IdFormaPago])
GO
ALTER TABLE [dbo].[FCCxCMovimientoCuenta] CHECK CONSTRAINT [FK_FCCxCMovimientoCuenta_FCCxCFormaPago]
GO
ALTER TABLE [dbo].[FCCxCMovimientoCuenta]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCPagos_FCCxCAuxiliares] FOREIGN KEY([IdAuxiliar])
REFERENCES [dbo].[FCCxCAuxiliar] ([IdAuxiliar])
GO
ALTER TABLE [dbo].[FCCxCMovimientoCuenta] CHECK CONSTRAINT [FK_FCCxCPagos_FCCxCAuxiliares]
GO
ALTER TABLE [dbo].[FCCxCMovimientoCuenta]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCPagos_FCCxCEstadoPago] FOREIGN KEY([IdEstadoPago])
REFERENCES [dbo].[FCCxCEstadoPago] ([IdEstadoPago])
GO
ALTER TABLE [dbo].[FCCxCMovimientoCuenta] CHECK CONSTRAINT [FK_FCCxCPagos_FCCxCEstadoPago]
GO
ALTER TABLE [dbo].[FCCxCMovimientoCuenta]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCPagos_FCCxCMaestro] FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[FCCxCMaestro] ([IdCuenta])
GO
ALTER TABLE [dbo].[FCCxCMovimientoCuenta] CHECK CONSTRAINT [FK_FCCxCPagos_FCCxCMaestro]
GO
ALTER TABLE [dbo].[FCCXCOtrosCargos]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCOtrosCargos_FCCXCDocumentoElectronico] FOREIGN KEY([IdDocumento])
REFERENCES [dbo].[FCCXCDocumentoElectronico] ([IdDocumentoElectronico])
GO
ALTER TABLE [dbo].[FCCXCOtrosCargos] CHECK CONSTRAINT [FK_FCCXCOtrosCargos_FCCXCDocumentoElectronico]
GO
ALTER TABLE [dbo].[FCCXCOtrosCargos]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCOtrosCargos_FCCXCTipoCargoTerceros] FOREIGN KEY([IdTercero])
REFERENCES [dbo].[FCCXCTipoCargoTerceros] ([IdTercero])
GO
ALTER TABLE [dbo].[FCCXCOtrosCargos] CHECK CONSTRAINT [FK_FCCXCOtrosCargos_FCCXCTipoCargoTerceros]
GO
ALTER TABLE [dbo].[FCCXCOtrosCargos]  WITH CHECK ADD  CONSTRAINT [FK_FCCXCOtrosCargos_FCCXCTipoOtrosCargos] FOREIGN KEY([IdTipoCargo])
REFERENCES [dbo].[FCCXCTipoOtrosCargos] ([IdTipoCargo])
GO
ALTER TABLE [dbo].[FCCXCOtrosCargos] CHECK CONSTRAINT [FK_FCCXCOtrosCargos_FCCXCTipoOtrosCargos]
GO
ALTER TABLE [dbo].[FCCxCPeriodo]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCPeriodo_FCCxCAuxiliar] FOREIGN KEY([IdAuxiliar])
REFERENCES [dbo].[FCCxCAuxiliar] ([IdAuxiliar])
GO
ALTER TABLE [dbo].[FCCxCPeriodo] CHECK CONSTRAINT [FK_FCCxCPeriodo_FCCxCAuxiliar]
GO
ALTER TABLE [dbo].[FCCxCSocio]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCSocio_FCCxCIdentificacionTipo] FOREIGN KEY([Id_TipoIdentif])
REFERENCES [dbo].[FCCxCIdentificacionTipo] ([Id_TipoIdentif])
GO
ALTER TABLE [dbo].[FCCxCSocio] CHECK CONSTRAINT [FK_FCCxCSocio_FCCxCIdentificacionTipo]
GO
ALTER TABLE [dbo].[FCCxCSocio]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCSocio_FCCxCSocioTipo] FOREIGN KEY([Id_TipoSocio])
REFERENCES [dbo].[FCCxCSocioTipo] ([IdTipoDeudor])
GO
ALTER TABLE [dbo].[FCCxCSocio] CHECK CONSTRAINT [FK_FCCxCSocio_FCCxCSocioTipo]
GO
ALTER TABLE [dbo].[FCCxCTipoCambio]  WITH CHECK ADD  CONSTRAINT [FK_FCCxCTipoCambio_FCCxCMonedas] FOREIGN KEY([IdMoneda])
REFERENCES [dbo].[FCCxCMonedas] ([IdMoneda])
GO
ALTER TABLE [dbo].[FCCxCTipoCambio] CHECK CONSTRAINT [FK_FCCxCTipoCambio_FCCxCMonedas]
GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCActiEconomica_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCActiEconomica'
-- Recibe: @iIdActiEconomica int
-- Recibe: @iCodMdH int
-- Recibe: @sDscActividad nvarchar(100)
-- Recibe: @iIndDevuelveIVA int
-- Recibe: @bIndActiPrincipal bit
-- Recibe: @iIdImporteIVA int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCActiEconomica_Actualizar]
	@iIdActiEconomica int,
	@iCodMdH int,
	@sDscActividad nvarchar(100),
	@iIndDevuelveIVA int,
	@bIndActiPrincipal bit,
	@iIdImporteIVA int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCActiEconomica]
SET 
	[CodMdH] = @iCodMdH,
	[DscActividad] = @sDscActividad,
	[IndDevuelveIVA] = @iIndDevuelveIVA,
	[IndActiPrincipal] = @bIndActiPrincipal,
	[IdImporteIVA] = @iIdImporteIVA,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdActiEconomica] = @iIdActiEconomica


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCActiEconomica_ActualizarTodos_Con_IdImporteIVA_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCActiEconomica'.
-- Actualiza el campo [IdImporteIVA] con el valor anterior de@iIdImporteIVA  al valor @iIdImporteIVA
-- Recibe: @iIdImporteIVA int
-- Recibe: @iIdImporteIVAOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCActiEconomica_ActualizarTodos_Con_IdImporteIVA_FK]
	@iIdImporteIVA int,
	@iIdImporteIVAOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCActiEconomica]
SET
	[IdImporteIVA] = @iIdImporteIVA
WHERE
	[IdImporteIVA] = @iIdImporteIVAOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCActiEconomica_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCActiEconomica'
-- Recibe: @iIdActiEconomica int
-- Recibe: @iCodMdH int
-- Recibe: @sDscActividad nvarchar(100)
-- Recibe: @iIndDevuelveIVA int
-- Recibe: @bIndActiPrincipal bit
-- Recibe: @iIdImporteIVA int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCActiEconomica_Buscar]
	@iIdActiEconomica int,
	@iCodMdH int,
	@sDscActividad nvarchar(100),
	@iIndDevuelveIVA int,
	@bIndActiPrincipal bit,
	@iIdImporteIVA int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCActiEconomica] 
 WHERE 
	(@iIdActiEconomica IS NULL OR [IdActiEconomica] = @iIdActiEconomica) AND 
	(@iCodMdH IS NULL OR [CodMdH] = @iCodMdH) AND 
	(@sDscActividad IS NULL OR [DscActividad] LIKE @sDscActividad) AND 
	(@iIndDevuelveIVA IS NULL OR [IndDevuelveIVA] = @iIndDevuelveIVA) AND 
	(@bIndActiPrincipal IS NULL OR [IndActiPrincipal] = @bIndActiPrincipal) AND 
	(@iIdImporteIVA IS NULL OR [IdImporteIVA] = @iIdImporteIVA) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCActiEconomica_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCActiEconomica'
-- utilizando la llave primaria. 
-- Recibe: @iIdActiEconomica int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCActiEconomica_Eliminar]
	@iIdActiEconomica int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCActiEconomica]
WHERE
	[IdActiEconomica] = @iIdActiEconomica


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCActiEconomica_EliminarTodo_FK_IdImporteIVA]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCActiEconomica'
-- basado en un campo llave primaria.
-- Recibe: @iIdImporteIVA int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCActiEconomica_EliminarTodo_FK_IdImporteIVA]
	@iIdImporteIVA int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCActiEconomica]
WHERE
	[IdImporteIVA] = @iIdImporteIVA


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCActiEconomica_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCActiEconomica'
-- Recibe: @iCodMdH int
-- Recibe: @sDscActividad nvarchar(100)
-- Recibe: @iIndDevuelveIVA int
-- Recibe: @bIndActiPrincipal bit
-- Recibe: @iIdImporteIVA int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iIdActiEconomica int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCActiEconomica_Insertar]
	@iCodMdH int,
	@sDscActividad nvarchar(100),
	@iIndDevuelveIVA int,
	@bIndActiPrincipal bit,
	@iIdImporteIVA int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iIdActiEconomica int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCActiEconomica]
(
	[CodMdH],
	[DscActividad],
	[IndDevuelveIVA],
	[IndActiPrincipal],
	[IdImporteIVA],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@iCodMdH,
	@sDscActividad,
	@iIndDevuelveIVA,
	@bIndActiPrincipal,
	@iIdImporteIVA,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdActiEconomica=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCActiEconomica_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCActiEconomica'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCActiEconomica_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCActiEconomica]
ORDER BY 
	[IdActiEconomica] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCActiEconomica_SeleccionarTodos_Con_IdImporteIVA_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCActiEconomica'
-- basado en un campo llave primaria.
-- Recibe: @iIdImporteIVA int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCActiEconomica_SeleccionarTodos_Con_IdImporteIVA_FK]
	@iIdImporteIVA int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCActiEconomica]
WHERE
	[IdImporteIVA] = @iIdImporteIVA


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCActiEconomica_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCActiEconomica'
-- basado en la llave primaria.
-- Recibe: @iIdActiEconomica int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCActiEconomica_SeleccionarUno]
	@iIdActiEconomica int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCActiEconomica]
WHERE
	[IdActiEconomica] = @iIdActiEconomica


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCAuxiliar_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCAuxiliar'
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDscAuxiliar varchar(60)
-- Recibe: @sCodEstado char(1)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCAuxiliar_Actualizar]
	@iIdAuxiliar int,
	@sDscAuxiliar varchar(60),
	@sCodEstado char(1),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCAuxiliar]
SET 
	[DscAuxiliar] = @sDscAuxiliar,
	[CodEstado] = @sCodEstado
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCAuxiliar_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCAuxiliar'
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDscAuxiliar varchar(60)
-- Recibe: @sCodEstado char(1)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCAuxiliar_Buscar]
	@iIdAuxiliar int,
	@sDscAuxiliar varchar(60),
	@sCodEstado char(1),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCAuxiliar] 
 WHERE 
	(@iIdAuxiliar IS NULL OR [IdAuxiliar] = @iIdAuxiliar) AND 
	(@sDscAuxiliar IS NULL OR [DscAuxiliar] LIKE @sDscAuxiliar) AND 
	(@sCodEstado IS NULL OR [CodEstado] LIKE @sCodEstado)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCAuxiliar_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCAuxiliar'
-- utilizando la llave primaria. 
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCAuxiliar_Eliminar]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCAuxiliar]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCAuxiliar_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCAuxiliar'
-- Recibe: @sDscAuxiliar varchar(60)
-- Recibe: @sCodEstado char(1)
-- Retorna: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCAuxiliar_Insertar]
	@sDscAuxiliar varchar(60),
	@sCodEstado char(1),
	@iIdAuxiliar int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCAuxiliar]
(
	[DscAuxiliar],
	[CodEstado]
)
VALUES
(
	@sDscAuxiliar,
	@sCodEstado
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdAuxiliar=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCAuxiliar_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCAuxiliar'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCAuxiliar_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCAuxiliar]
ORDER BY 
	[IdAuxiliar] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCAuxiliar_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCAuxiliar'
-- basado en la llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCAuxiliar_SeleccionarUno]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCAuxiliar]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCBienoServicio'
-- Recibe: @iIdBoS int
-- Recibe: @sDscBoS varchar(150)
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdConcepto int
-- Recibe: @sIndTipo char(1)
-- Recibe: @bIndFacturar bit
-- Recibe: @bIndDescuento bit
-- Recibe: @bIndPagaImpuesto bit
-- Recibe: @iCodPartidaArancelaria int
-- Recibe: @iIdMedida int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Recibe: @iId_SP int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_Actualizar]
	@iIdBoS int,
	@sDscBoS varchar(150),
	@iIdAuxiliar int,
	@iIdConcepto int,
	@sIndTipo char(1),
	@bIndFacturar bit,
	@bIndDescuento bit,
	@bIndPagaImpuesto bit,
	@iCodPartidaArancelaria int,
	@iIdMedida int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iId_SP int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBienoServicio]
SET 
	[DscBoS] = @sDscBoS,
	[IdAuxiliar] = @iIdAuxiliar,
	[IdConcepto] = @iIdConcepto,
	[IndTipo] = @sIndTipo,
	[IndFacturar] = @bIndFacturar,
	[IndDescuento] = @bIndDescuento,
	[IndPagaImpuesto] = @bIndPagaImpuesto,
	[CodPartidaArancelaria] = @iCodPartidaArancelaria,
	[IdMedida] = @iIdMedida,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif,
	[Id_SP] = @iId_SP
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_ActualizarTodos_Con_Id_SP_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCBienoServicio'.
-- Actualiza el campo [Id_SP] con el valor anterior de@iId_SP  al valor @iId_SP
-- Recibe: @iId_SP int
-- Recibe: @iId_SPOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_ActualizarTodos_Con_Id_SP_FK]
	@iId_SP int,
	@iId_SPOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBienoServicio]
SET
	[Id_SP] = @iId_SP
WHERE
	[Id_SP] = @iId_SPOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_ActualizarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCBienoServicio'.
-- Actualiza el campo [IdAuxiliar] con el valor anterior de@iIdAuxiliar  al valor @iIdAuxiliar
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdAuxiliarOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_ActualizarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iIdAuxiliarOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBienoServicio]
SET
	[IdAuxiliar] = @iIdAuxiliar
WHERE
	[IdAuxiliar] = @iIdAuxiliarOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_ActualizarTodos_Con_IdConcepto_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCBienoServicio'.
-- Actualiza el campo [IdConcepto] con el valor anterior de@iIdConcepto  al valor @iIdConcepto
-- Recibe: @iIdConcepto int
-- Recibe: @iIdConceptoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_ActualizarTodos_Con_IdConcepto_FK]
	@iIdConcepto int,
	@iIdConceptoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBienoServicio]
SET
	[IdConcepto] = @iIdConcepto
WHERE
	[IdConcepto] = @iIdConceptoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_ActualizarTodos_Con_IdMedida_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCBienoServicio'.
-- Actualiza el campo [IdMedida] con el valor anterior de@iIdMedida  al valor @iIdMedida
-- Recibe: @iIdMedida int
-- Recibe: @iIdMedidaOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_ActualizarTodos_Con_IdMedida_FK]
	@iIdMedida int,
	@iIdMedidaOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBienoServicio]
SET
	[IdMedida] = @iIdMedida
WHERE
	[IdMedida] = @iIdMedidaOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCBienoServicio'
-- Recibe: @iIdBoS int
-- Recibe: @sDscBoS varchar(150)
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdConcepto int
-- Recibe: @sIndTipo char(1)
-- Recibe: @bIndFacturar bit
-- Recibe: @bIndDescuento bit
-- Recibe: @bIndPagaImpuesto bit
-- Recibe: @iCodPartidaArancelaria int
-- Recibe: @iIdMedida int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Recibe: @iId_SP int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_Buscar]
	@iIdBoS int,
	@sDscBoS varchar(150),
	@iIdAuxiliar int,
	@iIdConcepto int,
	@sIndTipo char(1),
	@bIndFacturar bit,
	@bIndDescuento bit,
	@bIndPagaImpuesto bit,
	@iCodPartidaArancelaria int,
	@iIdMedida int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iId_SP int,
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCBienoServicio] 
 WHERE 
	(@iIdBoS IS NULL OR [IdBoS] = @iIdBoS) AND 
	(@sDscBoS IS NULL OR [DscBoS] LIKE @sDscBoS) AND 
	(@iIdAuxiliar IS NULL OR [IdAuxiliar] = @iIdAuxiliar) AND 
	(@iIdConcepto IS NULL OR [IdConcepto] = @iIdConcepto) AND 
	(@sIndTipo IS NULL OR [IndTipo] LIKE @sIndTipo) AND 
	(@bIndFacturar IS NULL OR [IndFacturar] = @bIndFacturar) AND 
	(@bIndDescuento IS NULL OR [IndDescuento] = @bIndDescuento) AND 
	(@bIndPagaImpuesto IS NULL OR [IndPagaImpuesto] = @bIndPagaImpuesto) AND 
	(@iCodPartidaArancelaria IS NULL OR [CodPartidaArancelaria] = @iCodPartidaArancelaria) AND 
	(@iIdMedida IS NULL OR [IdMedida] = @iIdMedida) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif) AND 
	(@iId_SP IS NULL OR [Id_SP] = @iId_SP)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCBienoServicio'
-- utilizando la llave primaria. 
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_Eliminar]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCBienoServicio]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_EliminarTodo_FK_Id_SP]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCBienoServicio'
-- basado en un campo llave primaria.
-- Recibe: @iId_SP int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_EliminarTodo_FK_Id_SP]
	@iId_SP int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCBienoServicio]
WHERE
	[Id_SP] = @iId_SP


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_EliminarTodo_FK_IdAuxiliar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCBienoServicio'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_EliminarTodo_FK_IdAuxiliar]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCBienoServicio]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_EliminarTodo_FK_IdConcepto]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCBienoServicio'
-- basado en un campo llave primaria.
-- Recibe: @iIdConcepto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_EliminarTodo_FK_IdConcepto]
	@iIdConcepto int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCBienoServicio]
WHERE
	[IdConcepto] = @iIdConcepto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_EliminarTodo_FK_IdMedida]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCBienoServicio'
-- basado en un campo llave primaria.
-- Recibe: @iIdMedida int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_EliminarTodo_FK_IdMedida]
	@iIdMedida int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCBienoServicio]
WHERE
	[IdMedida] = @iIdMedida


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCBienoServicio'
-- Recibe: @sDscBoS varchar(150)
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdConcepto int
-- Recibe: @sIndTipo char(1)
-- Recibe: @bIndFacturar bit
-- Recibe: @bIndDescuento bit
-- Recibe: @bIndPagaImpuesto bit
-- Recibe: @iCodPartidaArancelaria int
-- Recibe: @iIdMedida int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Recibe: @iId_SP int
-- Retorna: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_Insertar]
	@sDscBoS varchar(150),
	@iIdAuxiliar int,
	@iIdConcepto int,
	@sIndTipo char(1),
	@bIndFacturar bit,
	@bIndDescuento bit,
	@bIndPagaImpuesto bit,
	@iCodPartidaArancelaria int,
	@iIdMedida int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iId_SP int,
	@iIdBoS int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCBienoServicio]
(
	[DscBoS],
	[IdAuxiliar],
	[IdConcepto],
	[IndTipo],
	[IndFacturar],
	[IndDescuento],
	[IndPagaImpuesto],
	[CodPartidaArancelaria],
	[IdMedida],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif],
	[Id_SP]
)
VALUES
(
	@sDscBoS,
	@iIdAuxiliar,
	@iIdConcepto,
	@sIndTipo,
	@bIndFacturar,
	@bIndDescuento,
	@bIndPagaImpuesto,
	@iCodPartidaArancelaria,
	@iIdMedida,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif,
	@iId_SP
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdBoS=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCBienoServicio'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCBienoServicio]
ORDER BY 
	[IdBoS] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos_Con_Id_SP_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCBienoServicio'
-- basado en un campo llave primaria.
-- Recibe: @iId_SP int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos_Con_Id_SP_FK]
	@iId_SP int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCBienoServicio]
WHERE
	[Id_SP] = @iId_SP


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCBienoServicio'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCBienoServicio]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos_Con_IdConcepto_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCBienoServicio'
-- basado en un campo llave primaria.
-- Recibe: @iIdConcepto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos_Con_IdConcepto_FK]
	@iIdConcepto int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCBienoServicio]
WHERE
	[IdConcepto] = @iIdConcepto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos_Con_IdMedida_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCBienoServicio'
-- basado en un campo llave primaria.
-- Recibe: @iIdMedida int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_SeleccionarTodos_Con_IdMedida_FK]
	@iIdMedida int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCBienoServicio]
WHERE
	[IdMedida] = @iIdMedida


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBienoServicio_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCBienoServicio'
-- basado en la llave primaria.
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBienoServicio_SeleccionarUno]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCBienoServicio]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBitacoraSucesos_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCBitacoraSucesos'
-- Recibe: @iIdSuceso int
-- Recibe: @daFecSuceso datetime
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDscSuceso varchar(500)
-- Recibe: @sDscExcepcion varchar(1000)
-- Recibe: @sUsrActual varchar(50)
-- Recibe: @sTipSuceso char(1)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBitacoraSucesos_Actualizar]
	@iIdSuceso int,
	@daFecSuceso datetime,
	@iIdAuxiliar int,
	@sDscSuceso varchar(500),
	@sDscExcepcion varchar(1000),
	@sUsrActual varchar(50),
	@sTipSuceso char(1),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBitacoraSucesos]
SET 
	[FecSuceso] = @daFecSuceso,
	[IdAuxiliar] = @iIdAuxiliar,
	[DscSuceso] = @sDscSuceso,
	[DscExcepcion] = @sDscExcepcion,
	[UsrActual] = @sUsrActual,
	[TipSuceso] = @sTipSuceso
WHERE
	[IdSuceso] = @iIdSuceso


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBitacoraSucesos_ActualizarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCBitacoraSucesos'.
-- Actualiza el campo [IdAuxiliar] con el valor anterior de@iIdAuxiliar  al valor @iIdAuxiliar
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdAuxiliarOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBitacoraSucesos_ActualizarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iIdAuxiliarOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBitacoraSucesos]
SET
	[IdAuxiliar] = @iIdAuxiliar
WHERE
	[IdAuxiliar] = @iIdAuxiliarOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBitacoraSucesos_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCBitacoraSucesos'
-- Recibe: @iIdSuceso int
-- Recibe: @daFecSuceso datetime
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDscSuceso varchar(500)
-- Recibe: @sDscExcepcion varchar(1000)
-- Recibe: @sUsrActual varchar(50)
-- Recibe: @sTipSuceso char(1)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBitacoraSucesos_Buscar]
	@iIdSuceso int,
	@daFecSuceso datetime,
	@iIdAuxiliar int,
	@sDscSuceso varchar(500),
	@sDscExcepcion varchar(1000),
	@sUsrActual varchar(50),
	@sTipSuceso char(1),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCBitacoraSucesos] 
 WHERE 
	(@iIdSuceso IS NULL OR [IdSuceso] = @iIdSuceso) AND 
	(@daFecSuceso IS NULL OR [FecSuceso] >= @daFecSuceso) AND 
	(@iIdAuxiliar IS NULL OR [IdAuxiliar] = @iIdAuxiliar) AND 
	(@sDscSuceso IS NULL OR [DscSuceso] LIKE @sDscSuceso) AND 
	(@sDscExcepcion IS NULL OR [DscExcepcion] LIKE @sDscExcepcion) AND 
	(@sUsrActual IS NULL OR [UsrActual] LIKE @sUsrActual) AND 
	(@sTipSuceso IS NULL OR [TipSuceso] LIKE @sTipSuceso)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBitacoraSucesos_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCBitacoraSucesos'
-- utilizando la llave primaria. 
-- Recibe: @iIdSuceso int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBitacoraSucesos_Eliminar]
	@iIdSuceso int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCBitacoraSucesos]
WHERE
	[IdSuceso] = @iIdSuceso


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBitacoraSucesos_EliminarTodo_FK_IdAuxiliar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCBitacoraSucesos'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBitacoraSucesos_EliminarTodo_FK_IdAuxiliar]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCBitacoraSucesos]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBitacoraSucesos_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCBitacoraSucesos'
-- Recibe: @daFecSuceso datetime
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDscSuceso varchar(500)
-- Recibe: @sDscExcepcion varchar(1000)
-- Recibe: @sUsrActual varchar(50)
-- Recibe: @sTipSuceso char(1)
-- Retorna: @iIdSuceso int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBitacoraSucesos_Insertar]
	@daFecSuceso datetime,
	@iIdAuxiliar int,
	@sDscSuceso varchar(500),
	@sDscExcepcion varchar(1000),
	@sUsrActual varchar(50),
	@sTipSuceso char(1),
	@iIdSuceso int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCBitacoraSucesos]
(
	[FecSuceso],
	[IdAuxiliar],
	[DscSuceso],
	[DscExcepcion],
	[UsrActual],
	[TipSuceso]
)
VALUES
(
	@daFecSuceso,
	@iIdAuxiliar,
	@sDscSuceso,
	@sDscExcepcion,
	@sUsrActual,
	@sTipSuceso
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdSuceso=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBitacoraSucesos_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCBitacoraSucesos'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBitacoraSucesos_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCBitacoraSucesos]
ORDER BY 
	[IdSuceso] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBitacoraSucesos_SeleccionarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCBitacoraSucesos'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBitacoraSucesos_SeleccionarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCBitacoraSucesos]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBitacoraSucesos_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCBitacoraSucesos'
-- basado en la llave primaria.
-- Recibe: @iIdSuceso int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBitacoraSucesos_SeleccionarUno]
	@iIdSuceso int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCBitacoraSucesos]
WHERE
	[IdSuceso] = @iIdSuceso


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCBoSPrecio'
-- Recibe: @iIdBoSPrecio int
-- Recibe: @iIdBoS int
-- Recibe: @curMonPrecio money
-- Recibe: @curMonCosto money
-- Recibe: @iNumPeriodo int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_Actualizar]
	@iIdBoSPrecio int,
	@iIdBoS int,
	@curMonPrecio money,
	@curMonCosto money,
	@iNumPeriodo int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBoSPrecio]
SET 
	[IdBoS] = @iIdBoS,
	[MonPrecio] = @curMonPrecio,
	[MonCosto] = @curMonCosto,
	[NumPeriodo] = @iNumPeriodo,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdBoSPrecio] = @iIdBoSPrecio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_ActualizarTodos_Con_IdBoS_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCBoSPrecio'.
-- Actualiza el campo [IdBoS] con el valor anterior de@iIdBoS  al valor @iIdBoS
-- Recibe: @iIdBoS int
-- Recibe: @iIdBoSOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_ActualizarTodos_Con_IdBoS_FK]
	@iIdBoS int,
	@iIdBoSOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBoSPrecio]
SET
	[IdBoS] = @iIdBoS
WHERE
	[IdBoS] = @iIdBoSOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_ActualizarTodos_Con_NumPeriodo_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCBoSPrecio'.
-- Actualiza el campo [NumPeriodo] con el valor anterior de@iNumPeriodo  al valor @iNumPeriodo
-- Recibe: @iNumPeriodo int
-- Recibe: @iNumPeriodoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_ActualizarTodos_Con_NumPeriodo_FK]
	@iNumPeriodo int,
	@iNumPeriodoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCBoSPrecio]
SET
	[NumPeriodo] = @iNumPeriodo
WHERE
	[NumPeriodo] = @iNumPeriodoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCBoSPrecio'
-- Recibe: @iIdBoSPrecio int
-- Recibe: @iIdBoS int
-- Recibe: @curMonPrecio money
-- Recibe: @curMonCosto money
-- Recibe: @iNumPeriodo int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_Buscar]
	@iIdBoSPrecio int,
	@iIdBoS int,
	@curMonPrecio money,
	@curMonCosto money,
	@iNumPeriodo int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCBoSPrecio] 
 WHERE 
	(@iIdBoSPrecio IS NULL OR [IdBoSPrecio] = @iIdBoSPrecio) AND 
	(@iIdBoS IS NULL OR [IdBoS] = @iIdBoS) AND 
	(@curMonPrecio IS NULL OR [MonPrecio] = @curMonPrecio) AND 
	(@curMonCosto IS NULL OR [MonCosto] = @curMonCosto) AND 
	(@iNumPeriodo IS NULL OR [NumPeriodo] = @iNumPeriodo) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCBoSPrecio'
-- utilizando la llave primaria. 
-- Recibe: @iIdBoSPrecio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_Eliminar]
	@iIdBoSPrecio int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCBoSPrecio]
WHERE
	[IdBoSPrecio] = @iIdBoSPrecio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_EliminarTodo_FK_IdBoS]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCBoSPrecio'
-- basado en un campo llave primaria.
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_EliminarTodo_FK_IdBoS]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCBoSPrecio]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_EliminarTodo_FK_NumPeriodo]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCBoSPrecio'
-- basado en un campo llave primaria.
-- Recibe: @iNumPeriodo int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_EliminarTodo_FK_NumPeriodo]
	@iNumPeriodo int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCBoSPrecio]
WHERE
	[NumPeriodo] = @iNumPeriodo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCBoSPrecio'
-- Recibe: @iIdBoS int
-- Recibe: @curMonPrecio money
-- Recibe: @curMonCosto money
-- Recibe: @iNumPeriodo int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iIdBoSPrecio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_Insertar]
	@iIdBoS int,
	@curMonPrecio money,
	@curMonCosto money,
	@iNumPeriodo int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iIdBoSPrecio int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCBoSPrecio]
(
	[IdBoS],
	[MonPrecio],
	[MonCosto],
	[NumPeriodo],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@iIdBoS,
	@curMonPrecio,
	@curMonCosto,
	@iNumPeriodo,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdBoSPrecio=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCBoSPrecio'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCBoSPrecio]
ORDER BY 
	[IdBoSPrecio] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_SeleccionarTodos_Con_IdBoS_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCBoSPrecio'
-- basado en un campo llave primaria.
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_SeleccionarTodos_Con_IdBoS_FK]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCBoSPrecio]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_SeleccionarTodos_Con_NumPeriodo_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCBoSPrecio'
-- basado en un campo llave primaria.
-- Recibe: @iNumPeriodo int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_SeleccionarTodos_Con_NumPeriodo_FK]
	@iNumPeriodo int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCBoSPrecio]
WHERE
	[NumPeriodo] = @iNumPeriodo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCBoSPrecio_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCBoSPrecio'
-- basado en la llave primaria.
-- Recibe: @iIdBoSPrecio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCBoSPrecio_SeleccionarUno]
	@iIdBoSPrecio int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCBoSPrecio]
WHERE
	[IdBoSPrecio] = @iIdBoSPrecio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCConcepto_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCConcepto'
-- Recibe: @iIdConcepto int
-- Recibe: @sDscTipo varchar(100)
-- Recibe: @sCodEstado char(1)
-- Recibe: @sCtaFinancieraDebito varchar(100)
-- Recibe: @sCtaFinancieraCredito varchar(100)
-- Recibe: @sUsarExpiracion char(1)
-- Recibe: @iNumDiasExpira int
-- Recibe: @sEnviaNotificacion char(1)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCConcepto_Actualizar]
	@iIdConcepto int,
	@sDscTipo varchar(100),
	@sCodEstado char(1),
	@sCtaFinancieraDebito varchar(100),
	@sCtaFinancieraCredito varchar(100),
	@sUsarExpiracion char(1),
	@iNumDiasExpira int,
	@sEnviaNotificacion char(1),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCConcepto]
SET 
	[DscTipo] = @sDscTipo,
	[CodEstado] = @sCodEstado,
	[CtaFinancieraDebito] = @sCtaFinancieraDebito,
	[CtaFinancieraCredito] = @sCtaFinancieraCredito,
	[UsarExpiracion] = @sUsarExpiracion,
	[NumDiasExpira] = @iNumDiasExpira,
	[EnviaNotificacion] = @sEnviaNotificacion
WHERE
	[IdConcepto] = @iIdConcepto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCConcepto_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCConcepto'
-- Recibe: @iIdConcepto int
-- Recibe: @sDscTipo varchar(100)
-- Recibe: @sCodEstado char(1)
-- Recibe: @sCtaFinancieraDebito varchar(100)
-- Recibe: @sCtaFinancieraCredito varchar(100)
-- Recibe: @sUsarExpiracion char(1)
-- Recibe: @iNumDiasExpira int
-- Recibe: @sEnviaNotificacion char(1)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCConcepto_Buscar]
	@iIdConcepto int,
	@sDscTipo varchar(100),
	@sCodEstado char(1),
	@sCtaFinancieraDebito varchar(100),
	@sCtaFinancieraCredito varchar(100),
	@sUsarExpiracion char(1),
	@iNumDiasExpira int,
	@sEnviaNotificacion char(1),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCConcepto] 
 WHERE 
	(@iIdConcepto IS NULL OR [IdConcepto] = @iIdConcepto) AND 
	(@sDscTipo IS NULL OR [DscTipo] LIKE @sDscTipo) AND 
	(@sCodEstado IS NULL OR [CodEstado] LIKE @sCodEstado) AND 
	(@sCtaFinancieraDebito IS NULL OR [CtaFinancieraDebito] LIKE @sCtaFinancieraDebito) AND 
	(@sCtaFinancieraCredito IS NULL OR [CtaFinancieraCredito] LIKE @sCtaFinancieraCredito) AND 
	(@sUsarExpiracion IS NULL OR [UsarExpiracion] LIKE @sUsarExpiracion) AND 
	(@iNumDiasExpira IS NULL OR [NumDiasExpira] = @iNumDiasExpira) AND 
	(@sEnviaNotificacion IS NULL OR [EnviaNotificacion] LIKE @sEnviaNotificacion)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCConcepto_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCConcepto'
-- utilizando la llave primaria. 
-- Recibe: @iIdConcepto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCConcepto_Eliminar]
	@iIdConcepto int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCConcepto]
WHERE
	[IdConcepto] = @iIdConcepto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCConcepto_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCConcepto'
-- Recibe: @sDscTipo varchar(100)
-- Recibe: @sCodEstado char(1)
-- Recibe: @sCtaFinancieraDebito varchar(100)
-- Recibe: @sCtaFinancieraCredito varchar(100)
-- Recibe: @sUsarExpiracion char(1)
-- Recibe: @iNumDiasExpira int
-- Recibe: @sEnviaNotificacion char(1)
-- Retorna: @iIdConcepto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCConcepto_Insertar]
	@sDscTipo varchar(100),
	@sCodEstado char(1),
	@sCtaFinancieraDebito varchar(100),
	@sCtaFinancieraCredito varchar(100),
	@sUsarExpiracion char(1),
	@iNumDiasExpira int,
	@sEnviaNotificacion char(1),
	@iIdConcepto int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCConcepto]
(
	[DscTipo],
	[CodEstado],
	[CtaFinancieraDebito],
	[CtaFinancieraCredito],
	[UsarExpiracion],
	[NumDiasExpira],
	[EnviaNotificacion]
)
VALUES
(
	@sDscTipo,
	@sCodEstado,
	@sCtaFinancieraDebito,
	@sCtaFinancieraCredito,
	@sUsarExpiracion,
	@iNumDiasExpira,
	@sEnviaNotificacion
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdConcepto=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCConcepto_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCConcepto'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCConcepto_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCConcepto]
ORDER BY 
	[IdConcepto] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCConcepto_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCConcepto'
-- basado en la llave primaria.
-- Recibe: @iIdConcepto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCConcepto_SeleccionarUno]
	@iIdConcepto int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCConcepto]
WHERE
	[IdConcepto] = @iIdConcepto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCCondicionVenta_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCCondicionVenta'
-- Recibe: @iIdCondicionVenta int
-- Recibe: @sDscCondcionVenta varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCCondicionVenta_Actualizar]
	@iIdCondicionVenta int,
	@sDscCondcionVenta varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCCondicionVenta]
SET 
	[DscCondcionVenta] = @sDscCondcionVenta,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdCondicionVenta] = @iIdCondicionVenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCCondicionVenta_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCCondicionVenta'
-- Recibe: @iIdCondicionVenta int
-- Recibe: @sDscCondcionVenta varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCCondicionVenta_Buscar]
	@iIdCondicionVenta int,
	@sDscCondcionVenta varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCCondicionVenta] 
 WHERE 
	(@iIdCondicionVenta IS NULL OR [IdCondicionVenta] = @iIdCondicionVenta) AND 
	(@sDscCondcionVenta IS NULL OR [DscCondcionVenta] LIKE @sDscCondcionVenta) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCCondicionVenta_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCCondicionVenta'
-- utilizando la llave primaria. 
-- Recibe: @iIdCondicionVenta int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCCondicionVenta_Eliminar]
	@iIdCondicionVenta int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCCondicionVenta]
WHERE
	[IdCondicionVenta] = @iIdCondicionVenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCCondicionVenta_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCCondicionVenta'
-- Recibe: @iIdCondicionVenta int
-- Recibe: @sDscCondcionVenta varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCCondicionVenta_Insertar]
	@iIdCondicionVenta int,
	@sDscCondcionVenta varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCCondicionVenta]
(
	[IdCondicionVenta],
	[DscCondcionVenta],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@iIdCondicionVenta,
	@sDscCondcionVenta,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCCondicionVenta_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCCondicionVenta'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCCondicionVenta_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCCondicionVenta]
ORDER BY 
	[IdCondicionVenta] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCCondicionVenta_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCCondicionVenta'
-- basado en la llave primaria.
-- Recibe: @iIdCondicionVenta int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCCondicionVenta_SeleccionarUno]
	@iIdCondicionVenta int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCCondicionVenta]
WHERE
	[IdCondicionVenta] = @iIdCondicionVenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCDetalles'
-- Recibe: @iIdDetalleDocumento int
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @iNumLinea int
-- Recibe: @doCanBienoServicio real
-- Recibe: @iIdBoS int
-- Recibe: @curMonPrecio money
-- Recibe: @curMonDescuento money
-- Recibe: @curMonImpuesto money
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_Actualizar]
	@iIdDetalleDocumento int,
	@iIdDocumentoElectronico int,
	@iNumLinea int,
	@doCanBienoServicio real,
	@iIdBoS int,
	@curMonPrecio money,
	@curMonDescuento money,
	@curMonImpuesto money,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDetalles]
SET 
	[IdDocumentoElectronico] = @iIdDocumentoElectronico,
	[NumLinea] = @iNumLinea,
	[CanBienoServicio] = @doCanBienoServicio,
	[IdBoS] = @iIdBoS,
	[MonPrecio] = @curMonPrecio,
	[MonDescuento] = @curMonDescuento,
	[MonImpuesto] = @curMonImpuesto
WHERE
	[IdDetalleDocumento] = @iIdDetalleDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_ActualizarTodos_Con_IdBoS_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDetalles'.
-- Actualiza el campo [IdBoS] con el valor anterior de@iIdBoS  al valor @iIdBoS
-- Recibe: @iIdBoS int
-- Recibe: @iIdBoSOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_ActualizarTodos_Con_IdBoS_FK]
	@iIdBoS int,
	@iIdBoSOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDetalles]
SET
	[IdBoS] = @iIdBoS
WHERE
	[IdBoS] = @iIdBoSOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_ActualizarTodos_Con_IdDocumentoElectronico_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDetalles'.
-- Actualiza el campo [IdDocumentoElectronico] con el valor anterior de@iIdDocumentoElectronico  al valor @iIdDocumentoElectronico
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @iIdDocumentoElectronicoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_ActualizarTodos_Con_IdDocumentoElectronico_FK]
	@iIdDocumentoElectronico int,
	@iIdDocumentoElectronicoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDetalles]
SET
	[IdDocumentoElectronico] = @iIdDocumentoElectronico
WHERE
	[IdDocumentoElectronico] = @iIdDocumentoElectronicoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCDetalles'
-- Recibe: @iIdDetalleDocumento int
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @iNumLinea int
-- Recibe: @doCanBienoServicio real
-- Recibe: @iIdBoS int
-- Recibe: @curMonPrecio money
-- Recibe: @curMonDescuento money
-- Recibe: @curMonImpuesto money
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_Buscar]
	@iIdDetalleDocumento int,
	@iIdDocumentoElectronico int,
	@iNumLinea int,
	@doCanBienoServicio real,
	@iIdBoS int,
	@curMonPrecio money,
	@curMonDescuento money,
	@curMonImpuesto money,
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCDetalles] 
 WHERE 
	(@iIdDetalleDocumento IS NULL OR [IdDetalleDocumento] = @iIdDetalleDocumento) AND 
	(@iIdDocumentoElectronico IS NULL OR [IdDocumentoElectronico] = @iIdDocumentoElectronico) AND 
	(@iNumLinea IS NULL OR [NumLinea] = @iNumLinea) AND 
	(@doCanBienoServicio IS NULL OR [CanBienoServicio] = @doCanBienoServicio) AND 
	(@iIdBoS IS NULL OR [IdBoS] = @iIdBoS) AND 
	(@curMonPrecio IS NULL OR [MonPrecio] = @curMonPrecio) AND 
	(@curMonDescuento IS NULL OR [MonDescuento] = @curMonDescuento) AND 
	(@curMonImpuesto IS NULL OR [MonImpuesto] = @curMonImpuesto)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCDetalles'
-- utilizando la llave primaria. 
-- Recibe: @iIdDetalleDocumento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_Eliminar]
	@iIdDetalleDocumento int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCDetalles]
WHERE
	[IdDetalleDocumento] = @iIdDetalleDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_EliminarTodo_FK_IdBoS]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDetalles'
-- basado en un campo llave primaria.
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_EliminarTodo_FK_IdBoS]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDetalles]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_EliminarTodo_FK_IdDocumentoElectronico]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDetalles'
-- basado en un campo llave primaria.
-- Recibe: @iIdDocumentoElectronico int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_EliminarTodo_FK_IdDocumentoElectronico]
	@iIdDocumentoElectronico int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDetalles]
WHERE
	[IdDocumentoElectronico] = @iIdDocumentoElectronico


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCDetalles'
-- Recibe: @iIdDetalleDocumento int
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @iNumLinea int
-- Recibe: @doCanBienoServicio real
-- Recibe: @iIdBoS int
-- Recibe: @curMonPrecio money
-- Recibe: @curMonDescuento money
-- Recibe: @curMonImpuesto money
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_Insertar]
	@iIdDetalleDocumento int,
	@iIdDocumentoElectronico int,
	@iNumLinea int,
	@doCanBienoServicio real,
	@iIdBoS int,
	@curMonPrecio money,
	@curMonDescuento money,
	@curMonImpuesto money,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCDetalles]
(
	[IdDetalleDocumento],
	[IdDocumentoElectronico],
	[NumLinea],
	[CanBienoServicio],
	[IdBoS],
	[MonPrecio],
	[MonDescuento],
	[MonImpuesto]
)
VALUES
(
	@iIdDetalleDocumento,
	@iIdDocumentoElectronico,
	@iNumLinea,
	@doCanBienoServicio,
	@iIdBoS,
	@curMonPrecio,
	@curMonDescuento,
	@curMonImpuesto
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCDetalles'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCDetalles]
ORDER BY 
	[IdDetalleDocumento] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_SeleccionarTodos_Con_IdBoS_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDetalles'
-- basado en un campo llave primaria.
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_SeleccionarTodos_Con_IdBoS_FK]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDetalles]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_SeleccionarTodos_Con_IdDocumentoElectronico_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDetalles'
-- basado en un campo llave primaria.
-- Recibe: @iIdDocumentoElectronico int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_SeleccionarTodos_Con_IdDocumentoElectronico_FK]
	@iIdDocumentoElectronico int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDetalles]
WHERE
	[IdDocumentoElectronico] = @iIdDocumentoElectronico


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDetalles_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCDetalles'
-- basado en la llave primaria.
-- Recibe: @iIdDetalleDocumento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDetalles_SeleccionarUno]
	@iIdDetalleDocumento int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCDetalles]
WHERE
	[IdDetalleDocumento] = @iIdDetalleDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCDocumentoElectronico'
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @iIdActiEonomica int
-- Recibe: @iIdTipoDocumento int
-- Recibe: @sNumDocumento varchar(100)
-- Recibe: @daFecVencimiento datetime
-- Recibe: @iIdSocio int
-- Recibe: @iIdFormaPago int
-- Recibe: @iIdCondicionVenta int
-- Recibe: @seMailEnvio varchar(100)
-- Recibe: @doPorDescuento real
-- Recibe: @iIdRazonExoneración int
-- Recibe: @iIdMoneda int
-- Recibe: @sDscDocumento varchar(255)
-- Recibe: @iIdReferencia int
-- Recibe: @iIdTipoReferencia int
-- Recibe: @sNumDocumentoReferencia varchar(50)
-- Recibe: @sDscRazonReferencia varchar(255)
-- Recibe: @iIndMdH int
-- Recibe: @iIndEstadoConta int
-- Recibe: @iNumPeriodosConta int
-- Recibe: @iIdRazonExonera int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_Actualizar]
	@iIdDocumentoElectronico int,
	@iIdActiEonomica int,
	@iIdTipoDocumento int,
	@sNumDocumento varchar(100),
	@daFecVencimiento datetime,
	@iIdSocio int,
	@iIdFormaPago int,
	@iIdCondicionVenta int,
	@seMailEnvio varchar(100),
	@doPorDescuento real,
	@iIdRazonExoneración int,
	@iIdMoneda int,
	@sDscDocumento varchar(255),
	@iIdReferencia int,
	@iIdTipoReferencia int,
	@sNumDocumentoReferencia varchar(50),
	@sDscRazonReferencia varchar(255),
	@iIndMdH int,
	@iIndEstadoConta int,
	@iNumPeriodosConta int,
	@iIdRazonExonera int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET 
	[IdActiEonomica] = @iIdActiEonomica,
	[IdTipoDocumento] = @iIdTipoDocumento,
	[NumDocumento] = @sNumDocumento,
	[FecVencimiento] = @daFecVencimiento,
	[IdSocio] = @iIdSocio,
	[IdFormaPago] = @iIdFormaPago,
	[IdCondicionVenta] = @iIdCondicionVenta,
	[eMailEnvio] = @seMailEnvio,
	[PorDescuento] = @doPorDescuento,
	[IdRazonExoneración] = @iIdRazonExoneración,
	[IdMoneda] = @iIdMoneda,
	[DscDocumento] = @sDscDocumento,
	[IdReferencia] = @iIdReferencia,
	[IdTipoReferencia] = @iIdTipoReferencia,
	[NumDocumentoReferencia] = @sNumDocumentoReferencia,
	[DscRazonReferencia] = @sDscRazonReferencia,
	[IndMdH] = @iIndMdH,
	[IndEstadoConta] = @iIndEstadoConta,
	[NumPeriodosConta] = @iNumPeriodosConta,
	[IdRazonExonera] = @iIdRazonExonera
WHERE
	[IdDocumentoElectronico] = @iIdDocumentoElectronico


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdActiEonomica_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDocumentoElectronico'.
-- Actualiza el campo [IdActiEonomica] con el valor anterior de@iIdActiEonomica  al valor @iIdActiEonomica
-- Recibe: @iIdActiEonomica int
-- Recibe: @iIdActiEonomicaOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdActiEonomica_FK]
	@iIdActiEonomica int,
	@iIdActiEonomicaOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET
	[IdActiEonomica] = @iIdActiEonomica
WHERE
	[IdActiEonomica] = @iIdActiEonomicaOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdCondicionVenta_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDocumentoElectronico'.
-- Actualiza el campo [IdCondicionVenta] con el valor anterior de@iIdCondicionVenta  al valor @iIdCondicionVenta
-- Recibe: @iIdCondicionVenta int
-- Recibe: @iIdCondicionVentaOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdCondicionVenta_FK]
	@iIdCondicionVenta int,
	@iIdCondicionVentaOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET
	[IdCondicionVenta] = @iIdCondicionVenta
WHERE
	[IdCondicionVenta] = @iIdCondicionVentaOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdFormaPago_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDocumentoElectronico'.
-- Actualiza el campo [IdFormaPago] con el valor anterior de@iIdFormaPago  al valor @iIdFormaPago
-- Recibe: @iIdFormaPago int
-- Recibe: @iIdFormaPagoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdFormaPago_FK]
	@iIdFormaPago int,
	@iIdFormaPagoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET
	[IdFormaPago] = @iIdFormaPago
WHERE
	[IdFormaPago] = @iIdFormaPagoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdMoneda_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDocumentoElectronico'.
-- Actualiza el campo [IdMoneda] con el valor anterior de@iIdMoneda  al valor @iIdMoneda
-- Recibe: @iIdMoneda int
-- Recibe: @iIdMonedaOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdMoneda_FK]
	@iIdMoneda int,
	@iIdMonedaOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET
	[IdMoneda] = @iIdMoneda
WHERE
	[IdMoneda] = @iIdMonedaOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdRazonExoneración_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDocumentoElectronico'.
-- Actualiza el campo [IdRazonExoneración] con el valor anterior de@iIdRazonExoneración  al valor @iIdRazonExoneración
-- Recibe: @iIdRazonExoneración int
-- Recibe: @iIdRazonExoneraciónOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdRazonExoneración_FK]
	@iIdRazonExoneración int,
	@iIdRazonExoneraciónOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET
	[IdRazonExoneración] = @iIdRazonExoneración
WHERE
	[IdRazonExoneración] = @iIdRazonExoneraciónOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdReferencia_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDocumentoElectronico'.
-- Actualiza el campo [IdReferencia] con el valor anterior de@iIdReferencia  al valor @iIdReferencia
-- Recibe: @iIdReferencia int
-- Recibe: @iIdReferenciaOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdReferencia_FK]
	@iIdReferencia int,
	@iIdReferenciaOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET
	[IdReferencia] = @iIdReferencia
WHERE
	[IdReferencia] = @iIdReferenciaOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdSocio_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDocumentoElectronico'.
-- Actualiza el campo [IdSocio] con el valor anterior de@iIdSocio  al valor @iIdSocio
-- Recibe: @iIdSocio int
-- Recibe: @iIdSocioOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdSocio_FK]
	@iIdSocio int,
	@iIdSocioOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET
	[IdSocio] = @iIdSocio
WHERE
	[IdSocio] = @iIdSocioOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdTipoDocumento_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDocumentoElectronico'.
-- Actualiza el campo [IdTipoDocumento] con el valor anterior de@iIdTipoDocumento  al valor @iIdTipoDocumento
-- Recibe: @iIdTipoDocumento int
-- Recibe: @iIdTipoDocumentoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdTipoDocumento_FK]
	@iIdTipoDocumento int,
	@iIdTipoDocumentoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET
	[IdTipoDocumento] = @iIdTipoDocumento
WHERE
	[IdTipoDocumento] = @iIdTipoDocumentoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdTipoReferencia_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCDocumentoElectronico'.
-- Actualiza el campo [IdTipoReferencia] con el valor anterior de@iIdTipoReferencia  al valor @iIdTipoReferencia
-- Recibe: @iIdTipoReferencia int
-- Recibe: @iIdTipoReferenciaOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_ActualizarTodos_Con_IdTipoReferencia_FK]
	@iIdTipoReferencia int,
	@iIdTipoReferenciaOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCDocumentoElectronico]
SET
	[IdTipoReferencia] = @iIdTipoReferencia
WHERE
	[IdTipoReferencia] = @iIdTipoReferenciaOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCDocumentoElectronico'
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @iIdActiEonomica int
-- Recibe: @iIdTipoDocumento int
-- Recibe: @sNumDocumento varchar(100)
-- Recibe: @daFecVencimiento datetime
-- Recibe: @iIdSocio int
-- Recibe: @iIdFormaPago int
-- Recibe: @iIdCondicionVenta int
-- Recibe: @seMailEnvio varchar(100)
-- Recibe: @doPorDescuento real
-- Recibe: @iIdRazonExoneración int
-- Recibe: @iIdMoneda int
-- Recibe: @sDscDocumento varchar(255)
-- Recibe: @iIdReferencia int
-- Recibe: @iIdTipoReferencia int
-- Recibe: @sNumDocumentoReferencia varchar(50)
-- Recibe: @sDscRazonReferencia varchar(255)
-- Recibe: @iIndMdH int
-- Recibe: @iIndEstadoConta int
-- Recibe: @iNumPeriodosConta int
-- Recibe: @iIdRazonExonera int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_Buscar]
	@iIdDocumentoElectronico int,
	@iIdActiEonomica int,
	@iIdTipoDocumento int,
	@sNumDocumento varchar(100),
	@daFecVencimiento datetime,
	@iIdSocio int,
	@iIdFormaPago int,
	@iIdCondicionVenta int,
	@seMailEnvio varchar(100),
	@doPorDescuento real,
	@iIdRazonExoneración int,
	@iIdMoneda int,
	@sDscDocumento varchar(255),
	@iIdReferencia int,
	@iIdTipoReferencia int,
	@sNumDocumentoReferencia varchar(50),
	@sDscRazonReferencia varchar(255),
	@iIndMdH int,
	@iIndEstadoConta int,
	@iNumPeriodosConta int,
	@iIdRazonExonera int,
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico] 
 WHERE 
	(@iIdDocumentoElectronico IS NULL OR [IdDocumentoElectronico] = @iIdDocumentoElectronico) AND 
	(@iIdActiEonomica IS NULL OR [IdActiEonomica] = @iIdActiEonomica) AND 
	(@iIdTipoDocumento IS NULL OR [IdTipoDocumento] = @iIdTipoDocumento) AND 
	(@sNumDocumento IS NULL OR [NumDocumento] LIKE @sNumDocumento) AND 
	(@daFecVencimiento IS NULL OR [FecVencimiento] >= @daFecVencimiento) AND 
	(@iIdSocio IS NULL OR [IdSocio] = @iIdSocio) AND 
	(@iIdFormaPago IS NULL OR [IdFormaPago] = @iIdFormaPago) AND 
	(@iIdCondicionVenta IS NULL OR [IdCondicionVenta] = @iIdCondicionVenta) AND 
	(@seMailEnvio IS NULL OR [eMailEnvio] LIKE @seMailEnvio) AND 
	(@doPorDescuento IS NULL OR [PorDescuento] = @doPorDescuento) AND 
	(@iIdRazonExoneración IS NULL OR [IdRazonExoneración] = @iIdRazonExoneración) AND 
	(@iIdMoneda IS NULL OR [IdMoneda] = @iIdMoneda) AND 
	(@sDscDocumento IS NULL OR [DscDocumento] LIKE @sDscDocumento) AND 
	(@iIdReferencia IS NULL OR [IdReferencia] = @iIdReferencia) AND 
	(@iIdTipoReferencia IS NULL OR [IdTipoReferencia] = @iIdTipoReferencia) AND 
	(@sNumDocumentoReferencia IS NULL OR [NumDocumentoReferencia] LIKE @sNumDocumentoReferencia) AND 
	(@sDscRazonReferencia IS NULL OR [DscRazonReferencia] LIKE @sDscRazonReferencia) AND 
	(@iIndMdH IS NULL OR [IndMdH] = @iIndMdH) AND 
	(@iIndEstadoConta IS NULL OR [IndEstadoConta] = @iIndEstadoConta) AND 
	(@iNumPeriodosConta IS NULL OR [NumPeriodosConta] = @iNumPeriodosConta) AND 
	(@iIdRazonExonera IS NULL OR [IdRazonExonera] = @iIdRazonExonera)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCDocumentoElectronico'
-- utilizando la llave primaria. 
-- Recibe: @iIdDocumentoElectronico int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_Eliminar]
	@iIdDocumentoElectronico int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdDocumentoElectronico] = @iIdDocumentoElectronico


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdActiEonomica]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdActiEonomica int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdActiEonomica]
	@iIdActiEonomica int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdActiEonomica] = @iIdActiEonomica


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdCondicionVenta]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdCondicionVenta int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdCondicionVenta]
	@iIdCondicionVenta int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdCondicionVenta] = @iIdCondicionVenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdFormaPago]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdFormaPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdFormaPago]
	@iIdFormaPago int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdFormaPago] = @iIdFormaPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdMoneda]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdMoneda int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdMoneda]
	@iIdMoneda int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdMoneda] = @iIdMoneda


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdRazonExoneración]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdRazonExoneración int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdRazonExoneración]
	@iIdRazonExoneración int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdRazonExoneración] = @iIdRazonExoneración


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdReferencia]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdReferencia int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdReferencia]
	@iIdReferencia int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdReferencia] = @iIdReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdSocio]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdSocio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdSocio]
	@iIdSocio int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdSocio] = @iIdSocio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdTipoDocumento]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdTipoDocumento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdTipoDocumento]
	@iIdTipoDocumento int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdTipoDocumento] = @iIdTipoDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdTipoReferencia]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdTipoReferencia int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_EliminarTodo_FK_IdTipoReferencia]
	@iIdTipoReferencia int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdTipoReferencia] = @iIdTipoReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCDocumentoElectronico'
-- Recibe: @iIdActiEonomica int
-- Recibe: @iIdTipoDocumento int
-- Recibe: @sNumDocumento varchar(100)
-- Recibe: @daFecVencimiento datetime
-- Recibe: @iIdSocio int
-- Recibe: @iIdFormaPago int
-- Recibe: @iIdCondicionVenta int
-- Recibe: @seMailEnvio varchar(100)
-- Recibe: @doPorDescuento real
-- Recibe: @iIdRazonExoneración int
-- Recibe: @iIdMoneda int
-- Recibe: @sDscDocumento varchar(255)
-- Recibe: @iIdReferencia int
-- Recibe: @iIdTipoReferencia int
-- Recibe: @sNumDocumentoReferencia varchar(50)
-- Recibe: @sDscRazonReferencia varchar(255)
-- Recibe: @iIndMdH int
-- Recibe: @iIndEstadoConta int
-- Recibe: @iNumPeriodosConta int
-- Recibe: @iIdRazonExonera int
-- Retorna: @iIdDocumentoElectronico int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_Insertar]
	@iIdActiEonomica int,
	@iIdTipoDocumento int,
	@sNumDocumento varchar(100),
	@daFecVencimiento datetime,
	@iIdSocio int,
	@iIdFormaPago int,
	@iIdCondicionVenta int,
	@seMailEnvio varchar(100),
	@doPorDescuento real,
	@iIdRazonExoneración int,
	@iIdMoneda int,
	@sDscDocumento varchar(255),
	@iIdReferencia int,
	@iIdTipoReferencia int,
	@sNumDocumentoReferencia varchar(50),
	@sDscRazonReferencia varchar(255),
	@iIndMdH int,
	@iIndEstadoConta int,
	@iNumPeriodosConta int,
	@iIdRazonExonera int,
	@iIdDocumentoElectronico int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCDocumentoElectronico]
(
	[IdActiEonomica],
	[IdTipoDocumento],
	[NumDocumento],
	[FecVencimiento],
	[IdSocio],
	[IdFormaPago],
	[IdCondicionVenta],
	[eMailEnvio],
	[PorDescuento],
	[IdRazonExoneración],
	[IdMoneda],
	[DscDocumento],
	[IdReferencia],
	[IdTipoReferencia],
	[NumDocumentoReferencia],
	[DscRazonReferencia],
	[IndMdH],
	[IndEstadoConta],
	[NumPeriodosConta],
	[IdRazonExonera]
)
VALUES
(
	@iIdActiEonomica,
	@iIdTipoDocumento,
	@sNumDocumento,
	@daFecVencimiento,
	@iIdSocio,
	@iIdFormaPago,
	@iIdCondicionVenta,
	@seMailEnvio,
	@doPorDescuento,
	@iIdRazonExoneración,
	@iIdMoneda,
	@sDscDocumento,
	@iIdReferencia,
	@iIdTipoReferencia,
	@sNumDocumentoReferencia,
	@sDscRazonReferencia,
	@iIndMdH,
	@iIndEstadoConta,
	@iNumPeriodosConta,
	@iIdRazonExonera
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdDocumentoElectronico=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCDocumentoElectronico'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
ORDER BY 
	[IdDocumentoElectronico] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdActiEonomica_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdActiEonomica int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdActiEonomica_FK]
	@iIdActiEonomica int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdActiEonomica] = @iIdActiEonomica


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdCondicionVenta_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdCondicionVenta int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdCondicionVenta_FK]
	@iIdCondicionVenta int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdCondicionVenta] = @iIdCondicionVenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdFormaPago_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdFormaPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdFormaPago_FK]
	@iIdFormaPago int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdFormaPago] = @iIdFormaPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdMoneda_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdMoneda int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdMoneda_FK]
	@iIdMoneda int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdMoneda] = @iIdMoneda


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdRazonExoneración_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdRazonExoneración int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdRazonExoneración_FK]
	@iIdRazonExoneración int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdRazonExoneración] = @iIdRazonExoneración


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdReferencia_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdReferencia int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdReferencia_FK]
	@iIdReferencia int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdReferencia] = @iIdReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdSocio_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdSocio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdSocio_FK]
	@iIdSocio int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdSocio] = @iIdSocio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdTipoDocumento_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdTipoDocumento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdTipoDocumento_FK]
	@iIdTipoDocumento int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdTipoDocumento] = @iIdTipoDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdTipoReferencia_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCDocumentoElectronico'
-- basado en un campo llave primaria.
-- Recibe: @iIdTipoReferencia int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarTodos_Con_IdTipoReferencia_FK]
	@iIdTipoReferencia int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdTipoReferencia] = @iIdTipoReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCDocumentoElectronico'
-- basado en la llave primaria.
-- Recibe: @iIdDocumentoElectronico int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCDocumentoElectronico_SeleccionarUno]
	@iIdDocumentoElectronico int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCDocumentoElectronico]
WHERE
	[IdDocumentoElectronico] = @iIdDocumentoElectronico


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstado_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCEstado'
-- Recibe: @iIdEstado int
-- Recibe: @sDscEstado varchar(30)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstado_Actualizar]
	@iIdEstado int,
	@sDscEstado varchar(30),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCEstado]
SET 
	[DscEstado] = @sDscEstado
WHERE
	[IdEstado] = @iIdEstado


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstado_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCEstado'
-- Recibe: @iIdEstado int
-- Recibe: @sDscEstado varchar(30)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstado_Buscar]
	@iIdEstado int,
	@sDscEstado varchar(30),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCEstado] 
 WHERE 
	(@iIdEstado IS NULL OR [IdEstado] = @iIdEstado) AND 
	(@sDscEstado IS NULL OR [DscEstado] LIKE @sDscEstado)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstado_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCEstado'
-- utilizando la llave primaria. 
-- Recibe: @iIdEstado int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstado_Eliminar]
	@iIdEstado int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCEstado]
WHERE
	[IdEstado] = @iIdEstado


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstado_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCEstado'
-- Recibe: @sDscEstado varchar(30)
-- Retorna: @iIdEstado int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstado_Insertar]
	@sDscEstado varchar(30),
	@iIdEstado int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCEstado]
(
	[DscEstado]
)
VALUES
(
	@sDscEstado
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdEstado=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstado_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCEstado'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstado_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCEstado]
ORDER BY 
	[IdEstado] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstado_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCEstado'
-- basado en la llave primaria.
-- Recibe: @iIdEstado int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstado_SeleccionarUno]
	@iIdEstado int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCEstado]
WHERE
	[IdEstado] = @iIdEstado


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstadoPago_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCEstadoPago'
-- Recibe: @iIdEstadoPago int
-- Recibe: @sDscEstadoPago varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstadoPago_Actualizar]
	@iIdEstadoPago int,
	@sDscEstadoPago varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCEstadoPago]
SET 
	[DscEstadoPago] = @sDscEstadoPago
WHERE
	[IdEstadoPago] = @iIdEstadoPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstadoPago_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCEstadoPago'
-- Recibe: @iIdEstadoPago int
-- Recibe: @sDscEstadoPago varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstadoPago_Buscar]
	@iIdEstadoPago int,
	@sDscEstadoPago varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCEstadoPago] 
 WHERE 
	(@iIdEstadoPago IS NULL OR [IdEstadoPago] = @iIdEstadoPago) AND 
	(@sDscEstadoPago IS NULL OR [DscEstadoPago] LIKE @sDscEstadoPago)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstadoPago_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCEstadoPago'
-- utilizando la llave primaria. 
-- Recibe: @iIdEstadoPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstadoPago_Eliminar]
	@iIdEstadoPago int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCEstadoPago]
WHERE
	[IdEstadoPago] = @iIdEstadoPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstadoPago_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCEstadoPago'
-- Recibe: @sDscEstadoPago varchar(50)
-- Retorna: @iIdEstadoPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstadoPago_Insertar]
	@sDscEstadoPago varchar(50),
	@iIdEstadoPago int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCEstadoPago]
(
	[DscEstadoPago]
)
VALUES
(
	@sDscEstadoPago
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdEstadoPago=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstadoPago_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCEstadoPago'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstadoPago_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCEstadoPago]
ORDER BY 
	[IdEstadoPago] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCEstadoPago_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCEstadoPago'
-- basado en la llave primaria.
-- Recibe: @iIdEstadoPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCEstadoPago_SeleccionarUno]
	@iIdEstadoPago int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCEstadoPago]
WHERE
	[IdEstadoPago] = @iIdEstadoPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCFormaPago_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCFormaPago'
-- Recibe: @iIdFormaPago int
-- Recibe: @sDscFormaPago varchar(50)
-- Recibe: @sCodEstado char(1)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCFormaPago_Actualizar]
	@iIdFormaPago int,
	@sDscFormaPago varchar(50),
	@sCodEstado char(1),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCFormaPago]
SET 
	[DscFormaPago] = @sDscFormaPago,
	[CodEstado] = @sCodEstado
WHERE
	[IdFormaPago] = @iIdFormaPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCFormaPago_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCFormaPago'
-- Recibe: @iIdFormaPago int
-- Recibe: @sDscFormaPago varchar(50)
-- Recibe: @sCodEstado char(1)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCFormaPago_Buscar]
	@iIdFormaPago int,
	@sDscFormaPago varchar(50),
	@sCodEstado char(1),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCFormaPago] 
 WHERE 
	(@iIdFormaPago IS NULL OR [IdFormaPago] = @iIdFormaPago) AND 
	(@sDscFormaPago IS NULL OR [DscFormaPago] LIKE @sDscFormaPago) AND 
	(@sCodEstado IS NULL OR [CodEstado] LIKE @sCodEstado)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCFormaPago_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCFormaPago'
-- utilizando la llave primaria. 
-- Recibe: @iIdFormaPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCFormaPago_Eliminar]
	@iIdFormaPago int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCFormaPago]
WHERE
	[IdFormaPago] = @iIdFormaPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCFormaPago_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCFormaPago'
-- Recibe: @sDscFormaPago varchar(50)
-- Recibe: @sCodEstado char(1)
-- Retorna: @iIdFormaPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCFormaPago_Insertar]
	@sDscFormaPago varchar(50),
	@sCodEstado char(1),
	@iIdFormaPago int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCFormaPago]
(
	[DscFormaPago],
	[CodEstado]
)
VALUES
(
	@sDscFormaPago,
	@sCodEstado
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdFormaPago=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCFormaPago_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCFormaPago'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCFormaPago_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCFormaPago]
ORDER BY 
	[IdFormaPago] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCFormaPago_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCFormaPago'
-- basado en la llave primaria.
-- Recibe: @iIdFormaPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCFormaPago_SeleccionarUno]
	@iIdFormaPago int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCFormaPago]
WHERE
	[IdFormaPago] = @iIdFormaPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCIdentificacionTipo_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCIdentificacionTipo'
-- Recibe: @iId_TipoIdentif int
-- Recibe: @sDsc_TipoIdentif varchar(60)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCIdentificacionTipo_Actualizar]
	@iId_TipoIdentif int,
	@sDsc_TipoIdentif varchar(60),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCIdentificacionTipo]
SET 
	[Dsc_TipoIdentif] = @sDsc_TipoIdentif
WHERE
	[Id_TipoIdentif] = @iId_TipoIdentif


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCIdentificacionTipo_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCIdentificacionTipo'
-- Recibe: @iId_TipoIdentif int
-- Recibe: @sDsc_TipoIdentif varchar(60)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCIdentificacionTipo_Buscar]
	@iId_TipoIdentif int,
	@sDsc_TipoIdentif varchar(60),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCIdentificacionTipo] 
 WHERE 
	(@iId_TipoIdentif IS NULL OR [Id_TipoIdentif] = @iId_TipoIdentif) AND 
	(@sDsc_TipoIdentif IS NULL OR [Dsc_TipoIdentif] LIKE @sDsc_TipoIdentif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCIdentificacionTipo_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCIdentificacionTipo'
-- utilizando la llave primaria. 
-- Recibe: @iId_TipoIdentif int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCIdentificacionTipo_Eliminar]
	@iId_TipoIdentif int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCIdentificacionTipo]
WHERE
	[Id_TipoIdentif] = @iId_TipoIdentif


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCIdentificacionTipo_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCIdentificacionTipo'
-- Recibe: @sDsc_TipoIdentif varchar(60)
-- Retorna: @iId_TipoIdentif int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCIdentificacionTipo_Insertar]
	@sDsc_TipoIdentif varchar(60),
	@iId_TipoIdentif int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCIdentificacionTipo]
(
	[Dsc_TipoIdentif]
)
VALUES
(
	@sDsc_TipoIdentif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iId_TipoIdentif=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCIdentificacionTipo_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCIdentificacionTipo'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCIdentificacionTipo_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCIdentificacionTipo]
ORDER BY 
	[Id_TipoIdentif] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCIdentificacionTipo_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCIdentificacionTipo'
-- basado en la llave primaria.
-- Recibe: @iId_TipoIdentif int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCIdentificacionTipo_SeleccionarUno]
	@iId_TipoIdentif int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCIdentificacionTipo]
WHERE
	[Id_TipoIdentif] = @iId_TipoIdentif


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCImporteIVA_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCImporteIVA'
-- Recibe: @iIdImporteIVA int
-- Recibe: @sDscTarifaria varchar(50)
-- Recibe: @doPorTarifa real
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCImporteIVA_Actualizar]
	@iIdImporteIVA int,
	@sDscTarifaria varchar(50),
	@doPorTarifa real,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCImporteIVA]
SET 
	[DscTarifaria] = @sDscTarifaria,
	[PorTarifa] = @doPorTarifa
WHERE
	[IdImporteIVA] = @iIdImporteIVA


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCImporteIVA_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCImporteIVA'
-- Recibe: @iIdImporteIVA int
-- Recibe: @sDscTarifaria varchar(50)
-- Recibe: @doPorTarifa real
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCImporteIVA_Buscar]
	@iIdImporteIVA int,
	@sDscTarifaria varchar(50),
	@doPorTarifa real,
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCImporteIVA] 
 WHERE 
	(@iIdImporteIVA IS NULL OR [IdImporteIVA] = @iIdImporteIVA) AND 
	(@sDscTarifaria IS NULL OR [DscTarifaria] LIKE @sDscTarifaria) AND 
	(@doPorTarifa IS NULL OR [PorTarifa] = @doPorTarifa)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCImporteIVA_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCImporteIVA'
-- utilizando la llave primaria. 
-- Recibe: @iIdImporteIVA int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCImporteIVA_Eliminar]
	@iIdImporteIVA int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCImporteIVA]
WHERE
	[IdImporteIVA] = @iIdImporteIVA


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCImporteIVA_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCImporteIVA'
-- Recibe: @sDscTarifaria varchar(50)
-- Recibe: @doPorTarifa real
-- Retorna: @iIdImporteIVA int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCImporteIVA_Insertar]
	@sDscTarifaria varchar(50),
	@doPorTarifa real,
	@iIdImporteIVA int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCImporteIVA]
(
	[DscTarifaria],
	[PorTarifa]
)
VALUES
(
	@sDscTarifaria,
	@doPorTarifa
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdImporteIVA=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCImporteIVA_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCImporteIVA'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCImporteIVA_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCImporteIVA]
ORDER BY 
	[IdImporteIVA] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCImporteIVA_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCImporteIVA'
-- basado en la llave primaria.
-- Recibe: @iIdImporteIVA int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCImporteIVA_SeleccionarUno]
	@iIdImporteIVA int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCImporteIVA]
WHERE
	[IdImporteIVA] = @iIdImporteIVA


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCImpuestosBoS'
-- Recibe: @iIdImpuestoBoS int
-- Recibe: @iIdTipoImpuesto int
-- Recibe: @iIdBoS int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_Actualizar]
	@iIdImpuestoBoS int,
	@iIdTipoImpuesto int,
	@iIdBoS int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCImpuestosBoS]
SET 
	[IdTipoImpuesto] = @iIdTipoImpuesto,
	[IdBoS] = @iIdBoS,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion
WHERE
	[IdImpuestoBoS] = @iIdImpuestoBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_ActualizarTodos_Con_IdBoS_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCImpuestosBoS'.
-- Actualiza el campo [IdBoS] con el valor anterior de@iIdBoS  al valor @iIdBoS
-- Recibe: @iIdBoS int
-- Recibe: @iIdBoSOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_ActualizarTodos_Con_IdBoS_FK]
	@iIdBoS int,
	@iIdBoSOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCImpuestosBoS]
SET
	[IdBoS] = @iIdBoS
WHERE
	[IdBoS] = @iIdBoSOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_ActualizarTodos_Con_IdTipoImpuesto_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCImpuestosBoS'.
-- Actualiza el campo [IdTipoImpuesto] con el valor anterior de@iIdTipoImpuesto  al valor @iIdTipoImpuesto
-- Recibe: @iIdTipoImpuesto int
-- Recibe: @iIdTipoImpuestoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_ActualizarTodos_Con_IdTipoImpuesto_FK]
	@iIdTipoImpuesto int,
	@iIdTipoImpuestoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCImpuestosBoS]
SET
	[IdTipoImpuesto] = @iIdTipoImpuesto
WHERE
	[IdTipoImpuesto] = @iIdTipoImpuestoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCImpuestosBoS'
-- Recibe: @iIdImpuestoBoS int
-- Recibe: @iIdTipoImpuesto int
-- Recibe: @iIdBoS int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_Buscar]
	@iIdImpuestoBoS int,
	@iIdTipoImpuesto int,
	@iIdBoS int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCImpuestosBoS] 
 WHERE 
	(@iIdImpuestoBoS IS NULL OR [IdImpuestoBoS] = @iIdImpuestoBoS) AND 
	(@iIdTipoImpuesto IS NULL OR [IdTipoImpuesto] = @iIdTipoImpuesto) AND 
	(@iIdBoS IS NULL OR [IdBoS] = @iIdBoS) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCImpuestosBoS'
-- utilizando la llave primaria. 
-- Recibe: @iIdImpuestoBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_Eliminar]
	@iIdImpuestoBoS int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCImpuestosBoS]
WHERE
	[IdImpuestoBoS] = @iIdImpuestoBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_EliminarTodo_FK_IdBoS]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCImpuestosBoS'
-- basado en un campo llave primaria.
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_EliminarTodo_FK_IdBoS]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCImpuestosBoS]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_EliminarTodo_FK_IdTipoImpuesto]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCImpuestosBoS'
-- basado en un campo llave primaria.
-- Recibe: @iIdTipoImpuesto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_EliminarTodo_FK_IdTipoImpuesto]
	@iIdTipoImpuesto int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCImpuestosBoS]
WHERE
	[IdTipoImpuesto] = @iIdTipoImpuesto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCImpuestosBoS'
-- Recibe: @iIdTipoImpuesto int
-- Recibe: @iIdBoS int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iIdImpuestoBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_Insertar]
	@iIdTipoImpuesto int,
	@iIdBoS int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@iIdImpuestoBoS int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCImpuestosBoS]
(
	[IdTipoImpuesto],
	[IdBoS],
	[FecCreacion],
	[UsrCreacion]
)
VALUES
(
	@iIdTipoImpuesto,
	@iIdBoS,
	@daFecCreacion,
	@sUsrCreacion
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdImpuestoBoS=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCImpuestosBoS'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCImpuestosBoS]
ORDER BY 
	[IdImpuestoBoS] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_SeleccionarTodos_Con_IdBoS_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCImpuestosBoS'
-- basado en un campo llave primaria.
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_SeleccionarTodos_Con_IdBoS_FK]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCImpuestosBoS]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_SeleccionarTodos_Con_IdTipoImpuesto_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCImpuestosBoS'
-- basado en un campo llave primaria.
-- Recibe: @iIdTipoImpuesto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_SeleccionarTodos_Con_IdTipoImpuesto_FK]
	@iIdTipoImpuesto int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCImpuestosBoS]
WHERE
	[IdTipoImpuesto] = @iIdTipoImpuesto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCImpuestosBoS_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCImpuestosBoS'
-- basado en la llave primaria.
-- Recibe: @iIdImpuestoBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCImpuestosBoS_SeleccionarUno]
	@iIdImpuestoBoS int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCImpuestosBoS]
WHERE
	[IdImpuestoBoS] = @iIdImpuestoBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCInfoAdicional_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCInfoAdicional'
-- Recibe: @iIdInfoAdicional int
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @sDscInformacion varchar(50)
-- Recibe: @sValinformacion varchar(150)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCInfoAdicional_Actualizar]
	@iIdInfoAdicional int,
	@iIdDocumentoElectronico int,
	@sDscInformacion varchar(50),
	@sValinformacion varchar(150),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCInfoAdicional]
SET 
	[IdDocumentoElectronico] = @iIdDocumentoElectronico,
	[DscInformacion] = @sDscInformacion,
	[Valinformacion] = @sValinformacion,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion
WHERE
	[IdInfoAdicional] = @iIdInfoAdicional


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCInfoAdicional_ActualizarTodos_Con_IdDocumentoElectronico_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCInfoAdicional'.
-- Actualiza el campo [IdDocumentoElectronico] con el valor anterior de@iIdDocumentoElectronico  al valor @iIdDocumentoElectronico
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @iIdDocumentoElectronicoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCInfoAdicional_ActualizarTodos_Con_IdDocumentoElectronico_FK]
	@iIdDocumentoElectronico int,
	@iIdDocumentoElectronicoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCInfoAdicional]
SET
	[IdDocumentoElectronico] = @iIdDocumentoElectronico
WHERE
	[IdDocumentoElectronico] = @iIdDocumentoElectronicoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCInfoAdicional_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCInfoAdicional'
-- Recibe: @iIdInfoAdicional int
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @sDscInformacion varchar(50)
-- Recibe: @sValinformacion varchar(150)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCInfoAdicional_Buscar]
	@iIdInfoAdicional int,
	@iIdDocumentoElectronico int,
	@sDscInformacion varchar(50),
	@sValinformacion varchar(150),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCInfoAdicional] 
 WHERE 
	(@iIdInfoAdicional IS NULL OR [IdInfoAdicional] = @iIdInfoAdicional) AND 
	(@iIdDocumentoElectronico IS NULL OR [IdDocumentoElectronico] = @iIdDocumentoElectronico) AND 
	(@sDscInformacion IS NULL OR [DscInformacion] LIKE @sDscInformacion) AND 
	(@sValinformacion IS NULL OR [Valinformacion] LIKE @sValinformacion) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCInfoAdicional_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCInfoAdicional'
-- utilizando la llave primaria. 
-- Recibe: @iIdInfoAdicional int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCInfoAdicional_Eliminar]
	@iIdInfoAdicional int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCInfoAdicional]
WHERE
	[IdInfoAdicional] = @iIdInfoAdicional


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCInfoAdicional_EliminarTodo_FK_IdDocumentoElectronico]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCInfoAdicional'
-- basado en un campo llave primaria.
-- Recibe: @iIdDocumentoElectronico int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCInfoAdicional_EliminarTodo_FK_IdDocumentoElectronico]
	@iIdDocumentoElectronico int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCInfoAdicional]
WHERE
	[IdDocumentoElectronico] = @iIdDocumentoElectronico


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCInfoAdicional_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCInfoAdicional'
-- Recibe: @iIdInfoAdicional int
-- Recibe: @iIdDocumentoElectronico int
-- Recibe: @sDscInformacion varchar(50)
-- Recibe: @sValinformacion varchar(150)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCInfoAdicional_Insertar]
	@iIdInfoAdicional int,
	@iIdDocumentoElectronico int,
	@sDscInformacion varchar(50),
	@sValinformacion varchar(150),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCInfoAdicional]
(
	[IdInfoAdicional],
	[IdDocumentoElectronico],
	[DscInformacion],
	[Valinformacion],
	[FecCreacion],
	[UsrCreacion]
)
VALUES
(
	@iIdInfoAdicional,
	@iIdDocumentoElectronico,
	@sDscInformacion,
	@sValinformacion,
	@daFecCreacion,
	@sUsrCreacion
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCInfoAdicional_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCInfoAdicional'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCInfoAdicional_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCInfoAdicional]
ORDER BY 
	[IdInfoAdicional] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCInfoAdicional_SeleccionarTodos_Con_IdDocumentoElectronico_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCInfoAdicional'
-- basado en un campo llave primaria.
-- Recibe: @iIdDocumentoElectronico int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCInfoAdicional_SeleccionarTodos_Con_IdDocumentoElectronico_FK]
	@iIdDocumentoElectronico int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCInfoAdicional]
WHERE
	[IdDocumentoElectronico] = @iIdDocumentoElectronico


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCInfoAdicional_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCInfoAdicional'
-- basado en la llave primaria.
-- Recibe: @iIdInfoAdicional int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCInfoAdicional_SeleccionarUno]
	@iIdInfoAdicional int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCInfoAdicional]
WHERE
	[IdInfoAdicional] = @iIdInfoAdicional


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCMaestro'
-- Recibe: @iIdCuenta int
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdBoS int
-- Recibe: @fCantidad float(53)
-- Recibe: @sTipMovimiento char(1)
-- Recibe: @iIdSocio int
-- Recibe: @daFecRegistro datetime
-- Recibe: @daFecInicioMorosidad datetime
-- Recibe: @daFecExpiracion datetime
-- Recibe: @iIdEstado int
-- Recibe: @sEstadoCobro varchar(2)
-- Recibe: @sIdLlaveExterna varchar(50)
-- Recibe: @sDscCargo varchar(200)
-- Recibe: @iIdCuentaAnterior int
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_Actualizar]
	@iIdCuenta int,
	@iIdAuxiliar int,
	@iIdBoS int,
	@fCantidad float(53),
	@sTipMovimiento char(1),
	@iIdSocio int,
	@daFecRegistro datetime,
	@daFecInicioMorosidad datetime,
	@daFecExpiracion datetime,
	@iIdEstado int,
	@sEstadoCobro varchar(2),
	@sIdLlaveExterna varchar(50),
	@sDscCargo varchar(200),
	@iIdCuentaAnterior int,
	@sUsrCreacion varchar(50),
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMaestro]
SET 
	[IdAuxiliar] = @iIdAuxiliar,
	[IdBoS] = @iIdBoS,
	[Cantidad] = @fCantidad,
	[TipMovimiento] = @sTipMovimiento,
	[IdSocio] = @iIdSocio,
	[FecRegistro] = @daFecRegistro,
	[FecInicioMorosidad] = @daFecInicioMorosidad,
	[FecExpiracion] = @daFecExpiracion,
	[IdEstado] = @iIdEstado,
	[EstadoCobro] = @sEstadoCobro,
	[IdLlaveExterna] = @sIdLlaveExterna,
	[DscCargo] = @sDscCargo,
	[IdCuentaAnterior] = @iIdCuentaAnterior,
	[UsrCreacion] = @sUsrCreacion,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdCuenta] = @iIdCuenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCMaestro'.
-- Actualiza el campo [IdAuxiliar] con el valor anterior de@iIdAuxiliar  al valor @iIdAuxiliar
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdAuxiliarOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iIdAuxiliarOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMaestro]
SET
	[IdAuxiliar] = @iIdAuxiliar
WHERE
	[IdAuxiliar] = @iIdAuxiliarOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdBoS_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCMaestro'.
-- Actualiza el campo [IdBoS] con el valor anterior de@iIdBoS  al valor @iIdBoS
-- Recibe: @iIdBoS int
-- Recibe: @iIdBoSOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdBoS_FK]
	@iIdBoS int,
	@iIdBoSOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMaestro]
SET
	[IdBoS] = @iIdBoS
WHERE
	[IdBoS] = @iIdBoSOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdCuentaAnterior_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCMaestro'.
-- Actualiza el campo [IdCuentaAnterior] con el valor anterior de@iIdCuentaAnterior  al valor @iIdCuentaAnterior
-- Recibe: @iIdCuentaAnterior int
-- Recibe: @iIdCuentaAnteriorOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdCuentaAnterior_FK]
	@iIdCuentaAnterior int,
	@iIdCuentaAnteriorOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMaestro]
SET
	[IdCuentaAnterior] = @iIdCuentaAnterior
WHERE
	[IdCuentaAnterior] = @iIdCuentaAnteriorOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdEstado_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCMaestro'.
-- Actualiza el campo [IdEstado] con el valor anterior de@iIdEstado  al valor @iIdEstado
-- Recibe: @iIdEstado int
-- Recibe: @iIdEstadoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdEstado_FK]
	@iIdEstado int,
	@iIdEstadoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMaestro]
SET
	[IdEstado] = @iIdEstado
WHERE
	[IdEstado] = @iIdEstadoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdSocio_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCMaestro'.
-- Actualiza el campo [IdSocio] con el valor anterior de@iIdSocio  al valor @iIdSocio
-- Recibe: @iIdSocio int
-- Recibe: @iIdSocioOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_ActualizarTodos_Con_IdSocio_FK]
	@iIdSocio int,
	@iIdSocioOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMaestro]
SET
	[IdSocio] = @iIdSocio
WHERE
	[IdSocio] = @iIdSocioOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCMaestro'
-- Recibe: @iIdCuenta int
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdBoS int
-- Recibe: @fCantidad float(53)
-- Recibe: @sTipMovimiento char(1)
-- Recibe: @iIdSocio int
-- Recibe: @daFecRegistro datetime
-- Recibe: @daFecInicioMorosidad datetime
-- Recibe: @daFecExpiracion datetime
-- Recibe: @iIdEstado int
-- Recibe: @sEstadoCobro varchar(2)
-- Recibe: @sIdLlaveExterna varchar(50)
-- Recibe: @sDscCargo varchar(200)
-- Recibe: @iIdCuentaAnterior int
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_Buscar]
	@iIdCuenta int,
	@iIdAuxiliar int,
	@iIdBoS int,
	@fCantidad float(53),
	@sTipMovimiento char(1),
	@iIdSocio int,
	@daFecRegistro datetime,
	@daFecInicioMorosidad datetime,
	@daFecExpiracion datetime,
	@iIdEstado int,
	@sEstadoCobro varchar(2),
	@sIdLlaveExterna varchar(50),
	@sDscCargo varchar(200),
	@iIdCuentaAnterior int,
	@sUsrCreacion varchar(50),
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCMaestro] 
 WHERE 
	(@iIdCuenta IS NULL OR [IdCuenta] = @iIdCuenta) AND 
	(@iIdAuxiliar IS NULL OR [IdAuxiliar] = @iIdAuxiliar) AND 
	(@iIdBoS IS NULL OR [IdBoS] = @iIdBoS) AND 
	(@fCantidad IS NULL OR [Cantidad] = @fCantidad) AND 
	(@sTipMovimiento IS NULL OR [TipMovimiento] LIKE @sTipMovimiento) AND 
	(@iIdSocio IS NULL OR [IdSocio] = @iIdSocio) AND 
	(@daFecRegistro IS NULL OR [FecRegistro] >= @daFecRegistro) AND 
	(@daFecInicioMorosidad IS NULL OR [FecInicioMorosidad] >= @daFecInicioMorosidad) AND 
	(@daFecExpiracion IS NULL OR [FecExpiracion] >= @daFecExpiracion) AND 
	(@iIdEstado IS NULL OR [IdEstado] = @iIdEstado) AND 
	(@sEstadoCobro IS NULL OR [EstadoCobro] LIKE @sEstadoCobro) AND 
	(@sIdLlaveExterna IS NULL OR [IdLlaveExterna] LIKE @sIdLlaveExterna) AND 
	(@sDscCargo IS NULL OR [DscCargo] LIKE @sDscCargo) AND 
	(@iIdCuentaAnterior IS NULL OR [IdCuentaAnterior] = @iIdCuentaAnterior) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCMaestro'
-- utilizando la llave primaria. 
-- Recibe: @iIdCuenta int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_Eliminar]
	@iIdCuenta int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCMaestro]
WHERE
	[IdCuenta] = @iIdCuenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdAuxiliar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdAuxiliar]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCMaestro]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdBoS]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdBoS]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCMaestro]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdCuentaAnterior]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdCuentaAnterior int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdCuentaAnterior]
	@iIdCuentaAnterior int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCMaestro]
WHERE
	[IdCuentaAnterior] = @iIdCuentaAnterior


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdEstado]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdEstado int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdEstado]
	@iIdEstado int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCMaestro]
WHERE
	[IdEstado] = @iIdEstado


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdSocio]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdSocio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_EliminarTodo_FK_IdSocio]
	@iIdSocio int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCMaestro]
WHERE
	[IdSocio] = @iIdSocio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCMaestro'
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdBoS int
-- Recibe: @fCantidad float(53)
-- Recibe: @sTipMovimiento char(1)
-- Recibe: @iIdSocio int
-- Recibe: @daFecRegistro datetime
-- Recibe: @daFecInicioMorosidad datetime
-- Recibe: @daFecExpiracion datetime
-- Recibe: @iIdEstado int
-- Recibe: @sEstadoCobro varchar(2)
-- Recibe: @sIdLlaveExterna varchar(50)
-- Recibe: @sDscCargo varchar(200)
-- Recibe: @iIdCuentaAnterior int
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iIdCuenta int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_Insertar]
	@iIdAuxiliar int,
	@iIdBoS int,
	@fCantidad float(53),
	@sTipMovimiento char(1),
	@iIdSocio int,
	@daFecRegistro datetime,
	@daFecInicioMorosidad datetime,
	@daFecExpiracion datetime,
	@iIdEstado int,
	@sEstadoCobro varchar(2),
	@sIdLlaveExterna varchar(50),
	@sDscCargo varchar(200),
	@iIdCuentaAnterior int,
	@sUsrCreacion varchar(50),
	@sUsrUltModif varchar(50),
	@iIdCuenta int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCMaestro]
(
	[IdAuxiliar],
	[IdBoS],
	[Cantidad],
	[TipMovimiento],
	[IdSocio],
	[FecRegistro],
	[FecInicioMorosidad],
	[FecExpiracion],
	[IdEstado],
	[EstadoCobro],
	[IdLlaveExterna],
	[DscCargo],
	[IdCuentaAnterior],
	[UsrCreacion],
	[UsrUltModif]
)
VALUES
(
	@iIdAuxiliar,
	@iIdBoS,
	@fCantidad,
	@sTipMovimiento,
	@iIdSocio,
	@daFecRegistro,
	@daFecInicioMorosidad,
	@daFecExpiracion,
	@iIdEstado,
	@sEstadoCobro,
	@sIdLlaveExterna,
	@sDscCargo,
	@iIdCuentaAnterior,
	@sUsrCreacion,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdCuenta=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCMaestro'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCMaestro]
ORDER BY 
	[IdCuenta] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCMaestro]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdBoS_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdBoS int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdBoS_FK]
	@iIdBoS int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCMaestro]
WHERE
	[IdBoS] = @iIdBoS


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdCuentaAnterior_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdCuentaAnterior int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdCuentaAnterior_FK]
	@iIdCuentaAnterior int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCMaestro]
WHERE
	[IdCuentaAnterior] = @iIdCuentaAnterior


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdEstado_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdEstado int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdEstado_FK]
	@iIdEstado int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCMaestro]
WHERE
	[IdEstado] = @iIdEstado


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdSocio_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCMaestro'
-- basado en un campo llave primaria.
-- Recibe: @iIdSocio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_SeleccionarTodos_Con_IdSocio_FK]
	@iIdSocio int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCMaestro]
WHERE
	[IdSocio] = @iIdSocio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMaestro_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCMaestro'
-- basado en la llave primaria.
-- Recibe: @iIdCuenta int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMaestro_SeleccionarUno]
	@iIdCuenta int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCMaestro]
WHERE
	[IdCuenta] = @iIdCuenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMonedas_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCMonedas'
-- Recibe: @iIdMoneda int
-- Recibe: @sDscMoneda varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMonedas_Actualizar]
	@iIdMoneda int,
	@sDscMoneda varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMonedas]
SET 
	[DscMoneda] = @sDscMoneda,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdMoneda] = @iIdMoneda


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMonedas_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCMonedas'
-- Recibe: @iIdMoneda int
-- Recibe: @sDscMoneda varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMonedas_Buscar]
	@iIdMoneda int,
	@sDscMoneda varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCMonedas] 
 WHERE 
	(@iIdMoneda IS NULL OR [IdMoneda] = @iIdMoneda) AND 
	(@sDscMoneda IS NULL OR [DscMoneda] LIKE @sDscMoneda) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMonedas_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCMonedas'
-- utilizando la llave primaria. 
-- Recibe: @iIdMoneda int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMonedas_Eliminar]
	@iIdMoneda int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCMonedas]
WHERE
	[IdMoneda] = @iIdMoneda


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMonedas_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCMonedas'
-- Recibe: @sDscMoneda varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iIdMoneda int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMonedas_Insertar]
	@sDscMoneda varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iIdMoneda int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCMonedas]
(
	[DscMoneda],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@sDscMoneda,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdMoneda=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMonedas_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCMonedas'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMonedas_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCMonedas]
ORDER BY 
	[IdMoneda] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMonedas_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCMonedas'
-- basado en la llave primaria.
-- Recibe: @iIdMoneda int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMonedas_SeleccionarUno]
	@iIdMoneda int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCMonedas]
WHERE
	[IdMoneda] = @iIdMoneda


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCMovimientoCuenta'
-- Recibe: @iIdMovimiento int
-- Recibe: @iIdCuenta int
-- Recibe: @curMonto money
-- Recibe: @daFechaRegistroMovimiento datetime
-- Recibe: @iIdFormaPago int
-- Recibe: @iIdEstadoPago int
-- Recibe: @sNum_Documento varchar(50)
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDsc_Detalle varchar(200)
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @sUsrUltModif varchar(50)
-- Recibe: @daFecUltModif datetime
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_Actualizar]
	@iIdMovimiento int,
	@iIdCuenta int,
	@curMonto money,
	@daFechaRegistroMovimiento datetime,
	@iIdFormaPago int,
	@iIdEstadoPago int,
	@sNum_Documento varchar(50),
	@iIdAuxiliar int,
	@sDsc_Detalle varchar(200),
	@sUsrCreacion varchar(50),
	@sUsrUltModif varchar(50),
	@daFecUltModif datetime,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMovimientoCuenta]
SET 
	[IdCuenta] = @iIdCuenta,
	[Monto] = @curMonto,
	[FechaRegistroMovimiento] = @daFechaRegistroMovimiento,
	[IdFormaPago] = @iIdFormaPago,
	[IdEstadoPago] = @iIdEstadoPago,
	[Num_Documento] = @sNum_Documento,
	[IdAuxiliar] = @iIdAuxiliar,
	[Dsc_Detalle] = @sDsc_Detalle,
	[UsrCreacion] = @sUsrCreacion,
	[UsrUltModif] = @sUsrUltModif,
	[FecUltModif] = @daFecUltModif
WHERE
	[IdMovimiento] = @iIdMovimiento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_ActualizarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCMovimientoCuenta'.
-- Actualiza el campo [IdAuxiliar] con el valor anterior de@iIdAuxiliar  al valor @iIdAuxiliar
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdAuxiliarOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_ActualizarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iIdAuxiliarOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMovimientoCuenta]
SET
	[IdAuxiliar] = @iIdAuxiliar
WHERE
	[IdAuxiliar] = @iIdAuxiliarOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_ActualizarTodos_Con_IdCuenta_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCMovimientoCuenta'.
-- Actualiza el campo [IdCuenta] con el valor anterior de@iIdCuenta  al valor @iIdCuenta
-- Recibe: @iIdCuenta int
-- Recibe: @iIdCuentaOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_ActualizarTodos_Con_IdCuenta_FK]
	@iIdCuenta int,
	@iIdCuentaOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMovimientoCuenta]
SET
	[IdCuenta] = @iIdCuenta
WHERE
	[IdCuenta] = @iIdCuentaOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_ActualizarTodos_Con_IdEstadoPago_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCMovimientoCuenta'.
-- Actualiza el campo [IdEstadoPago] con el valor anterior de@iIdEstadoPago  al valor @iIdEstadoPago
-- Recibe: @iIdEstadoPago int
-- Recibe: @iIdEstadoPagoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_ActualizarTodos_Con_IdEstadoPago_FK]
	@iIdEstadoPago int,
	@iIdEstadoPagoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMovimientoCuenta]
SET
	[IdEstadoPago] = @iIdEstadoPago
WHERE
	[IdEstadoPago] = @iIdEstadoPagoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_ActualizarTodos_Con_IdFormaPago_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCMovimientoCuenta'.
-- Actualiza el campo [IdFormaPago] con el valor anterior de@iIdFormaPago  al valor @iIdFormaPago
-- Recibe: @iIdFormaPago int
-- Recibe: @iIdFormaPagoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_ActualizarTodos_Con_IdFormaPago_FK]
	@iIdFormaPago int,
	@iIdFormaPagoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCMovimientoCuenta]
SET
	[IdFormaPago] = @iIdFormaPago
WHERE
	[IdFormaPago] = @iIdFormaPagoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCMovimientoCuenta'
-- Recibe: @iIdMovimiento int
-- Recibe: @iIdCuenta int
-- Recibe: @curMonto money
-- Recibe: @daFechaRegistroMovimiento datetime
-- Recibe: @iIdFormaPago int
-- Recibe: @iIdEstadoPago int
-- Recibe: @sNum_Documento varchar(50)
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDsc_Detalle varchar(200)
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @sUsrUltModif varchar(50)
-- Recibe: @daFecUltModif datetime
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_Buscar]
	@iIdMovimiento int,
	@iIdCuenta int,
	@curMonto money,
	@daFechaRegistroMovimiento datetime,
	@iIdFormaPago int,
	@iIdEstadoPago int,
	@sNum_Documento varchar(50),
	@iIdAuxiliar int,
	@sDsc_Detalle varchar(200),
	@sUsrCreacion varchar(50),
	@sUsrUltModif varchar(50),
	@daFecUltModif datetime,
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCMovimientoCuenta] 
 WHERE 
	(@iIdMovimiento IS NULL OR [IdMovimiento] = @iIdMovimiento) AND 
	(@iIdCuenta IS NULL OR [IdCuenta] = @iIdCuenta) AND 
	(@curMonto IS NULL OR [Monto] = @curMonto) AND 
	(@daFechaRegistroMovimiento IS NULL OR [FechaRegistroMovimiento] >= @daFechaRegistroMovimiento) AND 
	(@iIdFormaPago IS NULL OR [IdFormaPago] = @iIdFormaPago) AND 
	(@iIdEstadoPago IS NULL OR [IdEstadoPago] = @iIdEstadoPago) AND 
	(@sNum_Documento IS NULL OR [Num_Documento] LIKE @sNum_Documento) AND 
	(@iIdAuxiliar IS NULL OR [IdAuxiliar] = @iIdAuxiliar) AND 
	(@sDsc_Detalle IS NULL OR [Dsc_Detalle] LIKE @sDsc_Detalle) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCMovimientoCuenta'
-- utilizando la llave primaria. 
-- Recibe: @iIdMovimiento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_Eliminar]
	@iIdMovimiento int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdMovimiento] = @iIdMovimiento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_EliminarTodo_FK_IdAuxiliar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCMovimientoCuenta'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_EliminarTodo_FK_IdAuxiliar]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_EliminarTodo_FK_IdCuenta]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCMovimientoCuenta'
-- basado en un campo llave primaria.
-- Recibe: @iIdCuenta int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_EliminarTodo_FK_IdCuenta]
	@iIdCuenta int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdCuenta] = @iIdCuenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_EliminarTodo_FK_IdEstadoPago]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCMovimientoCuenta'
-- basado en un campo llave primaria.
-- Recibe: @iIdEstadoPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_EliminarTodo_FK_IdEstadoPago]
	@iIdEstadoPago int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdEstadoPago] = @iIdEstadoPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_EliminarTodo_FK_IdFormaPago]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCMovimientoCuenta'
-- basado en un campo llave primaria.
-- Recibe: @iIdFormaPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_EliminarTodo_FK_IdFormaPago]
	@iIdFormaPago int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdFormaPago] = @iIdFormaPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCMovimientoCuenta'
-- Recibe: @iIdCuenta int
-- Recibe: @curMonto money
-- Recibe: @daFechaRegistroMovimiento datetime
-- Recibe: @iIdFormaPago int
-- Recibe: @iIdEstadoPago int
-- Recibe: @sNum_Documento varchar(50)
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDsc_Detalle varchar(200)
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @sUsrUltModif varchar(50)
-- Recibe: @daFecUltModif datetime
-- Retorna: @iIdMovimiento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_Insertar]
	@iIdCuenta int,
	@curMonto money,
	@daFechaRegistroMovimiento datetime,
	@iIdFormaPago int,
	@iIdEstadoPago int,
	@sNum_Documento varchar(50),
	@iIdAuxiliar int,
	@sDsc_Detalle varchar(200),
	@sUsrCreacion varchar(50),
	@sUsrUltModif varchar(50),
	@daFecUltModif datetime,
	@iIdMovimiento int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCMovimientoCuenta]
(
	[IdCuenta],
	[Monto],
	[FechaRegistroMovimiento],
	[IdFormaPago],
	[IdEstadoPago],
	[Num_Documento],
	[IdAuxiliar],
	[Dsc_Detalle],
	[UsrCreacion],
	[UsrUltModif],
	[FecUltModif]
)
VALUES
(
	@iIdCuenta,
	@curMonto,
	@daFechaRegistroMovimiento,
	@iIdFormaPago,
	@iIdEstadoPago,
	@sNum_Documento,
	@iIdAuxiliar,
	@sDsc_Detalle,
	@sUsrCreacion,
	@sUsrUltModif,
	@daFecUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdMovimiento=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCMovimientoCuenta'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCMovimientoCuenta]
ORDER BY 
	[IdMovimiento] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCMovimientoCuenta'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos_Con_IdCuenta_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCMovimientoCuenta'
-- basado en un campo llave primaria.
-- Recibe: @iIdCuenta int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos_Con_IdCuenta_FK]
	@iIdCuenta int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdCuenta] = @iIdCuenta


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos_Con_IdEstadoPago_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCMovimientoCuenta'
-- basado en un campo llave primaria.
-- Recibe: @iIdEstadoPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos_Con_IdEstadoPago_FK]
	@iIdEstadoPago int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdEstadoPago] = @iIdEstadoPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos_Con_IdFormaPago_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCMovimientoCuenta'
-- basado en un campo llave primaria.
-- Recibe: @iIdFormaPago int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarTodos_Con_IdFormaPago_FK]
	@iIdFormaPago int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdFormaPago] = @iIdFormaPago


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCMovimientoCuenta'
-- basado en la llave primaria.
-- Recibe: @iIdMovimiento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCMovimientoCuenta_SeleccionarUno]
	@iIdMovimiento int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCMovimientoCuenta]
WHERE
	[IdMovimiento] = @iIdMovimiento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCOtrosCargos'
-- Recibe: @iIdOtrosCargos int
-- Recibe: @iIdDocumento int
-- Recibe: @iIdTipoCargo int
-- Recibe: @doPorOtrosCargos real
-- Recibe: @curMonOtrosCargos money
-- Recibe: @bIndTercero bit
-- Recibe: @iIdTercero int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_Actualizar]
	@iIdOtrosCargos int,
	@iIdDocumento int,
	@iIdTipoCargo int,
	@doPorOtrosCargos real,
	@curMonOtrosCargos money,
	@bIndTercero bit,
	@iIdTercero int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCOtrosCargos]
SET 
	[IdDocumento] = @iIdDocumento,
	[IdTipoCargo] = @iIdTipoCargo,
	[PorOtrosCargos] = @doPorOtrosCargos,
	[MonOtrosCargos] = @curMonOtrosCargos,
	[IndTercero] = @bIndTercero,
	[IdTercero] = @iIdTercero
WHERE
	[IdOtrosCargos] = @iIdOtrosCargos


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_ActualizarTodos_Con_IdDocumento_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCOtrosCargos'.
-- Actualiza el campo [IdDocumento] con el valor anterior de@iIdDocumento  al valor @iIdDocumento
-- Recibe: @iIdDocumento int
-- Recibe: @iIdDocumentoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_ActualizarTodos_Con_IdDocumento_FK]
	@iIdDocumento int,
	@iIdDocumentoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCOtrosCargos]
SET
	[IdDocumento] = @iIdDocumento
WHERE
	[IdDocumento] = @iIdDocumentoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_ActualizarTodos_Con_IdTercero_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCOtrosCargos'.
-- Actualiza el campo [IdTercero] con el valor anterior de@iIdTercero  al valor @iIdTercero
-- Recibe: @iIdTercero int
-- Recibe: @iIdTerceroOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_ActualizarTodos_Con_IdTercero_FK]
	@iIdTercero int,
	@iIdTerceroOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCOtrosCargos]
SET
	[IdTercero] = @iIdTercero
WHERE
	[IdTercero] = @iIdTerceroOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_ActualizarTodos_Con_IdTipoCargo_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCXCOtrosCargos'.
-- Actualiza el campo [IdTipoCargo] con el valor anterior de@iIdTipoCargo  al valor @iIdTipoCargo
-- Recibe: @iIdTipoCargo int
-- Recibe: @iIdTipoCargoOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_ActualizarTodos_Con_IdTipoCargo_FK]
	@iIdTipoCargo int,
	@iIdTipoCargoOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCOtrosCargos]
SET
	[IdTipoCargo] = @iIdTipoCargo
WHERE
	[IdTipoCargo] = @iIdTipoCargoOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCOtrosCargos'
-- Recibe: @iIdOtrosCargos int
-- Recibe: @iIdDocumento int
-- Recibe: @iIdTipoCargo int
-- Recibe: @doPorOtrosCargos real
-- Recibe: @curMonOtrosCargos money
-- Recibe: @bIndTercero bit
-- Recibe: @iIdTercero int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_Buscar]
	@iIdOtrosCargos int,
	@iIdDocumento int,
	@iIdTipoCargo int,
	@doPorOtrosCargos real,
	@curMonOtrosCargos money,
	@bIndTercero bit,
	@iIdTercero int,
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCOtrosCargos] 
 WHERE 
	(@iIdOtrosCargos IS NULL OR [IdOtrosCargos] = @iIdOtrosCargos) AND 
	(@iIdDocumento IS NULL OR [IdDocumento] = @iIdDocumento) AND 
	(@iIdTipoCargo IS NULL OR [IdTipoCargo] = @iIdTipoCargo) AND 
	(@doPorOtrosCargos IS NULL OR [PorOtrosCargos] = @doPorOtrosCargos) AND 
	(@curMonOtrosCargos IS NULL OR [MonOtrosCargos] = @curMonOtrosCargos) AND 
	(@bIndTercero IS NULL OR [IndTercero] = @bIndTercero) AND 
	(@iIdTercero IS NULL OR [IdTercero] = @iIdTercero)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCOtrosCargos'
-- utilizando la llave primaria. 
-- Recibe: @iIdOtrosCargos int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_Eliminar]
	@iIdOtrosCargos int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCOtrosCargos]
WHERE
	[IdOtrosCargos] = @iIdOtrosCargos


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_EliminarTodo_FK_IdDocumento]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCOtrosCargos'
-- basado en un campo llave primaria.
-- Recibe: @iIdDocumento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_EliminarTodo_FK_IdDocumento]
	@iIdDocumento int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCOtrosCargos]
WHERE
	[IdDocumento] = @iIdDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_EliminarTodo_FK_IdTercero]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCOtrosCargos'
-- basado en un campo llave primaria.
-- Recibe: @iIdTercero int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_EliminarTodo_FK_IdTercero]
	@iIdTercero int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCOtrosCargos]
WHERE
	[IdTercero] = @iIdTercero


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_EliminarTodo_FK_IdTipoCargo]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCXCOtrosCargos'
-- basado en un campo llave primaria.
-- Recibe: @iIdTipoCargo int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_EliminarTodo_FK_IdTipoCargo]
	@iIdTipoCargo int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCXCOtrosCargos]
WHERE
	[IdTipoCargo] = @iIdTipoCargo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCOtrosCargos'
-- Recibe: @iIdOtrosCargos int
-- Recibe: @iIdDocumento int
-- Recibe: @iIdTipoCargo int
-- Recibe: @doPorOtrosCargos real
-- Recibe: @curMonOtrosCargos money
-- Recibe: @bIndTercero bit
-- Recibe: @iIdTercero int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_Insertar]
	@iIdOtrosCargos int,
	@iIdDocumento int,
	@iIdTipoCargo int,
	@doPorOtrosCargos real,
	@curMonOtrosCargos money,
	@bIndTercero bit,
	@iIdTercero int,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCOtrosCargos]
(
	[IdOtrosCargos],
	[IdDocumento],
	[IdTipoCargo],
	[PorOtrosCargos],
	[MonOtrosCargos],
	[IndTercero],
	[IdTercero]
)
VALUES
(
	@iIdOtrosCargos,
	@iIdDocumento,
	@iIdTipoCargo,
	@doPorOtrosCargos,
	@curMonOtrosCargos,
	@bIndTercero,
	@iIdTercero
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCOtrosCargos'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCOtrosCargos]
ORDER BY 
	[IdOtrosCargos] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_SeleccionarTodos_Con_IdDocumento_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCOtrosCargos'
-- basado en un campo llave primaria.
-- Recibe: @iIdDocumento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_SeleccionarTodos_Con_IdDocumento_FK]
	@iIdDocumento int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCOtrosCargos]
WHERE
	[IdDocumento] = @iIdDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_SeleccionarTodos_Con_IdTercero_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCOtrosCargos'
-- basado en un campo llave primaria.
-- Recibe: @iIdTercero int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_SeleccionarTodos_Con_IdTercero_FK]
	@iIdTercero int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCOtrosCargos]
WHERE
	[IdTercero] = @iIdTercero


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_SeleccionarTodos_Con_IdTipoCargo_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCXCOtrosCargos'
-- basado en un campo llave primaria.
-- Recibe: @iIdTipoCargo int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_SeleccionarTodos_Con_IdTipoCargo_FK]
	@iIdTipoCargo int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCXCOtrosCargos]
WHERE
	[IdTipoCargo] = @iIdTipoCargo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCOtrosCargos_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCOtrosCargos'
-- basado en la llave primaria.
-- Recibe: @iIdOtrosCargos int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCOtrosCargos_SeleccionarUno]
	@iIdOtrosCargos int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCOtrosCargos]
WHERE
	[IdOtrosCargos] = @iIdOtrosCargos


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCPeriodo_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCPeriodo'
-- Recibe: @iIdPeriodo int
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDscPeriodo varchar(50)
-- Recibe: @daFecInicio datetime
-- Recibe: @daFecFinal datetime
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCPeriodo_Actualizar]
	@iIdPeriodo int,
	@iIdAuxiliar int,
	@sDscPeriodo varchar(50),
	@daFecInicio datetime,
	@daFecFinal datetime,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCPeriodo]
SET 
	[IdAuxiliar] = @iIdAuxiliar,
	[DscPeriodo] = @sDscPeriodo,
	[FecInicio] = @daFecInicio,
	[FecFinal] = @daFecFinal
WHERE
	[IdPeriodo] = @iIdPeriodo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCPeriodo_ActualizarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCPeriodo'.
-- Actualiza el campo [IdAuxiliar] con el valor anterior de@iIdAuxiliar  al valor @iIdAuxiliar
-- Recibe: @iIdAuxiliar int
-- Recibe: @iIdAuxiliarOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCPeriodo_ActualizarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iIdAuxiliarOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCPeriodo]
SET
	[IdAuxiliar] = @iIdAuxiliar
WHERE
	[IdAuxiliar] = @iIdAuxiliarOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCPeriodo_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCPeriodo'
-- Recibe: @iIdPeriodo int
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDscPeriodo varchar(50)
-- Recibe: @daFecInicio datetime
-- Recibe: @daFecFinal datetime
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCPeriodo_Buscar]
	@iIdPeriodo int,
	@iIdAuxiliar int,
	@sDscPeriodo varchar(50),
	@daFecInicio datetime,
	@daFecFinal datetime,
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCPeriodo] 
 WHERE 
	(@iIdPeriodo IS NULL OR [IdPeriodo] = @iIdPeriodo) AND 
	(@iIdAuxiliar IS NULL OR [IdAuxiliar] = @iIdAuxiliar) AND 
	(@sDscPeriodo IS NULL OR [DscPeriodo] LIKE @sDscPeriodo) AND 
	(@daFecInicio IS NULL OR [FecInicio] >= @daFecInicio) AND 
	(@daFecFinal IS NULL OR [FecFinal] >= @daFecFinal)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCPeriodo_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCPeriodo'
-- utilizando la llave primaria. 
-- Recibe: @iIdPeriodo int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCPeriodo_Eliminar]
	@iIdPeriodo int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCPeriodo]
WHERE
	[IdPeriodo] = @iIdPeriodo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCPeriodo_EliminarTodo_FK_IdAuxiliar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCPeriodo'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCPeriodo_EliminarTodo_FK_IdAuxiliar]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCPeriodo]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCPeriodo_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCPeriodo'
-- Recibe: @iIdAuxiliar int
-- Recibe: @sDscPeriodo varchar(50)
-- Recibe: @daFecInicio datetime
-- Recibe: @daFecFinal datetime
-- Retorna: @iIdPeriodo int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCPeriodo_Insertar]
	@iIdAuxiliar int,
	@sDscPeriodo varchar(50),
	@daFecInicio datetime,
	@daFecFinal datetime,
	@iIdPeriodo int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCPeriodo]
(
	[IdAuxiliar],
	[DscPeriodo],
	[FecInicio],
	[FecFinal]
)
VALUES
(
	@iIdAuxiliar,
	@sDscPeriodo,
	@daFecInicio,
	@daFecFinal
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdPeriodo=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCPeriodo_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCPeriodo'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCPeriodo_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCPeriodo]
ORDER BY 
	[IdPeriodo] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCPeriodo_SeleccionarTodos_Con_IdAuxiliar_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCPeriodo'
-- basado en un campo llave primaria.
-- Recibe: @iIdAuxiliar int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCPeriodo_SeleccionarTodos_Con_IdAuxiliar_FK]
	@iIdAuxiliar int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCPeriodo]
WHERE
	[IdAuxiliar] = @iIdAuxiliar


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCPeriodo_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCPeriodo'
-- basado en la llave primaria.
-- Recibe: @iIdPeriodo int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCPeriodo_SeleccionarUno]
	@iIdPeriodo int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCPeriodo]
WHERE
	[IdPeriodo] = @iIdPeriodo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCRazonExoneracion_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCRazonExoneracion'
-- Recibe: @iIdRazonExoneracion int
-- Recibe: @sDscExoneracion varchar(50)
-- Recibe: @doPorExoneracion real
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCRazonExoneracion_Actualizar]
	@iIdRazonExoneracion int,
	@sDscExoneracion varchar(50),
	@doPorExoneracion real,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCRazonExoneracion]
SET 
	[DscExoneracion] = @sDscExoneracion,
	[PorExoneracion] = @doPorExoneracion,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdRazonExoneracion] = @iIdRazonExoneracion


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCRazonExoneracion_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCRazonExoneracion'
-- Recibe: @iIdRazonExoneracion int
-- Recibe: @sDscExoneracion varchar(50)
-- Recibe: @doPorExoneracion real
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCRazonExoneracion_Buscar]
	@iIdRazonExoneracion int,
	@sDscExoneracion varchar(50),
	@doPorExoneracion real,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCRazonExoneracion] 
 WHERE 
	(@iIdRazonExoneracion IS NULL OR [IdRazonExoneracion] = @iIdRazonExoneracion) AND 
	(@sDscExoneracion IS NULL OR [DscExoneracion] LIKE @sDscExoneracion) AND 
	(@doPorExoneracion IS NULL OR [PorExoneracion] = @doPorExoneracion) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCRazonExoneracion_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCRazonExoneracion'
-- utilizando la llave primaria. 
-- Recibe: @iIdRazonExoneracion int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCRazonExoneracion_Eliminar]
	@iIdRazonExoneracion int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCRazonExoneracion]
WHERE
	[IdRazonExoneracion] = @iIdRazonExoneracion


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCRazonExoneracion_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCRazonExoneracion'
-- Recibe: @iIdRazonExoneracion int
-- Recibe: @sDscExoneracion varchar(50)
-- Recibe: @doPorExoneracion real
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCRazonExoneracion_Insertar]
	@iIdRazonExoneracion int,
	@sDscExoneracion varchar(50),
	@doPorExoneracion real,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCRazonExoneracion]
(
	[IdRazonExoneracion],
	[DscExoneracion],
	[PorExoneracion],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@iIdRazonExoneracion,
	@sDscExoneracion,
	@doPorExoneracion,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCRazonExoneracion_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCRazonExoneracion'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCRazonExoneracion_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCRazonExoneracion]
ORDER BY 
	[IdRazonExoneracion] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCRazonExoneracion_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCRazonExoneracion'
-- basado en la llave primaria.
-- Recibe: @iIdRazonExoneracion int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCRazonExoneracion_SeleccionarUno]
	@iIdRazonExoneracion int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCRazonExoneracion]
WHERE
	[IdRazonExoneracion] = @iIdRazonExoneracion


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCReferencia_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCReferencia'
-- Recibe: @iIdReferencia int
-- Recibe: @sDscReferencia varchar(50)
-- Recibe: @iIdTipoDocumento int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCReferencia_Actualizar]
	@iIdReferencia int,
	@sDscReferencia varchar(50),
	@iIdTipoDocumento int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCReferencia]
SET 
	[DscReferencia] = @sDscReferencia,
	[IdTipoDocumento] = @iIdTipoDocumento,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdReferencia] = @iIdReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCReferencia_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCReferencia'
-- Recibe: @iIdReferencia int
-- Recibe: @sDscReferencia varchar(50)
-- Recibe: @iIdTipoDocumento int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCReferencia_Buscar]
	@iIdReferencia int,
	@sDscReferencia varchar(50),
	@iIdTipoDocumento int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCReferencia] 
 WHERE 
	(@iIdReferencia IS NULL OR [IdReferencia] = @iIdReferencia) AND 
	(@sDscReferencia IS NULL OR [DscReferencia] LIKE @sDscReferencia) AND 
	(@iIdTipoDocumento IS NULL OR [IdTipoDocumento] = @iIdTipoDocumento) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCReferencia_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCReferencia'
-- utilizando la llave primaria. 
-- Recibe: @iIdReferencia int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCReferencia_Eliminar]
	@iIdReferencia int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCReferencia]
WHERE
	[IdReferencia] = @iIdReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCReferencia_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCReferencia'
-- Recibe: @iIdReferencia int
-- Recibe: @sDscReferencia varchar(50)
-- Recibe: @iIdTipoDocumento int
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCReferencia_Insertar]
	@iIdReferencia int,
	@sDscReferencia varchar(50),
	@iIdTipoDocumento int,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCReferencia]
(
	[IdReferencia],
	[DscReferencia],
	[IdTipoDocumento],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@iIdReferencia,
	@sDscReferencia,
	@iIdTipoDocumento,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCReferencia_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCReferencia'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCReferencia_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCReferencia]
ORDER BY 
	[IdReferencia] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCReferencia_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCReferencia'
-- basado en la llave primaria.
-- Recibe: @iIdReferencia int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCReferencia_SeleccionarUno]
	@iIdReferencia int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCReferencia]
WHERE
	[IdReferencia] = @iIdReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCSocio'
-- Recibe: @iId_Socio int
-- Recibe: @sNum_Identificacion varchar(50)
-- Recibe: @iId_TipoIdentif int
-- Recibe: @sNum_Identificacion2 varchar(50)
-- Recibe: @sDsc_NombreSocio varchar(80)
-- Recibe: @sDsc_NombreSocio2 varchar(120)
-- Recibe: @iId_TipoSocio int
-- Recibe: @sEmail_Socio varchar(80)
-- Recibe: @snum_CelularSocio varchar(20)
-- Recibe: @snum_TelefonoSocio varchar(20)
-- Recibe: @sDsc_Info1Socio varchar(128)
-- Recibe: @sDsc_Info2Socio varchar(128)
-- Recibe: @daFec_Creacion datetime
-- Recibe: @sUsr_Creacion varchar(50)
-- Recibe: @daFec_UltModif datetime
-- Recibe: @sUsr_UltModif varchar(30)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_Actualizar]
	@iId_Socio int,
	@sNum_Identificacion varchar(50),
	@iId_TipoIdentif int,
	@sNum_Identificacion2 varchar(50),
	@sDsc_NombreSocio varchar(80),
	@sDsc_NombreSocio2 varchar(120),
	@iId_TipoSocio int,
	@sEmail_Socio varchar(80),
	@snum_CelularSocio varchar(20),
	@snum_TelefonoSocio varchar(20),
	@sDsc_Info1Socio varchar(128),
	@sDsc_Info2Socio varchar(128),
	@daFec_Creacion datetime,
	@sUsr_Creacion varchar(50),
	@daFec_UltModif datetime,
	@sUsr_UltModif varchar(30),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCSocio]
SET 
	[Num_Identificacion] = @sNum_Identificacion,
	[Id_TipoIdentif] = @iId_TipoIdentif,
	[Num_Identificacion2] = @sNum_Identificacion2,
	[Dsc_NombreSocio] = @sDsc_NombreSocio,
	[Dsc_NombreSocio2] = @sDsc_NombreSocio2,
	[Id_TipoSocio] = @iId_TipoSocio,
	[Email_Socio] = @sEmail_Socio,
	[num_CelularSocio] = @snum_CelularSocio,
	[num_TelefonoSocio] = @snum_TelefonoSocio,
	[Dsc_Info1Socio] = @sDsc_Info1Socio,
	[Dsc_Info2Socio] = @sDsc_Info2Socio,
	[Fec_Creacion] = @daFec_Creacion,
	[Usr_Creacion] = @sUsr_Creacion,
	[Fec_UltModif] = @daFec_UltModif,
	[Usr_UltModif] = @sUsr_UltModif
WHERE
	[Id_Socio] = @iId_Socio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_ActualizarTodos_Con_Id_TipoIdentif_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCSocio'.
-- Actualiza el campo [Id_TipoIdentif] con el valor anterior de@iId_TipoIdentif  al valor @iId_TipoIdentif
-- Recibe: @iId_TipoIdentif int
-- Recibe: @iId_TipoIdentifOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_ActualizarTodos_Con_Id_TipoIdentif_FK]
	@iId_TipoIdentif int,
	@iId_TipoIdentifOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCSocio]
SET
	[Id_TipoIdentif] = @iId_TipoIdentif
WHERE
	[Id_TipoIdentif] = @iId_TipoIdentifOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_ActualizarTodos_Con_Id_TipoSocio_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCSocio'.
-- Actualiza el campo [Id_TipoSocio] con el valor anterior de@iId_TipoSocio  al valor @iId_TipoSocio
-- Recibe: @iId_TipoSocio int
-- Recibe: @iId_TipoSocioOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_ActualizarTodos_Con_Id_TipoSocio_FK]
	@iId_TipoSocio int,
	@iId_TipoSocioOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCSocio]
SET
	[Id_TipoSocio] = @iId_TipoSocio
WHERE
	[Id_TipoSocio] = @iId_TipoSocioOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCSocio'
-- Recibe: @iId_Socio int
-- Recibe: @sNum_Identificacion varchar(50)
-- Recibe: @iId_TipoIdentif int
-- Recibe: @sNum_Identificacion2 varchar(50)
-- Recibe: @sDsc_NombreSocio varchar(80)
-- Recibe: @sDsc_NombreSocio2 varchar(120)
-- Recibe: @iId_TipoSocio int
-- Recibe: @sEmail_Socio varchar(80)
-- Recibe: @snum_CelularSocio varchar(20)
-- Recibe: @snum_TelefonoSocio varchar(20)
-- Recibe: @sDsc_Info1Socio varchar(128)
-- Recibe: @sDsc_Info2Socio varchar(128)
-- Recibe: @daFec_Creacion datetime
-- Recibe: @sUsr_Creacion varchar(50)
-- Recibe: @daFec_UltModif datetime
-- Recibe: @sUsr_UltModif varchar(30)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_Buscar]
	@iId_Socio int,
	@sNum_Identificacion varchar(50),
	@iId_TipoIdentif int,
	@sNum_Identificacion2 varchar(50),
	@sDsc_NombreSocio varchar(80),
	@sDsc_NombreSocio2 varchar(120),
	@iId_TipoSocio int,
	@sEmail_Socio varchar(80),
	@snum_CelularSocio varchar(20),
	@snum_TelefonoSocio varchar(20),
	@sDsc_Info1Socio varchar(128),
	@sDsc_Info2Socio varchar(128),
	@daFec_Creacion datetime,
	@sUsr_Creacion varchar(50),
	@daFec_UltModif datetime,
	@sUsr_UltModif varchar(30),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCSocio] 
 WHERE 
	(@iId_Socio IS NULL OR [Id_Socio] = @iId_Socio) AND 
	(@sNum_Identificacion IS NULL OR [Num_Identificacion] LIKE @sNum_Identificacion) AND 
	(@iId_TipoIdentif IS NULL OR [Id_TipoIdentif] = @iId_TipoIdentif) AND 
	(@sNum_Identificacion2 IS NULL OR [Num_Identificacion2] LIKE @sNum_Identificacion2) AND 
	(@sDsc_NombreSocio IS NULL OR [Dsc_NombreSocio] LIKE @sDsc_NombreSocio) AND 
	(@sDsc_NombreSocio2 IS NULL OR [Dsc_NombreSocio2] LIKE @sDsc_NombreSocio2) AND 
	(@iId_TipoSocio IS NULL OR [Id_TipoSocio] = @iId_TipoSocio) AND 
	(@sEmail_Socio IS NULL OR [Email_Socio] LIKE @sEmail_Socio) AND 
	(@snum_CelularSocio IS NULL OR [num_CelularSocio] LIKE @snum_CelularSocio) AND 
	(@snum_TelefonoSocio IS NULL OR [num_TelefonoSocio] LIKE @snum_TelefonoSocio) AND 
	(@sDsc_Info1Socio IS NULL OR [Dsc_Info1Socio] LIKE @sDsc_Info1Socio) AND 
	(@sDsc_Info2Socio IS NULL OR [Dsc_Info2Socio] LIKE @sDsc_Info2Socio) AND 
	(@daFec_Creacion IS NULL OR [Fec_Creacion] >= @daFec_Creacion) AND 
	(@sUsr_Creacion IS NULL OR [Usr_Creacion] LIKE @sUsr_Creacion) AND 
	(@daFec_UltModif IS NULL OR [Fec_UltModif] >= @daFec_UltModif) AND 
	(@sUsr_UltModif IS NULL OR [Usr_UltModif] LIKE @sUsr_UltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCSocio'
-- utilizando la llave primaria. 
-- Recibe: @iId_Socio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_Eliminar]
	@iId_Socio int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCSocio]
WHERE
	[Id_Socio] = @iId_Socio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_EliminarTodo_FK_Id_TipoIdentif]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCSocio'
-- basado en un campo llave primaria.
-- Recibe: @iId_TipoIdentif int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_EliminarTodo_FK_Id_TipoIdentif]
	@iId_TipoIdentif int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCSocio]
WHERE
	[Id_TipoIdentif] = @iId_TipoIdentif


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_EliminarTodo_FK_Id_TipoSocio]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCSocio'
-- basado en un campo llave primaria.
-- Recibe: @iId_TipoSocio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_EliminarTodo_FK_Id_TipoSocio]
	@iId_TipoSocio int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCSocio]
WHERE
	[Id_TipoSocio] = @iId_TipoSocio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCSocio'
-- Recibe: @sNum_Identificacion varchar(50)
-- Recibe: @iId_TipoIdentif int
-- Recibe: @sNum_Identificacion2 varchar(50)
-- Recibe: @sDsc_NombreSocio varchar(80)
-- Recibe: @sDsc_NombreSocio2 varchar(120)
-- Recibe: @iId_TipoSocio int
-- Recibe: @sEmail_Socio varchar(80)
-- Recibe: @snum_CelularSocio varchar(20)
-- Recibe: @snum_TelefonoSocio varchar(20)
-- Recibe: @sDsc_Info1Socio varchar(128)
-- Recibe: @sDsc_Info2Socio varchar(128)
-- Recibe: @daFec_Creacion datetime
-- Recibe: @sUsr_Creacion varchar(50)
-- Recibe: @daFec_UltModif datetime
-- Recibe: @sUsr_UltModif varchar(30)
-- Retorna: @iId_Socio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_Insertar]
	@sNum_Identificacion varchar(50),
	@iId_TipoIdentif int,
	@sNum_Identificacion2 varchar(50),
	@sDsc_NombreSocio varchar(80),
	@sDsc_NombreSocio2 varchar(120),
	@iId_TipoSocio int,
	@sEmail_Socio varchar(80),
	@snum_CelularSocio varchar(20),
	@snum_TelefonoSocio varchar(20),
	@sDsc_Info1Socio varchar(128),
	@sDsc_Info2Socio varchar(128),
	@daFec_Creacion datetime,
	@sUsr_Creacion varchar(50),
	@daFec_UltModif datetime,
	@sUsr_UltModif varchar(30),
	@iId_Socio int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCSocio]
(
	[Num_Identificacion],
	[Id_TipoIdentif],
	[Num_Identificacion2],
	[Dsc_NombreSocio],
	[Dsc_NombreSocio2],
	[Id_TipoSocio],
	[Email_Socio],
	[num_CelularSocio],
	[num_TelefonoSocio],
	[Dsc_Info1Socio],
	[Dsc_Info2Socio],
	[Fec_Creacion],
	[Usr_Creacion],
	[Fec_UltModif],
	[Usr_UltModif]
)
VALUES
(
	@sNum_Identificacion,
	@iId_TipoIdentif,
	@sNum_Identificacion2,
	@sDsc_NombreSocio,
	@sDsc_NombreSocio2,
	@iId_TipoSocio,
	@sEmail_Socio,
	@snum_CelularSocio,
	@snum_TelefonoSocio,
	@sDsc_Info1Socio,
	@sDsc_Info2Socio,
	@daFec_Creacion,
	@sUsr_Creacion,
	@daFec_UltModif,
	@sUsr_UltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iId_Socio=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCSocio'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCSocio]
ORDER BY 
	[Id_Socio] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_SeleccionarTodos_Con_Id_TipoIdentif_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCSocio'
-- basado en un campo llave primaria.
-- Recibe: @iId_TipoIdentif int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_SeleccionarTodos_Con_Id_TipoIdentif_FK]
	@iId_TipoIdentif int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCSocio]
WHERE
	[Id_TipoIdentif] = @iId_TipoIdentif


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_SeleccionarTodos_Con_Id_TipoSocio_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCSocio'
-- basado en un campo llave primaria.
-- Recibe: @iId_TipoSocio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_SeleccionarTodos_Con_Id_TipoSocio_FK]
	@iId_TipoSocio int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCSocio]
WHERE
	[Id_TipoSocio] = @iId_TipoSocio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocio_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCSocio'
-- basado en la llave primaria.
-- Recibe: @iId_Socio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocio_SeleccionarUno]
	@iId_Socio int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCSocio]
WHERE
	[Id_Socio] = @iId_Socio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocioTipo_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCSocioTipo'
-- Recibe: @iIdTipoDeudor int
-- Recibe: @sDscTipoDeudor varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocioTipo_Actualizar]
	@iIdTipoDeudor int,
	@sDscTipoDeudor varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCSocioTipo]
SET 
	[DscTipoDeudor] = @sDscTipoDeudor
WHERE
	[IdTipoDeudor] = @iIdTipoDeudor


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocioTipo_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCSocioTipo'
-- Recibe: @iIdTipoDeudor int
-- Recibe: @sDscTipoDeudor varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocioTipo_Buscar]
	@iIdTipoDeudor int,
	@sDscTipoDeudor varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCSocioTipo] 
 WHERE 
	(@iIdTipoDeudor IS NULL OR [IdTipoDeudor] = @iIdTipoDeudor) AND 
	(@sDscTipoDeudor IS NULL OR [DscTipoDeudor] LIKE @sDscTipoDeudor)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocioTipo_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCSocioTipo'
-- utilizando la llave primaria. 
-- Recibe: @iIdTipoDeudor int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocioTipo_Eliminar]
	@iIdTipoDeudor int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCSocioTipo]
WHERE
	[IdTipoDeudor] = @iIdTipoDeudor


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocioTipo_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCSocioTipo'
-- Recibe: @sDscTipoDeudor varchar(50)
-- Retorna: @iIdTipoDeudor int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocioTipo_Insertar]
	@sDscTipoDeudor varchar(50),
	@iIdTipoDeudor int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCSocioTipo]
(
	[DscTipoDeudor]
)
VALUES
(
	@sDscTipoDeudor
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdTipoDeudor=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocioTipo_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCSocioTipo'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocioTipo_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCSocioTipo]
ORDER BY 
	[IdTipoDeudor] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCSocioTipo_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCSocioTipo'
-- basado en la llave primaria.
-- Recibe: @iIdTipoDeudor int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCSocioTipo_SeleccionarUno]
	@iIdTipoDeudor int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCSocioTipo]
WHERE
	[IdTipoDeudor] = @iIdTipoDeudor


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCStoreProc_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCStoreProc'
-- Recibe: @iId_SP int
-- Recibe: @sNom_SP varchar(256)
-- Recibe: @sDsc_SP varchar(1048)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCStoreProc_Actualizar]
	@iId_SP int,
	@sNom_SP varchar(256),
	@sDsc_SP varchar(1048),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCStoreProc]
SET 
	[Nom_SP] = @sNom_SP,
	[Dsc_SP] = @sDsc_SP
WHERE
	[Id_SP] = @iId_SP


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCStoreProc_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCStoreProc'
-- Recibe: @iId_SP int
-- Recibe: @sNom_SP varchar(256)
-- Recibe: @sDsc_SP varchar(1048)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCStoreProc_Buscar]
	@iId_SP int,
	@sNom_SP varchar(256),
	@sDsc_SP varchar(1048),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCStoreProc] 
 WHERE 
	(@iId_SP IS NULL OR [Id_SP] = @iId_SP) AND 
	(@sNom_SP IS NULL OR [Nom_SP] LIKE @sNom_SP) AND 
	(@sDsc_SP IS NULL OR [Dsc_SP] LIKE @sDsc_SP)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCStoreProc_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCStoreProc'
-- utilizando la llave primaria. 
-- Recibe: @iId_SP int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCStoreProc_Eliminar]
	@iId_SP int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCStoreProc]
WHERE
	[Id_SP] = @iId_SP


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCStoreProc_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCStoreProc'
-- Recibe: @sNom_SP varchar(256)
-- Recibe: @sDsc_SP varchar(1048)
-- Retorna: @iId_SP int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCStoreProc_Insertar]
	@sNom_SP varchar(256),
	@sDsc_SP varchar(1048),
	@iId_SP int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCStoreProc]
(
	[Nom_SP],
	[Dsc_SP]
)
VALUES
(
	@sNom_SP,
	@sDsc_SP
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iId_SP=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCStoreProc_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCStoreProc'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCStoreProc_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCStoreProc]
ORDER BY 
	[Id_SP] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCStoreProc_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCStoreProc'
-- basado en la llave primaria.
-- Recibe: @iId_SP int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCStoreProc_SeleccionarUno]
	@iId_SP int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCStoreProc]
WHERE
	[Id_SP] = @iId_SP


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoCambio_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCTipoCambio'
-- Recibe: @iIdTipoCambio int
-- Recibe: @iIdMoneda int
-- Recibe: @curMonCompra money
-- Recibe: @curMonVenta money
-- Recibe: @daFecCreacion date
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoCambio_Actualizar]
	@iIdTipoCambio int,
	@iIdMoneda int,
	@curMonCompra money,
	@curMonVenta money,
	@daFecCreacion date,
	@sUsrCreacion varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCTipoCambio]
SET 
	[IdMoneda] = @iIdMoneda,
	[MonCompra] = @curMonCompra,
	[MonVenta] = @curMonVenta,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion
WHERE
	[IdTipoCambio] = @iIdTipoCambio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoCambio_ActualizarTodos_Con_IdMoneda_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una o más filas existentes en tabla 'FCCxCTipoCambio'.
-- Actualiza el campo [IdMoneda] con el valor anterior de@iIdMoneda  al valor @iIdMoneda
-- Recibe: @iIdMoneda int
-- Recibe: @iIdMonedaOld int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoCambio_ActualizarTodos_Con_IdMoneda_FK]
	@iIdMoneda int,
	@iIdMonedaOld int,
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCTipoCambio]
SET
	[IdMoneda] = @iIdMoneda
WHERE
	[IdMoneda] = @iIdMonedaOld


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoCambio_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCTipoCambio'
-- Recibe: @iIdTipoCambio int
-- Recibe: @iIdMoneda int
-- Recibe: @curMonCompra money
-- Recibe: @curMonVenta money
-- Recibe: @daFecCreacion date
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoCambio_Buscar]
	@iIdTipoCambio int,
	@iIdMoneda int,
	@curMonCompra money,
	@curMonVenta money,
	@daFecCreacion date,
	@sUsrCreacion varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCTipoCambio] 
 WHERE 
	(@iIdTipoCambio IS NULL OR [IdTipoCambio] = @iIdTipoCambio) AND 
	(@iIdMoneda IS NULL OR [IdMoneda] = @iIdMoneda) AND 
	(@curMonCompra IS NULL OR [MonCompra] = @curMonCompra) AND 
	(@curMonVenta IS NULL OR [MonVenta] = @curMonVenta) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoCambio_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCTipoCambio'
-- utilizando la llave primaria. 
-- Recibe: @iIdTipoCambio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoCambio_Eliminar]
	@iIdTipoCambio int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCTipoCambio]
WHERE
	[IdTipoCambio] = @iIdTipoCambio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoCambio_EliminarTodo_FK_IdMoneda]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que borra una o más filas de tabla 'FCCxCTipoCambio'
-- basado en un campo llave primaria.
-- Recibe: @iIdMoneda int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoCambio_EliminarTodo_FK_IdMoneda]
	@iIdMoneda int,
	@iCodError int OUTPUT
AS
-- Borrar una o más filas de tabla.
DELETE
FROM [dbo].[FCCxCTipoCambio]
WHERE
	[IdMoneda] = @iIdMoneda


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoCambio_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCTipoCambio'
-- Recibe: @iIdMoneda int
-- Recibe: @curMonCompra money
-- Recibe: @curMonVenta money
-- Recibe: @daFecCreacion date
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iIdTipoCambio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoCambio_Insertar]
	@iIdMoneda int,
	@curMonCompra money,
	@curMonVenta money,
	@daFecCreacion date,
	@sUsrCreacion varchar(50),
	@iIdTipoCambio int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCTipoCambio]
(
	[IdMoneda],
	[MonCompra],
	[MonVenta],
	[FecCreacion],
	[UsrCreacion]
)
VALUES
(
	@iIdMoneda,
	@curMonCompra,
	@curMonVenta,
	@daFecCreacion,
	@sUsrCreacion
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdTipoCambio=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoCambio_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCTipoCambio'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoCambio_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCTipoCambio]
ORDER BY 
	[IdTipoCambio] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoCambio_SeleccionarTodos_Con_IdMoneda_FK]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona una o más filas existentes de tabla 'FCCxCTipoCambio'
-- basado en un campo llave primaria.
-- Recibe: @iIdMoneda int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoCambio_SeleccionarTodos_Con_IdMoneda_FK]
	@iIdMoneda int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una o más filas existentes de tabla.
SELECT * FROM [dbo].[FCCxCTipoCambio]
WHERE
	[IdMoneda] = @iIdMoneda


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoCambio_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCTipoCambio'
-- basado en la llave primaria.
-- Recibe: @iIdTipoCambio int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoCambio_SeleccionarUno]
	@iIdTipoCambio int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCTipoCambio]
WHERE
	[IdTipoCambio] = @iIdTipoCambio


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoCargoTerceros_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCTipoCargoTerceros'
-- Recibe: @iIdTercero int
-- Recibe: @sDscTercero varchar(100)
-- Recibe: @bIndEsPorcentual bit
-- Recibe: @doPorTercero real
-- Recibe: @curMonTercero money
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoCargoTerceros_Actualizar]
	@iIdTercero int,
	@sDscTercero varchar(100),
	@bIndEsPorcentual bit,
	@doPorTercero real,
	@curMonTercero money,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCTipoCargoTerceros]
SET 
	[DscTercero] = @sDscTercero,
	[IndEsPorcentual] = @bIndEsPorcentual,
	[PorTercero] = @doPorTercero,
	[MonTercero] = @curMonTercero,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdTercero] = @iIdTercero


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoCargoTerceros_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCTipoCargoTerceros'
-- Recibe: @iIdTercero int
-- Recibe: @sDscTercero varchar(100)
-- Recibe: @bIndEsPorcentual bit
-- Recibe: @doPorTercero real
-- Recibe: @curMonTercero money
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoCargoTerceros_Buscar]
	@iIdTercero int,
	@sDscTercero varchar(100),
	@bIndEsPorcentual bit,
	@doPorTercero real,
	@curMonTercero money,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCTipoCargoTerceros] 
 WHERE 
	(@iIdTercero IS NULL OR [IdTercero] = @iIdTercero) AND 
	(@sDscTercero IS NULL OR [DscTercero] LIKE @sDscTercero) AND 
	(@bIndEsPorcentual IS NULL OR [IndEsPorcentual] = @bIndEsPorcentual) AND 
	(@doPorTercero IS NULL OR [PorTercero] = @doPorTercero) AND 
	(@curMonTercero IS NULL OR [MonTercero] = @curMonTercero) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoCargoTerceros_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCTipoCargoTerceros'
-- utilizando la llave primaria. 
-- Recibe: @iIdTercero int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoCargoTerceros_Eliminar]
	@iIdTercero int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCTipoCargoTerceros]
WHERE
	[IdTercero] = @iIdTercero


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoCargoTerceros_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCTipoCargoTerceros'
-- Recibe: @iIdTercero int
-- Recibe: @sDscTercero varchar(100)
-- Recibe: @bIndEsPorcentual bit
-- Recibe: @doPorTercero real
-- Recibe: @curMonTercero money
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoCargoTerceros_Insertar]
	@iIdTercero int,
	@sDscTercero varchar(100),
	@bIndEsPorcentual bit,
	@doPorTercero real,
	@curMonTercero money,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCTipoCargoTerceros]
(
	[IdTercero],
	[DscTercero],
	[IndEsPorcentual],
	[PorTercero],
	[MonTercero],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@iIdTercero,
	@sDscTercero,
	@bIndEsPorcentual,
	@doPorTercero,
	@curMonTercero,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoCargoTerceros_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCTipoCargoTerceros'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoCargoTerceros_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCTipoCargoTerceros]
ORDER BY 
	[IdTercero] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoCargoTerceros_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCTipoCargoTerceros'
-- basado en la llave primaria.
-- Recibe: @iIdTercero int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoCargoTerceros_SeleccionarUno]
	@iIdTercero int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCTipoCargoTerceros]
WHERE
	[IdTercero] = @iIdTercero


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoDocumento_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCTipoDocumento'
-- Recibe: @iIdTipoDocumento int
-- Recibe: @sDscTipoDocumento varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrultModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoDocumento_Actualizar]
	@iIdTipoDocumento int,
	@sDscTipoDocumento varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrultModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCTipoDocumento]
SET 
	[DscTipoDocumento] = @sDscTipoDocumento,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrultModif] = @sUsrultModif
WHERE
	[IdTipoDocumento] = @iIdTipoDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoDocumento_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCTipoDocumento'
-- Recibe: @iIdTipoDocumento int
-- Recibe: @sDscTipoDocumento varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrultModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoDocumento_Buscar]
	@iIdTipoDocumento int,
	@sDscTipoDocumento varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrultModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCTipoDocumento] 
 WHERE 
	(@iIdTipoDocumento IS NULL OR [IdTipoDocumento] = @iIdTipoDocumento) AND 
	(@sDscTipoDocumento IS NULL OR [DscTipoDocumento] LIKE @sDscTipoDocumento) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrultModif IS NULL OR [UsrultModif] LIKE @sUsrultModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoDocumento_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCTipoDocumento'
-- utilizando la llave primaria. 
-- Recibe: @iIdTipoDocumento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoDocumento_Eliminar]
	@iIdTipoDocumento int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCTipoDocumento]
WHERE
	[IdTipoDocumento] = @iIdTipoDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoDocumento_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCTipoDocumento'
-- Recibe: @iIdTipoDocumento int
-- Recibe: @sDscTipoDocumento varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrultModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoDocumento_Insertar]
	@iIdTipoDocumento int,
	@sDscTipoDocumento varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrultModif varchar(50),
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCTipoDocumento]
(
	[IdTipoDocumento],
	[DscTipoDocumento],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrultModif]
)
VALUES
(
	@iIdTipoDocumento,
	@sDscTipoDocumento,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrultModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoDocumento_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCTipoDocumento'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoDocumento_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCTipoDocumento]
ORDER BY 
	[IdTipoDocumento] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoDocumento_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCTipoDocumento'
-- basado en la llave primaria.
-- Recibe: @iIdTipoDocumento int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoDocumento_SeleccionarUno]
	@iIdTipoDocumento int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCTipoDocumento]
WHERE
	[IdTipoDocumento] = @iIdTipoDocumento


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoImpuesto_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCTipoImpuesto'
-- Recibe: @iIdTipoImpuesto int
-- Recibe: @sDscImpuesto varchar(50)
-- Recibe: @fPorImpuesto float(53)
-- Recibe: @sForCalculo varchar(100)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoImpuesto_Actualizar]
	@iIdTipoImpuesto int,
	@sDscImpuesto varchar(50),
	@fPorImpuesto float(53),
	@sForCalculo varchar(100),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCTipoImpuesto]
SET 
	[DscImpuesto] = @sDscImpuesto,
	[PorImpuesto] = @fPorImpuesto,
	[ForCalculo] = @sForCalculo,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion
WHERE
	[IdTipoImpuesto] = @iIdTipoImpuesto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoImpuesto_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCTipoImpuesto'
-- Recibe: @iIdTipoImpuesto int
-- Recibe: @sDscImpuesto varchar(50)
-- Recibe: @fPorImpuesto float(53)
-- Recibe: @sForCalculo varchar(100)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoImpuesto_Buscar]
	@iIdTipoImpuesto int,
	@sDscImpuesto varchar(50),
	@fPorImpuesto float(53),
	@sForCalculo varchar(100),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCTipoImpuesto] 
 WHERE 
	(@iIdTipoImpuesto IS NULL OR [IdTipoImpuesto] = @iIdTipoImpuesto) AND 
	(@sDscImpuesto IS NULL OR [DscImpuesto] LIKE @sDscImpuesto) AND 
	(@fPorImpuesto IS NULL OR [PorImpuesto] = @fPorImpuesto) AND 
	(@sForCalculo IS NULL OR [ForCalculo] LIKE @sForCalculo) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoImpuesto_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCTipoImpuesto'
-- utilizando la llave primaria. 
-- Recibe: @iIdTipoImpuesto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoImpuesto_Eliminar]
	@iIdTipoImpuesto int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCTipoImpuesto]
WHERE
	[IdTipoImpuesto] = @iIdTipoImpuesto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoImpuesto_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCTipoImpuesto'
-- Recibe: @sDscImpuesto varchar(50)
-- Recibe: @fPorImpuesto float(53)
-- Recibe: @sForCalculo varchar(100)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Retorna: @iIdTipoImpuesto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoImpuesto_Insertar]
	@sDscImpuesto varchar(50),
	@fPorImpuesto float(53),
	@sForCalculo varchar(100),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@iIdTipoImpuesto int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCTipoImpuesto]
(
	[DscImpuesto],
	[PorImpuesto],
	[ForCalculo],
	[FecCreacion],
	[UsrCreacion]
)
VALUES
(
	@sDscImpuesto,
	@fPorImpuesto,
	@sForCalculo,
	@daFecCreacion,
	@sUsrCreacion
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdTipoImpuesto=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoImpuesto_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCTipoImpuesto'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoImpuesto_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCTipoImpuesto]
ORDER BY 
	[IdTipoImpuesto] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCTipoImpuesto_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCTipoImpuesto'
-- basado en la llave primaria.
-- Recibe: @iIdTipoImpuesto int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCTipoImpuesto_SeleccionarUno]
	@iIdTipoImpuesto int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCTipoImpuesto]
WHERE
	[IdTipoImpuesto] = @iIdTipoImpuesto


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoOtrosCargos_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCTipoOtrosCargos'
-- Recibe: @iIdTipoCargo int
-- Recibe: @sDscTipoCargo varchar(50)
-- Recibe: @doPorCargo real
-- Recibe: @curMonCargo money
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoOtrosCargos_Actualizar]
	@iIdTipoCargo int,
	@sDscTipoCargo varchar(50),
	@doPorCargo real,
	@curMonCargo money,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCTipoOtrosCargos]
SET 
	[DscTipoCargo] = @sDscTipoCargo,
	[PorCargo] = @doPorCargo,
	[MonCargo] = @curMonCargo,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdTipoCargo] = @iIdTipoCargo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoOtrosCargos_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCTipoOtrosCargos'
-- Recibe: @iIdTipoCargo int
-- Recibe: @sDscTipoCargo varchar(50)
-- Recibe: @doPorCargo real
-- Recibe: @curMonCargo money
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoOtrosCargos_Buscar]
	@iIdTipoCargo int,
	@sDscTipoCargo varchar(50),
	@doPorCargo real,
	@curMonCargo money,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCTipoOtrosCargos] 
 WHERE 
	(@iIdTipoCargo IS NULL OR [IdTipoCargo] = @iIdTipoCargo) AND 
	(@sDscTipoCargo IS NULL OR [DscTipoCargo] LIKE @sDscTipoCargo) AND 
	(@doPorCargo IS NULL OR [PorCargo] = @doPorCargo) AND 
	(@curMonCargo IS NULL OR [MonCargo] = @curMonCargo) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoOtrosCargos_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCTipoOtrosCargos'
-- utilizando la llave primaria. 
-- Recibe: @iIdTipoCargo int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoOtrosCargos_Eliminar]
	@iIdTipoCargo int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCTipoOtrosCargos]
WHERE
	[IdTipoCargo] = @iIdTipoCargo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoOtrosCargos_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCTipoOtrosCargos'
-- Recibe: @iIdTipoCargo int
-- Recibe: @sDscTipoCargo varchar(50)
-- Recibe: @doPorCargo real
-- Recibe: @curMonCargo money
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoOtrosCargos_Insertar]
	@iIdTipoCargo int,
	@sDscTipoCargo varchar(50),
	@doPorCargo real,
	@curMonCargo money,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCTipoOtrosCargos]
(
	[IdTipoCargo],
	[DscTipoCargo],
	[PorCargo],
	[MonCargo],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@iIdTipoCargo,
	@sDscTipoCargo,
	@doPorCargo,
	@curMonCargo,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoOtrosCargos_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCTipoOtrosCargos'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoOtrosCargos_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCTipoOtrosCargos]
ORDER BY 
	[IdTipoCargo] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoOtrosCargos_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCTipoOtrosCargos'
-- basado en la llave primaria.
-- Recibe: @iIdTipoCargo int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoOtrosCargos_SeleccionarUno]
	@iIdTipoCargo int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCTipoOtrosCargos]
WHERE
	[IdTipoCargo] = @iIdTipoCargo


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoReferencia_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCXCTipoReferencia'
-- Recibe: @iIdTipoReferencia int
-- Recibe: @sDscTipoReferencia varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoReferencia_Actualizar]
	@iIdTipoReferencia int,
	@sDscTipoReferencia varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCXCTipoReferencia]
SET 
	[DscTipoReferencia] = @sDscTipoReferencia,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdTipoReferencia] = @iIdTipoReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoReferencia_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCXCTipoReferencia'
-- Recibe: @iIdTipoReferencia int
-- Recibe: @sDscTipoReferencia varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoReferencia_Buscar]
	@iIdTipoReferencia int,
	@sDscTipoReferencia varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCXCTipoReferencia] 
 WHERE 
	(@iIdTipoReferencia IS NULL OR [IdTipoReferencia] = @iIdTipoReferencia) AND 
	(@sDscTipoReferencia IS NULL OR [DscTipoReferencia] LIKE @sDscTipoReferencia) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoReferencia_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCXCTipoReferencia'
-- utilizando la llave primaria. 
-- Recibe: @iIdTipoReferencia int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoReferencia_Eliminar]
	@iIdTipoReferencia int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCXCTipoReferencia]
WHERE
	[IdTipoReferencia] = @iIdTipoReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoReferencia_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCXCTipoReferencia'
-- Recibe: @iIdTipoReferencia int
-- Recibe: @sDscTipoReferencia varchar(50)
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoReferencia_Insertar]
	@iIdTipoReferencia int,
	@sDscTipoReferencia varchar(50),
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCXCTipoReferencia]
(
	[IdTipoReferencia],
	[DscTipoReferencia],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@iIdTipoReferencia,
	@sDscTipoReferencia,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoReferencia_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCXCTipoReferencia'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoReferencia_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCXCTipoReferencia]
ORDER BY 
	[IdTipoReferencia] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCXCTipoReferencia_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCXCTipoReferencia'
-- basado en la llave primaria.
-- Recibe: @iIdTipoReferencia int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCXCTipoReferencia_SeleccionarUno]
	@iIdTipoReferencia int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCXCTipoReferencia]
WHERE
	[IdTipoReferencia] = @iIdTipoReferencia


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCUMedidas_Actualizar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que actualiza una sola fila en la tabla 'FCCxCUMedidas'
-- Recibe: @iIdUMedida int
-- Recibe: @sDscUMedida varchar(50)
-- Recibe: @bIndEntero bit
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCUMedidas_Actualizar]
	@iIdUMedida int,
	@sDscUMedida varchar(50),
	@bIndEntero bit,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Actualizar una sola fila de tabla.
UPDATE [dbo].[FCCxCUMedidas]
SET 
	[DscUMedida] = @sDscUMedida,
	[IndEntero] = @bIndEntero,
	[FecCreacion] = @daFecCreacion,
	[UsrCreacion] = @sUsrCreacion,
	[FecUltModif] = @daFecUltModif,
	[UsrUltModif] = @sUsrUltModif
WHERE
	[IdUMedida] = @iIdUMedida


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCUMedidas_Buscar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que realiza una busqueda de filas en la tabla 'FCCxCUMedidas'
-- Recibe: @iIdUMedida int
-- Recibe: @sDscUMedida varchar(50)
-- Recibe: @bIndEntero bit
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCUMedidas_Buscar]
	@iIdUMedida int,
	@sDscUMedida varchar(50),
	@bIndEntero bit,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iCodError int OUTPUT
AS
-- Busca filas en la tabla.
SELECT * FROM [dbo].[FCCxCUMedidas] 
 WHERE 
	(@iIdUMedida IS NULL OR [IdUMedida] = @iIdUMedida) AND 
	(@sDscUMedida IS NULL OR [DscUMedida] LIKE @sDscUMedida) AND 
	(@bIndEntero IS NULL OR [IndEntero] = @bIndEntero) AND 
	(@daFecCreacion IS NULL OR [FecCreacion] >= @daFecCreacion) AND 
	(@sUsrCreacion IS NULL OR [UsrCreacion] LIKE @sUsrCreacion) AND 
	(@daFecUltModif IS NULL OR [FecUltModif] >= @daFecUltModif) AND 
	(@sUsrUltModif IS NULL OR [UsrUltModif] LIKE @sUsrUltModif)

-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCUMedidas_Eliminar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento para borrar una fila en la tabla 'FCCxCUMedidas'
-- utilizando la llave primaria. 
-- Recibe: @iIdUMedida int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCUMedidas_Eliminar]
	@iIdUMedida int,
	@iCodError int OUTPUT
AS
-- Borrar una fila de  tabla.
DELETE FROM [dbo].[FCCxCUMedidas]
WHERE
	[IdUMedida] = @iIdUMedida


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCUMedidas_Insertar]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que inserta una fila en tabla 'FCCxCUMedidas'
-- Recibe: @sDscUMedida varchar(50)
-- Recibe: @bIndEntero bit
-- Recibe: @daFecCreacion datetime
-- Recibe: @sUsrCreacion varchar(50)
-- Recibe: @daFecUltModif datetime
-- Recibe: @sUsrUltModif varchar(50)
-- Retorna: @iIdUMedida int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCUMedidas_Insertar]
	@sDscUMedida varchar(50),
	@bIndEntero bit,
	@daFecCreacion datetime,
	@sUsrCreacion varchar(50),
	@daFecUltModif datetime,
	@sUsrUltModif varchar(50),
	@iIdUMedida int OUTPUT,
	@iCodError int OUTPUT
AS
-- Inserta una fila en la tabla.
INSERT [dbo].[FCCxCUMedidas]
(
	[DscUMedida],
	[IndEntero],
	[FecCreacion],
	[UsrCreacion],
	[FecUltModif],
	[UsrUltModif]
)
VALUES
(
	@sDscUMedida,
	@bIndEntero,
	@daFecCreacion,
	@sUsrCreacion,
	@daFecUltModif,
	@sUsrUltModif
)


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR
-- Obtener el valor IDENTITY para la fila insertada.
SELECT @iIdUMedida=SCOPE_IDENTITY()

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCUMedidas_SeleccionarTodos]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento que selecciona todas las filas de la tabla 'FCCxCUMedidas'
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCUMedidas_SeleccionarTodos]
	@iCodError int OUTPUT
AS
-- Hacer un SELECT All de la tabla.
SELECT * FROM [dbo].[FCCxCUMedidas]
ORDER BY 
	[IdUMedida] ASC


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
/****** Object:  StoredProcedure [dbo].[pr_FCCxCUMedidas_SeleccionarUno]    Script Date: 25/4/2020 08:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------------------------------------
-- Procedimiento almacenado que selecciona una fila de la tabla 'FCCxCUMedidas'
-- basado en la llave primaria.
-- Recibe: @iIdUMedida int
-- Retorna: @iCodError int
---------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[pr_FCCxCUMedidas_SeleccionarUno]
	@iIdUMedida int,
	@iCodError int OUTPUT
AS
-- Hacer SELECT de una fila de la tabla.
SELECT * FROM [dbo].[FCCxCUMedidas]
WHERE
	[IdUMedida] = @iIdUMedida


-- Obtener el código de error para el estatuto anterior.
SELECT @iCodError=@@ERROR

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación Interna autonumerado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'IdActiEconomica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo asociado por el Ministerio de Hacienda a la Actividad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'CodMdH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion de la actividad (asemejar al MdH)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'DscActividad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicador de la forma de tratar del IVA, existen 3 modalidades' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'IndDevuelveIVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actividad económica principal, sólo será una.  Las demás son secundarias.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'IndActiPrincipal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Porcentaje imponible de IVA asociado a la Actividad Económica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'IdImporteIVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de creación del registro para efectos de la auditoria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'FecCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario que creo el registro en la tabla, para efectos de auditoria' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'UsrCreacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificación de la tupla en la tabla.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'FecUltModif'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario que actualizó por ultima vez la tupla en la tabla' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCActiEconomica', @level2type=N'COLUMN',@level2name=N'UsrUltModif'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador del Auxilia, autonumerado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCAuxiliar', @level2type=N'COLUMN',@level2name=N'IdAuxiliar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del Auxiliar o módulo que presta servicios o bienes por los cuales se debe pagar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCAuxiliar', @level2type=N'COLUMN',@level2name=N'DscAuxiliar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(A)ctivo - (I)nactivo, (C)onstrucción' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCAuxiliar', @level2type=N'COLUMN',@level2name=N'CodEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación única del Bien o Servicio prestado por algún Sistema Auxiliar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'IdBoS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del Bion o Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'DscBoS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador o llave del Auxiliar que presta el servicio u ofrece el bien.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'IdAuxiliar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion o llave del Concepto al que pertenece el Bien o Servicio, el concepto es la parte financiera' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'IdConcepto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Es ''S'' de Servicio o ''B'' de Bien' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'IndTipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permite ser incluido en Factura Electrónica, 0 : No 1: Si' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'IndFacturar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permite aplicar descuentos en el momento que se aplica en la factura. 0: No 1: Si' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'IndDescuento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el Bien o Servicio paga impuesto, 0: No 1: Si' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'IndPagaImpuesto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo asignado por el Ministerio de Hacienda para este Bien o Servicio, o al que pertenece el bien o Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'CodPartidaArancelaria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación de la medida en que se valora el Bien o Servicio (Uds, Kgs, Mtrs)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'IdMedida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'En caso de que el calculo de precio del valor o servicio, o para su cargo se necesita un procedimiento especial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBienoServicio', @level2type=N'COLUMN',@level2name=N'Id_SP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion o llave del Precio del bien o servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBoSPrecio', @level2type=N'COLUMN',@level2name=N'IdBoSPrecio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación o llave del Bien o Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBoSPrecio', @level2type=N'COLUMN',@level2name=N'IdBoS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion de la moneda asociada a ese precio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBoSPrecio', @level2type=N'COLUMN',@level2name=N'IdMoneda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio del Bien o Servicio - Monto incluye el margen de contribución o ganancia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBoSPrecio', @level2type=N'COLUMN',@level2name=N'MonPrecio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto del Costo del Bien o el Servicio ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBoSPrecio', @level2type=N'COLUMN',@level2name=N'MonCosto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Periodo de Vigencia del Precio asociado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCBoSPrecio', @level2type=N'COLUMN',@level2name=N'NumPeriodo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación del Concepto ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCConcepto', @level2type=N'COLUMN',@level2name=N'IdConcepto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion del Concepto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCConcepto', @level2type=N'COLUMN',@level2name=N'DscTipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del Concepto (A) ctivo - ( I ) nactivo - ( S ) uspendido' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCConcepto', @level2type=N'COLUMN',@level2name=N'CodEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cuenta Financiera asociada al registro contable del Débito de los BoS de este concepto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCConcepto', @level2type=N'COLUMN',@level2name=N'CtaFinancieraDebito'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cuenta Financiera asociada al registro contable del Crédito de los BoS de este concepto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCConcepto', @level2type=N'COLUMN',@level2name=N'CtaFinancieraCredito'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indentificación de la Condición de Ventas ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCCondicionVenta', @level2type=N'COLUMN',@level2name=N'IdCondicionVenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción de la Condición de Ventas (Contado, Crédito, Consignación ….)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCCondicionVenta', @level2type=N'COLUMN',@level2name=N'DscCondcionVenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion de la línea de detalle dentro del documento electrónico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDetalles', @level2type=N'COLUMN',@level2name=N'IdDetalleDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion de Documento electrónico al que pertenece el detalle' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDetalles', @level2type=N'COLUMN',@level2name=N'IdDocumentoElectronico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NUmero de línea de detalle del documento electrónico (Consecutivo)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDetalles', @level2type=N'COLUMN',@level2name=N'NumLinea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad del Bien o Servicio brindado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDetalles', @level2type=N'COLUMN',@level2name=N'CanBienoServicio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación del Bien o Servicio Brindado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDetalles', @level2type=N'COLUMN',@level2name=N'IdBoS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto del bien asociado a la cantidad brindada ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDetalles', @level2type=N'COLUMN',@level2name=N'MonPrecio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descuento aplicado a la prestacion de ese bien o servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDetalles', @level2type=N'COLUMN',@level2name=N'MonDescuento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Impuesto aplcado a la prestación de ese bien o servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDetalles', @level2type=N'COLUMN',@level2name=N'MonImpuesto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion de Documento Electrónico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdDocumentoElectronico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion o llave de la actividad económica a la que pertenece la prestacion del bien o servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdActiEonomica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion del tipo de Documento (Factura, Nota de Debito, Nota de Credito)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdTipoDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de Documento Electrónco que se le envia a Hacienda para su verificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'NumDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de Vencimiento que depende de la Condicion de la Venta, si es de Contado esta fechas es la misma de ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'FecVencimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación del Socio de Negocios al que se le emitió el docuemnto electrónico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdSocio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación de la forma de pago que se dió o debe dar la cancelación del documento electrónico.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdFormaPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifiacción de la condicion de venta asociada al docuemno electrónico.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdCondicionVenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dirección electrónica a que se envió el documento a la hora de emitirse o se dió la solicitud de envío.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'eMailEnvio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Porcentaje de descuento aplicado al monto del docuemnto electrónico.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'PorDescuento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' Identificación de la razón de exoneración en el caso de que no se cobrara el impuesto de venta, en el caso de no aplicar exoneración esto es nulo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdRazonExoneración'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación de la moneda en la que se emitió el documento electrónico.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdMoneda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción asociada al documento electrónico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'DscDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación de la referencia, en el caso de tener alguna, asociada al docuemnto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdReferencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifiación del tipo de referencia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IdTipoReferencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de documento de referencia en el caso de haberla' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'NumDocumentoReferencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Justificación de la referencia, asociada al documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'DscRazonReferencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicador del Estado asociado al Ministerio de Hacienda' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IndMdH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicador del Estado en conta (P)endiente, (T)ramitado, ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IndEstadoConta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de periodos contabilizados según la condición de venta.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'NumPeriodosConta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicador de que tiene exoneración 0: No , 1: Si' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCDocumentoElectronico', @level2type=N'COLUMN',@level2name=N'IndRazonExonera'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion del Estado de la Cuenta x Cobrar (Maestro)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCEstado', @level2type=N'COLUMN',@level2name=N'IdEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del Estado de la cuenta en el Maestro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCEstado', @level2type=N'COLUMN',@level2name=N'DscEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación del Estado de Pago o Moviemiento de cuenta (Detalle del Maestro)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCEstadoPago', @level2type=N'COLUMN',@level2name=N'IdEstadoPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del Estado de Pago o Moviemiento de cuenta (Detalle del Maestro)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCEstadoPago', @level2type=N'COLUMN',@level2name=N'DscEstadoPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación de forma de pago' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCFormaPago', @level2type=N'COLUMN',@level2name=N'IdFormaPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción de forma de Pago' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCFormaPago', @level2type=N'COLUMN',@level2name=N'DscFormaPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de estado de la forma de pago (C)ontado, (T)arjeta, ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCFormaPago', @level2type=N'COLUMN',@level2name=N'CodEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Posibles valores?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCFormaPago'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Llave de tipo de Identificacion ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCIdentificacionTipo', @level2type=N'COLUMN',@level2name=N'Id_TipoIdentif'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del tipo de identificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCIdentificacionTipo', @level2type=N'COLUMN',@level2name=N'Dsc_TipoIdentif'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion de la tarifa asociada a una actividad economica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCImporteIVA', @level2type=N'COLUMN',@level2name=N'IdImporteIVA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion de la tarifa asociada a una actividad economica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCImporteIVA', @level2type=N'COLUMN',@level2name=N'DscTarifaria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Porcentaje de IVA asociada a la tarifa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCImporteIVA', @level2type=N'COLUMN',@level2name=N'PorTarifa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación del impuesto asociado al Bien o Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCImpuestosBoS', @level2type=N'COLUMN',@level2name=N'IdImpuestoBoS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación del Tipo de  impuesto asociado al Bien o Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCImpuestosBoS', @level2type=N'COLUMN',@level2name=N'IdTipoImpuesto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion del Bien o Servicio a que está asociado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCXCImpuestosBoS', @level2type=N'COLUMN',@level2name=N'IdBoS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion de la cuenta en el maestro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'IdCuenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion del Sistema Auxiliar que generó la cuenta por cobrar' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'IdAuxiliar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion del Bien o Servicio que se prestó' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'IdBoS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad del Bien o Servicio prestado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'Cantidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si es por cantidad o por monto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'TipMovimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificación del Socio al que se le prestó el bien o servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'IdSocio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se dió o brindó el bien o servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'FecRegistro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que vence el pago de la cuenta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'FecInicioMorosidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que expira la cuenta para efectos de pasar a Incobrable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'FecExpiracion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'llave de la tabla de estados' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'IdEstado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'P pendiente, C cancelado, CO contabilizado, EX exonerado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'EstadoCobro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id en el auxiliar ( Identificacion del auxiliar)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'IdLlaveExterna'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion del Cargo Asociado (de entrada por el Auxiliar)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'DscCargo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificacion de la cuenta asociada en el caso de que esta este sustituyendo a otra dentro del mismo maestro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMaestro', @level2type=N'COLUMN',@level2name=N'IdCuentaAnterior'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'num memo que indica aplicación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FCCxCMovimientoCuenta', @level2type=N'COLUMN',@level2name=N'Num_Documento'
GO
USE [master]
GO
ALTER DATABASE [bdFCCxC] SET  READ_WRITE 
GO
