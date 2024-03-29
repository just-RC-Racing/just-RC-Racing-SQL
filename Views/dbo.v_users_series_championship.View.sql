USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_users_series_championship]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_users_series_championship] AS
	WITH CTE_User_Total_Points AS (
		SELECT v_usr.[SeriesId], v_usr.[UserId], v_usr.[VehicleClassId], SUM(v_usr.[Points]) AS [Total_Points]
		FROM [dbo].[v_users_series_results] AS v_usr
		GROUP BY v_usr.[SeriesId], v_usr.[UserId], v_usr.[VehicleClassId]
	),
	CTE_User_Points_To_Count AS (
		SELECT a.[SeriesId], a.[UserId], a.[VehicleClassId], SUM(a.[Points]) AS [Count_Points] FROM (
			SELECT v_usr.[SeriesId], v_usr.[UserId], v_usr.[VehicleClassId], csr.[Rounds_To_Count], v_usr.[Points], ROW_NUMBER() OVER (PARTITION BY v_usr.[SeriesId], v_usr.[VehicleClassId], v_usr.[UserId] ORDER BY v_usr.[Points] DESC) AS [Points_Order]
			FROM [dbo].[v_users_series_results] AS v_usr
				INNER JOIN [dbo].[clubs_series_rules] AS csr ON csr.[SeriesId] = v_usr.[SeriesId] AND csr.[VehicleClassId] = v_usr.[VehicleClassId]
		) AS a		
		WHERE a.[Points_Order] <= a.[Rounds_To_Count]
		GROUP BY a.[SeriesId], a.[UserId], a.[VehicleClassId]
	)
SELECT *, ROW_NUMBER() OVER (PARTITION BY [SeriesId], [ClubRankId] ORDER BY [Count_Points] DESC) AS [Position]
FROM (
	SELECT 
		   v_usr.[UserId]
		  ,v_usr.[Driver]
		  ,v_usr.[VehicleClassId]
		  ,v_usr.[Class]
		  ,v_usr.[SeriesId]
		  ,v_usr.[Series_Name]
		  ,'R' + CAST(v_usr.[Round] AS varchar) AS [Round]
		  ,v_usr.[ClubRankId]
		  ,v_usr.[Rank]
		  ,v_usr.[Points]
		  ,cte_t.[Total_Points]
		  ,cte_c.[Count_Points]
	FROM [dbo].[v_users_series_results] AS v_usr
		INNER JOIN [CTE_User_Total_Points] AS cte_t ON cte_t.[SeriesId] = v_usr.[SeriesId] AND cte_t.[UserId] = v_usr.[UserId] AND cte_t.[VehicleClassId] = v_usr.[VehicleClassId]
		INNER JOIN [CTE_User_Points_To_Count] AS cte_c ON cte_c.[SeriesId] = v_usr.[SeriesId] AND cte_c.[UserId] = v_usr.[UserId] AND cte_c.[VehicleClassId] = v_usr.[VehicleClassId]
) AS a
PIVOT(
	SUM(a.[Points]) FOR a.[Round] IN ([R1],[R2],[R3],[R4],[R5],[R6],[R7],[R8],[R9],[R10],[R11])
) AS t
-- ORDER BY 

-- SELECT * FROM [dbo].[v_users_series_championship]
-- Plus a position
GO
