USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_clubs_events]    Script Date: 18/02/2024 10:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_clubs_events] AS
SELECT 
	 cec.[EventClassId]
    ,cec.[EventId]
    ,ce.[Event_Date]
    ,ce.[Event_Name]
    ,cec.[VehicleClassId]
	,vc.[Class]
	,ce.[ClubId]
	,c.[Club_Name]
    ,c.[Club_Address]
    ,c.[Club_Website]
    ,c.[Club_Email]
    ,c.[Club_Telephone]
    ,c.[Start_Date]
    ,c.[End_Date]
    ,c.[Picture]
    ,ce.[SeriesId]
	,ces.[Series_Name]
    ,ces.[Series_Start_Date]
    ,ces.[Series_End_Date]
FROM [dbo].[clubs_events_classes] AS cec
	INNER JOIN [dbo].[clubs_events] AS ce ON ce.[EventId] = cec.[EventId]
	INNER JOIN [dbo].[vehicle_classes] AS vc ON vc.[VehicleClassId] = cec.[VehicleClassId]
	INNER JOIN [dbo].[clubs] AS c ON c.[ClubId] = ce.[ClubId]
	INNER JOIN [dbo].[clubs_events_series] AS ces ON ces.[SeriesId] = ce.[SeriesId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_clubs_events]
GO
