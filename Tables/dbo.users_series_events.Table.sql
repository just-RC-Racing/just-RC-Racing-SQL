USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[users_series_events]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_series_events](
	[UserEventId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[EventClassId] [int] NOT NULL,
 CONSTRAINT [PK_Users_Events_id] PRIMARY KEY CLUSTERED 
(
	[UserEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users_series_events]  WITH CHECK ADD  CONSTRAINT [FK_USE_EventClass_Id] FOREIGN KEY([EventClassId])
REFERENCES [dbo].[clubs_series_events_classes] ([EventClassId])
GO
ALTER TABLE [dbo].[users_series_events] CHECK CONSTRAINT [FK_USE_EventClass_Id]
GO
ALTER TABLE [dbo].[users_series_events]  WITH CHECK ADD  CONSTRAINT [FK_USE_User_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([UserId])
GO
ALTER TABLE [dbo].[users_series_events] CHECK CONSTRAINT [FK_USE_User_Id]
GO
