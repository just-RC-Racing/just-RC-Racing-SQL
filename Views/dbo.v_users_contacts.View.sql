USE [just_rc_racing]
GO
/****** Object:  View [dbo].[v_users_contacts]    Script Date: 18/02/2024 16:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_users_contacts] AS
SELECT 
	 uc.[id]
    ,uc.[UserId]
	,u.[FirstName] + ' ' + u.[LastName] AS [Driver]
    ,u.[DOB]
    ,u.[Sex]
    ,u.[Picture]
    ,uc.[ContactTypeId]
	,ct.[Type]
    ,uc.[ContactSubTypeId]
	,cst.[Sub_Type]
    ,uc.[Contact_Details]
FROM [dbo].[users_contacts] AS uc
	INNER JOIN [dbo].[users] AS u ON u.[UserId] = uc.[UserId]
	INNER JOIN [dbo].[contact_types] AS ct ON ct.[ContactTypeId] = uc.[ContactTypeId]
	INNER JOIN [dbo].[contact_sub_types] AS cst ON cst.[ContactSubTypeId] = uc.[ContactSubTypeId]

-- SELECT * FROM [just_rc_racing].[dbo].[v_users_contacts]
GO
