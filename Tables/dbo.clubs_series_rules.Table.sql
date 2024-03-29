USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[clubs_series_rules]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clubs_series_rules](
	[SeriesRulesId] [int] IDENTITY(1,1) NOT NULL,
	[SeriesId] [int] NOT NULL,
	[VehicleClassId] [int] NOT NULL,
	[Ranked] [bit] NULL,
	[TQ_Bonus] [bit] NULL,
	[Legs] [bit] NULL,
	[Legs_No] [int] NULL,
	[Legs_Rules] [varchar](100) NULL,
	[Max_Points] [int] NULL,
	[Rounds] [int] NULL,
	[Rounds_To_Count] [int] NULL,
	[Tie_Break_Rule] [varchar](50) NULL,
 CONSTRAINT [PK_Clubs_Series_Rules_id] PRIMARY KEY CLUSTERED 
(
	[SeriesRulesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clubs_series_rules]  WITH CHECK ADD  CONSTRAINT [FK_CSR_Series_Id] FOREIGN KEY([SeriesId])
REFERENCES [dbo].[clubs_series] ([SeriesId])
GO
ALTER TABLE [dbo].[clubs_series_rules] CHECK CONSTRAINT [FK_CSR_Series_Id]
GO
ALTER TABLE [dbo].[clubs_series_rules]  WITH CHECK ADD  CONSTRAINT [FK_CSR_VehClass_Id] FOREIGN KEY([VehicleClassId])
REFERENCES [dbo].[g_vehicle_classes] ([VehicleClassId])
GO
ALTER TABLE [dbo].[clubs_series_rules] CHECK CONSTRAINT [FK_CSR_VehClass_Id]
GO
