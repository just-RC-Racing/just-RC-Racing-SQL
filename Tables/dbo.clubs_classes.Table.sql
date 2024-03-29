USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[clubs_classes]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clubs_classes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ClubId] [int] NOT NULL,
	[VehicleClassId] [int] NOT NULL,
 CONSTRAINT [PK_Clubs_Classes_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[clubs_classes]  WITH CHECK ADD  CONSTRAINT [FK_CC_Club_Id] FOREIGN KEY([ClubId])
REFERENCES [dbo].[clubs] ([ClubId])
GO
ALTER TABLE [dbo].[clubs_classes] CHECK CONSTRAINT [FK_CC_Club_Id]
GO
ALTER TABLE [dbo].[clubs_classes]  WITH CHECK ADD  CONSTRAINT [FK_CC_VehClass_Id] FOREIGN KEY([VehicleClassId])
REFERENCES [dbo].[g_vehicle_classes] ([VehicleClassId])
GO
ALTER TABLE [dbo].[clubs_classes] CHECK CONSTRAINT [FK_CC_VehClass_Id]
GO
