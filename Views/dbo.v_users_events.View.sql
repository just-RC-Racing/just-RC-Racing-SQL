USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_users_events]    Script Date: 22/02/2024 21:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_users_events] AS
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
	,v_ce.[Picture] AS [Club_Picture]
    ,v_ce.[SeriesId]
    ,v_ce.[Series_Name]
FROM [dbo].[users_events] AS ue
	INNER JOIN [dbo].[users] AS u ON u.[UserId] = ue.[UserId]
	INNER JOIN [dbo].[v_clubs_events] AS v_ce ON v_ce.[EventClassId] = ue.[EventClassId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_users_events]
GO
