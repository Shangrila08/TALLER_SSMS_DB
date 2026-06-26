USE [master]
GO

/****** Objeto: Table [dbo].[Sesiones] Fecha de script: 24/06/2026 2:04:48 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sesiones](
	[id_sesion] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[ultimo_acceso] [datetime] NOT NULL,
	[activa] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_sesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sesiones] ADD  DEFAULT (getdate()) FOR [fecha_inicio]
GO

ALTER TABLE [dbo].[Sesiones] ADD  DEFAULT (getdate()) FOR [ultimo_acceso]
GO

ALTER TABLE [dbo].[Sesiones] ADD  DEFAULT ((1)) FOR [activa]
GO

ALTER TABLE [dbo].[Sesiones]  WITH CHECK ADD  CONSTRAINT [FK_Sesiones_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO

ALTER TABLE [dbo].[Sesiones] CHECK CONSTRAINT [FK_Sesiones_Usuario]
GO


