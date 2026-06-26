USE [master]
GO

/****** Objeto: Table [dbo].[Roles] Fecha de script: 24/06/2026 2:03:56 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Roles](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rol] [varchar](50) NOT NULL,
	[descripcion] [varchar](200) NULL,
	[activo] [bit] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((1)) FOR [activo]
GO

ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO


