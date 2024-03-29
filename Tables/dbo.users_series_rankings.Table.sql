USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[users_series_rankings]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_series_rankings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SeriesId] [int] NOT NULL,
	[ClubRankId] [int] NOT NULL,
 CONSTRAINT [PK_Users_Clubs_Rankings_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users_series_rankings]  WITH CHECK ADD  CONSTRAINT [FK_USR_ClubRank_Id] FOREIGN KEY([ClubRankId])
REFERENCES [dbo].[clubs_rankings] ([ClubRankId])
GO
ALTER TABLE [dbo].[users_series_rankings] CHECK CONSTRAINT [FK_USR_ClubRank_Id]
GO
ALTER TABLE [dbo].[users_series_rankings]  WITH CHECK ADD  CONSTRAINT [FK_USR_Series_Id] FOREIGN KEY([SeriesId])
REFERENCES [dbo].[clubs_series] ([SeriesId])
GO
ALTER TABLE [dbo].[users_series_rankings] CHECK CONSTRAINT [FK_USR_Series_Id]
GO
ALTER TABLE [dbo].[users_series_rankings]  WITH CHECK ADD  CONSTRAINT [FK_USR_User_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([UserId])
GO
ALTER TABLE [dbo].[users_series_rankings] CHECK CONSTRAINT [FK_USR_User_Id]
GO
