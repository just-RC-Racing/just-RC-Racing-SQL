USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[users_licences]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_licences](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LicenceId] [int] NOT NULL,
	[Licence_Refernce] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Users_Licences_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users_licences]  WITH CHECK ADD  CONSTRAINT [FK_UL_LicenceId] FOREIGN KEY([LicenceId])
REFERENCES [dbo].[g_licence_types] ([LicenceId])
GO
ALTER TABLE [dbo].[users_licences] CHECK CONSTRAINT [FK_UL_LicenceId]
GO
ALTER TABLE [dbo].[users_licences]  WITH CHECK ADD  CONSTRAINT [FK_UL_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([UserId])
GO
ALTER TABLE [dbo].[users_licences] CHECK CONSTRAINT [FK_UL_UserId]
GO
