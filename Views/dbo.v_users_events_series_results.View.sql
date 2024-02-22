USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_users_events_series_results]    Script Date: 22/02/2024 21:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_users_events_series_results] AS
SELECT
	 uesr.[id]
	,uesr.[SeriesId]
    ,v_ue.[Series_Name]
    ,uesr.[UserEventId]
    ,v_ue.[EventClassId]
    ,v_ue.[EventId]
    ,v_ue.[Event_Date]
    ,v_ue.[Event_Name]
    ,v_ue.[VehicleClassId]
    ,v_ue.[Class]
    ,v_ue.[ClubId]
    ,v_ue.[Club_Name]
    ,uesr.[UserId]
    ,v_ue.[Driver]
    ,uesr.[Points]
FROM [dbo].[users_events_series_results] AS uesr
	INNER JOIN [dbo].[v_users_events] AS v_ue ON v_ue.[UserEventId] = uesr.[UserEventId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_users_events_results]
-- Need the ranking in this result
-- plus a points total
-- plus Points to count
-- Plus a position
GO
