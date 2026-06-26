USE [master]
GO

/****** Objeto: Table [dbo].[Usuarios] Fecha de script: 24/06/2026 2:06:07 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[contrasena_hash] [varchar](255) NOT NULL,
	[estado] [varchar](20) NOT NULL,
	[intentos_fallidos] [int] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[ultimo_acceso] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Usuarios_correo] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Usuarios_nombre_usuario] UNIQUE NONCLUSTERED 
(
	[nombre_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ('activo') FOR [estado]
GO

ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [intentos_fallidos]
GO

ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO

ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [CHK_Usuarios_estado] CHECK  (([estado]='bloqueado' OR [estado]='inactivo' OR [estado]='activo'))
GO

ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [CHK_Usuarios_estado]
GO


