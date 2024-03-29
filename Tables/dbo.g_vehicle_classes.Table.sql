USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[g_vehicle_classes]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[g_vehicle_classes](
	[VehicleClassId] [int] IDENTITY(1,1) NOT NULL,
	[ParentClassId] [int] NOT NULL,
	[Class] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Vehicle_Class_id] PRIMARY KEY CLUSTERED 
(
	[VehicleClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[g_vehicle_classes]  WITH CHECK ADD  CONSTRAINT [FK_VSC_ParentClassId] FOREIGN KEY([ParentClassId])
REFERENCES [dbo].[g_vehicle_parent_classes] ([ParentClassId])
GO
ALTER TABLE [dbo].[g_vehicle_classes] CHECK CONSTRAINT [FK_VSC_ParentClassId]
GO
