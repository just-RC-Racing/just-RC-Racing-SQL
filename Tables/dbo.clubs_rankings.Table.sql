USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[clubs_rankings]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clubs_rankings](
	[ClubRankId] [int] IDENTITY(1,1) NOT NULL,
	[ClubId] [int] NOT NULL,
	[Rank] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Clubs_Rankings_id] PRIMARY KEY CLUSTERED 
(
	[ClubRankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clubs_rankings]  WITH CHECK ADD  CONSTRAINT [FK_CR_Club_Id] FOREIGN KEY([ClubId])
REFERENCES [dbo].[clubs] ([ClubId])
GO
ALTER TABLE [dbo].[clubs_rankings] CHECK CONSTRAINT [FK_CR_Club_Id]
GO
