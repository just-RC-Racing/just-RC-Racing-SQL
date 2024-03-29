USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[clubs_series_events]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clubs_series_events](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[ClubId] [int] NOT NULL,
	[SeriesId] [int] NOT NULL,
	[Round] [int] NULL,
	[Event_Date] [date] NOT NULL,
	[Event_Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Clubs_Events_id] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clubs_series_events]  WITH CHECK ADD  CONSTRAINT [FK_CSE_Club_Id] FOREIGN KEY([ClubId])
REFERENCES [dbo].[clubs] ([ClubId])
GO
ALTER TABLE [dbo].[clubs_series_events] CHECK CONSTRAINT [FK_CSE_Club_Id]
GO
ALTER TABLE [dbo].[clubs_series_events]  WITH CHECK ADD  CONSTRAINT [FK_CSE_Series_Id] FOREIGN KEY([SeriesId])
REFERENCES [dbo].[clubs_series] ([SeriesId])
GO
ALTER TABLE [dbo].[clubs_series_events] CHECK CONSTRAINT [FK_CSE_Series_Id]
GO
