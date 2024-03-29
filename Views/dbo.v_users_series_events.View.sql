USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_users_series_events]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_users_series_events] AS
SELECT 
	 ue.[UserEventId]
	,ue.[UserId]
	,u.[FirstName] + ' ' + u.[LastName] AS [Driver]
	,ue.[EventClassId]
	,v_ce.[EventId]
    ,v_ce.[Event_Date]
    ,v_ce.[Event_Name]
    ,v_ce.[VehicleClassId]
    ,v_ce.[Class]
    ,v_ce.[ClubId]
    ,v_ce.[Club_Name]
	,v_ce.[Club_Picture]
    ,v_ce.[SeriesId]
    ,v_ce.[Series_Name]
FROM [dbo].[users_series_events] AS ue
	INNER JOIN [dbo].[users] AS u ON u.[UserId] = ue.[UserId]
	INNER JOIN [dbo].[v_clubs_series_events] AS v_ce ON v_ce.[EventClassId] = ue.[EventClassId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_users_events]
GO
