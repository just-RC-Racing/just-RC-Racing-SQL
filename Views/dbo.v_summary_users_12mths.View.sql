USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_summary_users_12mths]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_summary_users_12mths] AS

	WITH CTE_Classes AS (
		SELECT [UserId], [Driver], COUNT(*) AS [No_Of_Classes]
		FROM [dbo].[v_users_vehicle_classes]
		GROUP BY [UserId], [Driver]
	),
	CTE_Events AS (
		SELECT  [UserId], COUNT(*) AS [No_Of_Events]
		FROM [dbo].[v_users_series_events]
		WHERE [Event_Date] > DATEADD(year, -1, GetDate())
		GROUP BY [UserId]
	),
	CTE_Race_Wins AS (
		SELECT DISTINCT 
			[UserId]
			,COUNT(*) AS [No_Of_Race_Wins]
		FROM [dbo].[v_users_series_events_results]
		WHERE [Finish_Position] = 1 AND [Event_Date] > DATEADD(year, -1, GetDate())
		GROUP BY [UserId]
	)



	SELECT c.[UserId], c.[Driver], c.[No_Of_Classes], e.[No_Of_Events], r.[No_Of_Race_Wins], CAST(((CAST(r.[No_Of_Race_Wins] AS float) / CAST(e.[No_Of_Events] AS float)) * 100) AS int) AS [Percentage_Wins]
	FROM CTE_Classes AS c
		INNER JOIN CTE_Events AS e ON e.[UserId] = c.[UserId]
		INNER JOIN CTE_Race_Wins AS r ON r.[UserId] = c.[UserId]

	-- SELECT * FROM [just_rc_racing].[dbo].[v_users_summary_12mths]
GO
