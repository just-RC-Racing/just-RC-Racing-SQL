USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[clubs]    Script Date: 24/02/2024 14:42:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clubs](
	[ClubId] [int] IDENTITY(1,1) NOT NULL,
	[Club_Name] [varchar](255) NOT NULL,
	[Club_Address] [varchar](255) NOT NULL,
	[Club_Website] [varchar](255) NULL,
	[Club_Email] [varchar](255) NULL,
	[Club_Telephone] [varchar](15) NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NULL,
	[Picture] [varchar](255) NULL,
 CONSTRAINT [PK_Clubs_id] PRIMARY KEY CLUSTERED 
(
	[ClubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
