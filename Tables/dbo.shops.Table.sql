USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[shops]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shops](
	[ShopId] [int] IDENTITY(1,1) NOT NULL,
	[Shop_Name] [varchar](255) NOT NULL,
	[Address_1] [varchar](255) NOT NULL,
	[Address_2] [varchar](255) NULL,
	[Address_3] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[County] [varchar](255) NULL,
	[PostCode] [varchar](10) NOT NULL,
	[Shop_Website] [varchar](255) NULL,
	[Shop_Email] [varchar](255) NULL,
	[Shop_Telephone] [varchar](15) NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NULL,
	[Picture] [varchar](255) NULL,
 CONSTRAINT [PK_Shops_id] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
