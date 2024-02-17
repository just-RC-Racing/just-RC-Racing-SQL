USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[users_events_results]    Script Date: 17/02/2024 14:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_events_results](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserEventId] [int] NOT NULL,
	[Final] [varchar](1) NOT NULL,
	[Leg] [int] NOT NULL,
	[Qualify_Position] [int] NOT NULL,
	[Finish_Position] [int] NOT NULL,
 CONSTRAINT [PK_Users_Events_Results_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users_events_results]  WITH CHECK ADD  CONSTRAINT [FK_UER_Event_Id] FOREIGN KEY([UserEventId])
REFERENCES [dbo].[users_events] ([UserEventId])
GO
ALTER TABLE [dbo].[users_events_results] CHECK CONSTRAINT [FK_UER_Event_Id]
GO
