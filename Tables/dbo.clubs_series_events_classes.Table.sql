USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[clubs_series_events_classes]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clubs_series_events_classes](
	[EventClassId] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[VehicleClassId] [int] NOT NULL,
 CONSTRAINT [PK_Clubs_Events_Classes_id] PRIMARY KEY CLUSTERED 
(
	[EventClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clubs_series_events_classes]  WITH CHECK ADD  CONSTRAINT [FK_CSEC_Event_Id] FOREIGN KEY([EventId])
REFERENCES [dbo].[clubs_series_events] ([EventId])
GO
ALTER TABLE [dbo].[clubs_series_events_classes] CHECK CONSTRAINT [FK_CSEC_Event_Id]
GO
ALTER TABLE [dbo].[clubs_series_events_classes]  WITH CHECK ADD  CONSTRAINT [FK_CSEC_VehClass_Id] FOREIGN KEY([VehicleClassId])
REFERENCES [dbo].[g_vehicle_classes] ([VehicleClassId])
GO
ALTER TABLE [dbo].[clubs_series_events_classes] CHECK CONSTRAINT [FK_CSEC_VehClass_Id]
GO
