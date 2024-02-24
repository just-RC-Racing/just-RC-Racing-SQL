USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[users_series_results]    Script Date: 24/02/2024 14:42:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_series_results](
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
