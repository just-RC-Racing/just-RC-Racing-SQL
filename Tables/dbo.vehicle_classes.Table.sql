USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[vehicle_classes]    Script Date: 22/02/2024 21:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_classes](
	[VehicleClassId] [int] IDENTITY(1,1) NOT NULL,
	[Class] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Vehicle_Class_id] PRIMARY KEY CLUSTERED 
(
	[VehicleClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
