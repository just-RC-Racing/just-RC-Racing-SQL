USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[clubs_series]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clubs_series](
	[SeriesId] [int] IDENTITY(1,1) NOT NULL,
	[Series_Name] [varchar](255) NOT NULL,
	[Series_Start_Date] [date] NOT NULL,
	[Series_End_Date] [date] NULL,
	[Championship] [bit] NOT NULL,
	[National_Series] [bit] NOT NULL,
 CONSTRAINT [PK_Clubs_Series_id] PRIMARY KEY CLUSTERED 
(
	[SeriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
