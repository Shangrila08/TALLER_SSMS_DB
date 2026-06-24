USE [master]
GO

/****** Objeto: Table [dbo].[DocumentosPersonal] Fecha de script: 24/06/2026 2:03:12 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DocumentosPersonal](
	[id_documento] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[tipo_documento] [varchar](50) NOT NULL,
	[nombre_archivo] [varchar](150) NOT NULL,
	[ruta_archivo] [varchar](300) NOT NULL,
	[tamano_kb] [int] NULL,
	[formato] [varchar](10) NULL,
	[fecha_subida] [datetime] NOT NULL,
	[fecha_vencimiento] [date] NULL,
	[verificado] [bit] NOT NULL,
	[fecha_verificacion] [datetime] NULL,
	[verificado_por] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DocumentosPersonal] ADD  DEFAULT (getdate()) FOR [fecha_subida]
GO

ALTER TABLE [dbo].[DocumentosPersonal] ADD  DEFAULT ((0)) FOR [verificado]
GO

ALTER TABLE [dbo].[DocumentosPersonal]  WITH CHECK ADD  CONSTRAINT [FK_Documentos_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO

ALTER TABLE [dbo].[DocumentosPersonal] CHECK CONSTRAINT [FK_Documentos_Usuario]
GO

ALTER TABLE [dbo].[DocumentosPersonal]  WITH CHECK ADD  CONSTRAINT [FK_Documentos_Verificador] FOREIGN KEY([verificado_por])
REFERENCES [dbo].[Usuarios] ([id_usuario])
GO

ALTER TABLE [dbo].[DocumentosPersonal] CHECK CONSTRAINT [FK_Documentos_Verificador]
GO

ALTER TABLE [dbo].[DocumentosPersonal]  WITH CHECK ADD  CONSTRAINT [CHK_Documentos_formato] CHECK  (([formato]='PNG' OR [formato]='JPG' OR [formato]='PDF'))
GO

ALTER TABLE [dbo].[DocumentosPersonal] CHECK CONSTRAINT [CHK_Documentos_formato]
GO

ALTER TABLE [dbo].[DocumentosPersonal]  WITH CHECK ADD  CONSTRAINT [CHK_Documentos_tipo] CHECK  (([tipo_documento]='otro' OR [tipo_documento]='certificacion' OR [tipo_documento]='identificacion' OR [tipo_documento]='contrato'))
GO

ALTER TABLE [dbo].[DocumentosPersonal] CHECK CONSTRAINT [CHK_Documentos_tipo]
GO


