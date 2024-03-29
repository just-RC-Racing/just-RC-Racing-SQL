USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[g_vehicle_parent_classes]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[g_vehicle_parent_classes](
	[ParentClassId] [int] IDENTITY(1,1) NOT NULL,
	[Parent_Class] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Vehicle_Parent_Class_id] PRIMARY KEY CLUSTERED 
(
	[ParentClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
