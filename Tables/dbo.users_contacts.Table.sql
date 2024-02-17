USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[users_contacts]    Script Date: 17/02/2024 14:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ContactTypeId] [int] NOT NULL,
	[ContactSubTypeId] [int] NOT NULL,
	[Contact_Details] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Users_Contacts_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users_contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Sub_Type_Id] FOREIGN KEY([ContactSubTypeId])
REFERENCES [dbo].[contact_sub_types] ([ContactSubTypeId])
GO
ALTER TABLE [dbo].[users_contacts] CHECK CONSTRAINT [FK_Contact_Sub_Type_Id]
GO
ALTER TABLE [dbo].[users_contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Type_Id] FOREIGN KEY([ContactTypeId])
REFERENCES [dbo].[contact_types] ([ContactTypeId])
GO
ALTER TABLE [dbo].[users_contacts] CHECK CONSTRAINT [FK_Contact_Type_Id]
GO
ALTER TABLE [dbo].[users_contacts]  WITH CHECK ADD  CONSTRAINT [FK_User_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([UserId])
GO
ALTER TABLE [dbo].[users_contacts] CHECK CONSTRAINT [FK_User_Id]
GO
