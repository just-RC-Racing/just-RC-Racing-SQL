USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[users_clubs]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_clubs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClubId] [int] NOT NULL,
	[Join_Date] [date] NULL,
 CONSTRAINT [PK_Users_Clubs_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users_clubs]  WITH CHECK ADD  CONSTRAINT [FK_UC_Club_Id] FOREIGN KEY([ClubId])
REFERENCES [dbo].[clubs] ([ClubId])
GO
ALTER TABLE [dbo].[users_clubs] CHECK CONSTRAINT [FK_UC_Club_Id]
GO
ALTER TABLE [dbo].[users_clubs]  WITH CHECK ADD  CONSTRAINT [FK_UC_User_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([UserId])
GO
ALTER TABLE [dbo].[users_clubs] CHECK CONSTRAINT [FK_UC_User_Id]
GO
