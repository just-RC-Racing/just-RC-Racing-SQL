USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[clubs_series_events_classes]    Script Date: 24/02/2024 14:42:49 ******/
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
