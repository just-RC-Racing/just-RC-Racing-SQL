USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[clubs_events_series]    Script Date: 22/02/2024 21:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clubs_events_series](
	[SeriesId] [int] IDENTITY(1,1) NOT NULL,
	[Series_Name] [varchar](255) NOT NULL,
	[Series_Start_Date] [date] NOT NULL,
	[Series_End_Date] [date] NULL,
	[Rounds] [int] NOT NULL,
	[Rounds_To_Count] [int] NOT NULL,
	[Tie_Break_Rule] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clubs_Events_Series_id] PRIMARY KEY CLUSTERED 
(
	[SeriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
