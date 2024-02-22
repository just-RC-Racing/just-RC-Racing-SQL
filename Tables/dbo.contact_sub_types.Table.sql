USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[contact_sub_types]    Script Date: 22/02/2024 21:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact_sub_types](
	[ContactSubTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ContactTypeId] [int] NULL,
	[Sub_Type] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Contact_Sub_Types_id] PRIMARY KEY CLUSTERED 
(
	[ContactSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contact_sub_types]  WITH CHECK ADD  CONSTRAINT [FK_CST_ContactTypeId] FOREIGN KEY([ContactTypeId])
REFERENCES [dbo].[contact_types] ([ContactTypeId])
GO
ALTER TABLE [dbo].[contact_sub_types] CHECK CONSTRAINT [FK_CST_ContactTypeId]
GO
