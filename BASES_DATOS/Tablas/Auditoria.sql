USE [master]
GO

/****** Objeto: Table [dbo].[Auditoria] Fecha de script: 24/06/2026 2:00:50 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Auditoria](
	[id_auditoria] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[accion] [varchar](50) NOT NULL,
	[tabla_afectada] [varchar](50) NULL,
	[id_registro] [int] NULL,
	[descripcion] [varchar](500) NULL,
	[fecha_accion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_auditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Auditoria] ADD  DEFAULT (getdate()) FOR [fecha_accion]
GO

ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD  CONSTRAINT [FK_Auditoria_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO

ALTER TABLE [dbo].[Auditoria] CHECK CONSTRAINT [FK_Auditoria_Usuario]
GO

ALTER TABLE [dbo].[Auditoria]  WITH CHECK ADD  CONSTRAINT [CHK_Auditoria_accion] CHECK  (([accion]='BLOQUEAR' OR [accion]='LOGOUT' OR [accion]='LOGIN' OR [accion]='ELIMINAR' OR [accion]='EDITAR' OR [accion]='CREAR'))
GO

ALTER TABLE [dbo].[Auditoria] CHECK CONSTRAINT [CHK_Auditoria_accion]
GO


