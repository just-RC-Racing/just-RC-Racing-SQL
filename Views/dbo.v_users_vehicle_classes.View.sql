USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_users_vehicle_classes]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_users_vehicle_classes] AS
SELECT 
	 uvc.[id]
	,uvc.[UserId]
	,u.[FirstName] + ' ' + u.[LastName] AS [Driver]
    ,uvc.[VehicleClassId]
	,vc.[Class]
    ,uvc.[Transponder]
FROM [dbo].[users_vehicle_classes] AS uvc
	INNER JOIN [dbo].[users] AS u ON u.[UserId] = uvc.[UserId]
	INNER JOIN [dbo].[v_vehicle_classes] AS vc ON vc.[VehicleClassId] = uvc.[VehicleClassId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_users_vehicle_classes]
GO
