USE [just_rc_racing]
GO
/****** Object:  StoredProcedure [dbo].[sp_clubs_series_events_calc]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Justin Heath
-- Create date: 22-02-2024
-- Description:	Calculate the series event points won by drivers based on the results of the event
-- EXEC [dbo].[sp_junior]
-- =============================================
CREATE PROCEDURE [dbo].[sp_clubs_series_events_calc] 
AS
BEGIN
	SELECT * FROM [dbo].[clubs_series_events]
END
GO
