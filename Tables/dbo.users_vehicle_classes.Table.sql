USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[users_vehicle_classes]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_vehicle_classes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[VehicleClassId] [int] NOT NULL,
	[Transponder] [varchar](10) NULL,
	[Sponsors] [varchar](255) NULL,
	[Chassis] [varchar](100) NULL,
	[Power] [varchar](100) NULL,
	[Tyres] [varchar](100) NULL,
 CONSTRAINT [PK_Users_Vehicle_Classes_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users_vehicle_classes]  WITH CHECK ADD  CONSTRAINT [FK_UVC_User_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([UserId])
GO
ALTER TABLE [dbo].[users_vehicle_classes] CHECK CONSTRAINT [FK_UVC_User_Id]
GO
ALTER TABLE [dbo].[users_vehicle_classes]  WITH CHECK ADD  CONSTRAINT [FK_UVC_VehClass_Id] FOREIGN KEY([VehicleClassId])
REFERENCES [dbo].[g_vehicle_classes] ([VehicleClassId])
GO
ALTER TABLE [dbo].[users_vehicle_classes] CHECK CONSTRAINT [FK_UVC_VehClass_Id]
GO
