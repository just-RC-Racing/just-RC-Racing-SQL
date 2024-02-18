USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_users_clubs]    Script Date: 18/02/2024 16:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_users_clubs] AS
SELECT 
	 uc.[id]
	,uc.[UserId]
	,u.[FirstName] + ' ' + u.[LastName] AS [Driver]
	,u.[DOB]
	,u.[Sex]
	,u.[Picture] AS [User_Picture]
	,uc.[ClubId]
	,c.[Club_Name]
    ,c.[Club_Address]
    ,c.[Club_Website]
    ,c.[Club_Email]
    ,c.[Club_Telephone]
    ,c.[Start_Date]
    ,c.[End_Date]
    ,c.[Picture] AS [Club_Picture]
	,uc.[Join_Date]
FROM [dbo].[users_clubs] AS uc
	INNER JOIN [dbo].[users] AS u ON u.[UserId] = uc.[UserId]
	INNER JOIN [dbo].[clubs] AS c ON c.[ClubId] = uc.[ClubId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_users_clubs]
GO
