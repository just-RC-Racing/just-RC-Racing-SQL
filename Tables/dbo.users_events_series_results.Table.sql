USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[users_events_series_results]    Script Date: 22/02/2024 21:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_events_series_results](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SeriesId] [int] NOT NULL,
	[UserEventId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Points] [int] NOT NULL,
 CONSTRAINT [PK_Users_Events_Series_Results_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users_events_series_results]  WITH CHECK ADD  CONSTRAINT [FK_UESR_Series_Id] FOREIGN KEY([SeriesId])
REFERENCES [dbo].[clubs_events_series] ([SeriesId])
GO
ALTER TABLE [dbo].[users_events_series_results] CHECK CONSTRAINT [FK_UESR_Series_Id]
GO
ALTER TABLE [dbo].[users_events_series_results]  WITH CHECK ADD  CONSTRAINT [FK_UESR_User_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([UserId])
GO
ALTER TABLE [dbo].[users_events_series_results] CHECK CONSTRAINT [FK_UESR_User_Id]
GO
ALTER TABLE [dbo].[users_events_series_results]  WITH CHECK ADD  CONSTRAINT [FK_UESR_UserEvent_Id] FOREIGN KEY([UserEventId])
REFERENCES [dbo].[users_events] ([UserEventId])
GO
ALTER TABLE [dbo].[users_events_series_results] CHECK CONSTRAINT [FK_UESR_UserEvent_Id]
GO
