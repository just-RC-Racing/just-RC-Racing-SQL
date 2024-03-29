USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_users_series_events_results]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_users_series_events_results] AS
SELECT
	 uer.[id]
	,uer.[UserEventId]
	,v_ue.[UserId]
    ,v_ue.[Driver]
    ,v_ue.[EventClassId]
    ,v_ue.[EventId]
    ,v_ue.[Event_Date]
    ,v_ue.[Event_Name]
    ,v_ue.[VehicleClassId]
    ,v_ue.[Class]
    ,v_ue.[ClubId]
    ,v_ue.[Club_Name]
    ,v_ue.[Club_Picture]
    ,v_ue.[SeriesId]
    ,v_ue.[Series_Name]
    ,uer.[Final]
    ,uer.[Leg]
    ,uer.[Qualify_Position]
    ,uer.[Finish_Position]
FROM [dbo].[users_series_events_results] AS uer
	INNER JOIN [dbo].[v_users_series_events] AS v_ue ON v_ue.[UserEventId] = uer.[UserEventId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_users_events_results]
GO
