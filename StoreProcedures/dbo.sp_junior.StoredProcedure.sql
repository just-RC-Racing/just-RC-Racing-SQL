USE [just_rc_racing]
GO
/****** Object:  StoredProcedure [dbo].[sp_junior]    Script Date: 22/02/2024 21:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Justin Heath
-- Create date: 22-02-2024
-- Description:	Calculate if a driver is a junior and update status in user table
-- EXEC [dbo].[sp_junior]
-- =============================================
CREATE PROCEDURE [dbo].[sp_junior] 
AS
BEGIN
	SELECT * FROM [dbo].[users]
END
GO
