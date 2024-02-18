USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_users_licences]    Script Date: 18/02/2024 10:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_users_licences] AS
SELECT 
	 ul.[id]
	,ul.[UserId]
	,u.[FirstName] + ' ' + u.[LastName] AS [Driver]
	,ul.[LicenceId]
	,lt.[Licence]
	,ul.[Licence_Refernce]
FROM [just_rc_racing].[dbo].[users_licences] AS ul
	INNER JOIN [just_rc_racing].[dbo].[licence_types] AS lt ON lt.[LicenceId] = ul.[LicenceId]
	INNER JOIN [just_rc_racing].[dbo].[users] AS u ON u.[UserId] = ul.[UserId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_users_licences]
GO
