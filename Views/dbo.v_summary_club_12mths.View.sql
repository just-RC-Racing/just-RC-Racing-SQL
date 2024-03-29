USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_summary_club_12mths]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_summary_club_12mths] AS

	WITH CTE_Classes AS (
		SELECT c.[ClubId], c.[Club_Name], COUNT(*) AS [No_Of_Classes] FROM (
			SELECT DISTINCT 
				 [ClubId]
				,[Club_Name]
				,[VehicleClassId]
			FROM [dbo].[v_clubs_series_events]
			WHERE [Event_Date] > DATEADD(year, -1, GetDate())
		) AS c
		GROUP BY c.[ClubId], c.[Club_Name]
	),
	CTE_Events AS (
		SELECT  e.[ClubId], e.[Club_Name], COUNT(*) AS [No_Of_Events] FROM (
			SELECT DISTINCT 
				 [ClubId]
				,[Club_Name]
				,[EventId]
			FROM [dbo].[v_clubs_series_events]
			WHERE [Event_Date] > DATEADD(year, -1, GetDate())
		) AS e
		GROUP BY e.[ClubId], e.[Club_Name]
	),
	CTE_Racers AS (
		SELECT DISTINCT 
			 vce.[ClubId]
			,vce.[Club_Name]
			,COUNT(*) AS [No_Of_Racers]
		FROM [dbo].[v_clubs_series_events] AS vce
			INNER JOIN [dbo].[users_series_events] AS ue ON ue.[EventClassId] = vce.[EventClassId]
		GROUP BY vce.[ClubId], vce.[Club_Name]
	), CTE_Finals AS (
		SELECT f.[ClubId], COUNT(*) as [No_Finals_Ran] FROM (
			SELECT DISTINCT [ClubId], [UserEventId], [Final]
			FROM [dbo].[v_users_series_events_results]
			WHERE [Event_Date] > DATEADD(year, -1, GetDate())
		) AS f
		GROUP BY f.[ClubId]
	)



	SELECT c.[ClubId], c.[Club_Name], c.[No_Of_Classes], e.[No_Of_Events], r.[No_Of_Racers], f.[No_Finals_Ran]
	FROM CTE_Classes AS c
		INNER JOIN CTE_Events AS e ON e.ClubId = c.ClubId
		INNER JOIN CTE_Racers AS r ON r.ClubId = c.ClubId
		INNER JOIN CTE_Finals AS f ON r.ClubId = c.ClubId

	-- SELECT * FROM [just_rc_racing].[dbo].[v_club_summary_12mths]
GO
