USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_vehicle_classes]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_vehicle_classes] AS
SELECT 
	 vc.[VehicleClassId]
	,vc.[ParentClassId]
    ,vpc.[Parent_Class] + ' ' + vc.[Class] AS [Class]
FROM [dbo].[g_vehicle_classes] AS vc
	INNER JOIN [dbo].[g_vehicle_parent_classes] AS vpc ON vpc.[ParentClassId] = vc.[ParentClassId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_vehicle_classes]
GO
