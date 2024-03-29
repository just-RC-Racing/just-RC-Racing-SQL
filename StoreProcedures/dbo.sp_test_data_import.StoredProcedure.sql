USE [just_rc_racing]
GO
/****** Object:  StoredProcedure [dbo].[sp_test_data_import]    Script Date: 13/03/2024 08:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Justin Heath
-- Create date: 17-02-2024
-- Description:	Import Test Data
-- EXEC [dbo].[sp_test_data_import]
-- =============================================
ALTER PROCEDURE [dbo].[sp_test_data_import] 
AS
BEGIN
	-- RESET ALL TABLES --------------------------------------------
	ALTER TABLE [dbo].[g_contact_sub_types] DROP CONSTRAINT FK_CST_ContactTypeId
	ALTER TABLE [dbo].[g_vehicle_classes] DROP CONSTRAINT FK_VSC_ParentClassId
	ALTER TABLE [dbo].[clubs_classes] DROP CONSTRAINT FK_CC_Club_Id
	ALTER TABLE [dbo].[clubs_classes] DROP CONSTRAINT FK_CC_VehClass_Id
	ALTER TABLE [dbo].[clubs_rankings] DROP CONSTRAINT FK_CR_Club_Id
	ALTER TABLE [dbo].[clubs_series_events] DROP CONSTRAINT FK_CSE_Club_Id
	ALTER TABLE [dbo].[clubs_series_events] DROP CONSTRAINT FK_CSE_Series_Id
	ALTER TABLE [dbo].[clubs_series_events_classes] DROP CONSTRAINT FK_CSEC_VehClass_Id
	ALTER TABLE [dbo].[clubs_series_events_classes] DROP CONSTRAINT FK_CSEC_Event_Id
	ALTER TABLE [dbo].[clubs_series_rules] DROP CONSTRAINT FK_CSR_Series_Id
	ALTER TABLE [dbo].[clubs_series_rules] DROP CONSTRAINT FK_CSR_VehClass_Id
	ALTER TABLE [dbo].[users_contacts] DROP CONSTRAINT FK_UCon_Contact_Sub_Type_Id
	ALTER TABLE [dbo].[users_contacts] DROP CONSTRAINT FK_UCon_Contact_Type_Id
	ALTER TABLE [dbo].[users_contacts] DROP CONSTRAINT FK_UCon_User_Id
	ALTER TABLE [dbo].[users_clubs] DROP CONSTRAINT FK_UC_Club_Id
	ALTER TABLE [dbo].[users_clubs] DROP CONSTRAINT FK_UC_User_Id
	ALTER TABLE [dbo].[users_licences] DROP CONSTRAINT FK_UL_LicenceId
	ALTER TABLE [dbo].[users_licences] DROP CONSTRAINT FK_UL_UserId
	ALTER TABLE [dbo].[users_series_events] DROP CONSTRAINT FK_USE_EventClass_Id
	ALTER TABLE [dbo].[users_series_events] DROP CONSTRAINT FK_USE_User_Id
	ALTER TABLE [dbo].[users_series_events_results] DROP CONSTRAINT FK_USER_UserEvent_Id
	ALTER TABLE [dbo].[users_series_events_results] DROP CONSTRAINT FK_USER_User_Id
	ALTER TABLE [dbo].[users_series_rankings] DROP CONSTRAINT FK_USR_ClubRank_Id
	ALTER TABLE [dbo].[users_series_rankings] DROP CONSTRAINT FK_USR_User_Id
	ALTER TABLE [dbo].[users_series_rankings] DROP CONSTRAINT FK_USR_Series_Id
	ALTER TABLE [dbo].[users_series_results] DROP CONSTRAINT FK_USRes_Series_Id
	ALTER TABLE [dbo].[users_series_results] DROP CONSTRAINT FK_USRes_UserEvent_Id
	ALTER TABLE [dbo].[users_series_results] DROP CONSTRAINT FK_USRes_User_Id
	ALTER TABLE [dbo].[users_series_results] DROP CONSTRAINT FK_USRes_Rank_Id
	ALTER TABLE [dbo].[users_vehicle_classes] DROP CONSTRAINT FK_UVC_User_Id
	ALTER TABLE [dbo].[users_vehicle_classes] DROP CONSTRAINT FK_UVC_VehClass_Id
	
	TRUNCATE TABLE [dbo].[g_contact_sub_types]
	TRUNCATE TABLE [dbo].[g_contact_types]
	TRUNCATE TABLE [dbo].[g_licence_types]
	TRUNCATE TABLE [dbo].[g_vehicle_parent_classes]
	TRUNCATE TABLE [dbo].[g_vehicle_classes]
	TRUNCATE TABLE [dbo].[clubs]
	TRUNCATE TABLE [dbo].[clubs_classes]
	TRUNCATE TABLE [dbo].[clubs_series]
	TRUNCATE TABLE [dbo].[clubs_series_rules]
	TRUNCATE TABLE [dbo].[clubs_series_events]
	TRUNCATE TABLE [dbo].[clubs_series_events_classes]
	TRUNCATE TABLE [dbo].[clubs_rankings]
	TRUNCATE TABLE [dbo].[shops]
	TRUNCATE TABLE [dbo].[users]
	TRUNCATE TABLE [dbo].[users_vehicle_classes]
	TRUNCATE TABLE [dbo].[users_series_results]
	TRUNCATE TABLE [dbo].[users_series_rankings]
	TRUNCATE TABLE [dbo].[users_series_events]
	TRUNCATE TABLE [dbo].[users_series_events_results]
	TRUNCATE TABLE [dbo].[users_licences]
	TRUNCATE TABLE [dbo].[users_contacts]
	TRUNCATE TABLE [dbo].[users_clubs]

	ALTER TABLE [dbo].[g_contact_sub_types] ADD CONSTRAINT FK_CST_ContactTypeId FOREIGN KEY(ContactTypeId) REFERENCES [dbo].[g_contact_types] (ContactTypeId)
	ALTER TABLE [dbo].[g_vehicle_classes] ADD CONSTRAINT FK_VSC_ParentClassId FOREIGN KEY(ParentClassId) REFERENCES [dbo].[g_vehicle_parent_classes] (ParentClassId)
	ALTER TABLE [dbo].[clubs_classes] ADD CONSTRAINT FK_CC_Club_Id FOREIGN KEY(ClubId) REFERENCES [dbo].[clubs] (ClubId)
	ALTER TABLE [dbo].[clubs_classes] ADD CONSTRAINT FK_CC_VehClass_Id FOREIGN KEY(VehicleClassId) REFERENCES [dbo].[g_vehicle_classes] (VehicleClassId)
	ALTER TABLE [dbo].[clubs_rankings] ADD CONSTRAINT FK_CR_Club_Id FOREIGN KEY(ClubId) REFERENCES [dbo].[clubs] (ClubId)
	ALTER TABLE [dbo].[clubs_series_events] ADD CONSTRAINT FK_CSE_Club_Id FOREIGN KEY(ClubId) REFERENCES [dbo].[clubs] (ClubId)
	ALTER TABLE [dbo].[clubs_series_events] ADD CONSTRAINT FK_CSE_Series_Id FOREIGN KEY(SeriesId) REFERENCES [dbo].[clubs_series] (SeriesId)
	ALTER TABLE [dbo].[clubs_series_events_classes] ADD CONSTRAINT FK_CSEC_VehClass_Id FOREIGN KEY(VehicleClassId) REFERENCES [dbo].[g_vehicle_classes] (VehicleClassId)
	ALTER TABLE [dbo].[clubs_series_events_classes] ADD CONSTRAINT FK_CSEC_Event_Id FOREIGN KEY(EventId) REFERENCES [dbo].[clubs_series_events] (EventId)
	ALTER TABLE [dbo].[clubs_series_rules] ADD CONSTRAINT FK_CSR_Series_Id FOREIGN KEY(SeriesId) REFERENCES [dbo].[clubs_series] (SeriesId)
	ALTER TABLE [dbo].[clubs_series_rules] ADD CONSTRAINT FK_CSR_VehClass_Id FOREIGN KEY(VehicleClassId) REFERENCES [dbo].[g_vehicle_classes] (VehicleClassId)
	ALTER TABLE [dbo].[users_contacts] ADD CONSTRAINT FK_UCon_Contact_Sub_Type_Id FOREIGN KEY(ContactSubTypeId) REFERENCES [dbo].[g_contact_sub_types] (ContactSubTypeId)
	ALTER TABLE [dbo].[users_contacts] ADD CONSTRAINT FK_UCon_Contact_Type_Id FOREIGN KEY(ContactTypeId) REFERENCES [dbo].[g_contact_types] (ContactTypeId)
	ALTER TABLE [dbo].[users_contacts] ADD CONSTRAINT FK_UCon_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_clubs] ADD CONSTRAINT FK_UC_Club_Id FOREIGN KEY(ClubId) REFERENCES [dbo].[clubs] (ClubId)
	ALTER TABLE [dbo].[users_clubs] ADD CONSTRAINT FK_UC_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_licences] ADD CONSTRAINT FK_UL_LicenceId FOREIGN KEY(LicenceId) REFERENCES [dbo].[g_licence_types] (LicenceId)
	ALTER TABLE [dbo].[users_licences] ADD CONSTRAINT FK_UL_UserId FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_series_events] ADD CONSTRAINT FK_USE_EventClass_Id FOREIGN KEY(EventClassId) REFERENCES [dbo].[clubs_series_events_classes] (EventClassId)
	ALTER TABLE [dbo].[users_series_events] ADD CONSTRAINT FK_USE_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_series_events_results] ADD CONSTRAINT FK_USER_UserEvent_Id FOREIGN KEY(UserEventId) REFERENCES [dbo].[users_series_events] (UserEventId)
	ALTER TABLE [dbo].[users_series_events_results] ADD CONSTRAINT FK_USER_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_series_rankings] ADD CONSTRAINT FK_USR_ClubRank_Id FOREIGN KEY([ClubRankId]) REFERENCES [dbo].[clubs_rankings] ([ClubRankId])
	ALTER TABLE [dbo].[users_series_rankings] ADD CONSTRAINT FK_USR_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_series_rankings] ADD CONSTRAINT FK_USR_Series_Id FOREIGN KEY(SeriesId) REFERENCES [dbo].[clubs_series] (SeriesId)
	ALTER TABLE [dbo].[users_series_results] ADD CONSTRAINT FK_USRes_Series_Id FOREIGN KEY(SeriesId) REFERENCES [dbo].[clubs_series] (SeriesId)
	ALTER TABLE [dbo].[users_series_results] ADD CONSTRAINT FK_USRes_UserEvent_Id FOREIGN KEY(UserEventId) REFERENCES [dbo].[users_series_events] (UserEventId)
	ALTER TABLE [dbo].[users_series_results] ADD CONSTRAINT FK_USRes_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_series_results] ADD CONSTRAINT FK_USRes_Rank_Id FOREIGN KEY(ClubRankId) REFERENCES [dbo].[clubs_rankings] (ClubRankId)
	ALTER TABLE [dbo].[users_vehicle_classes] ADD CONSTRAINT FK_UVC_VehClass_Id FOREIGN KEY(VehicleClassId) REFERENCES [dbo].[g_vehicle_classes] (VehicleClassId)
	ALTER TABLE [dbo].[users_vehicle_classes] ADD CONSTRAINT FK_UVC_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	---------------------------------------------------------------- 
END

-- g_contact_types
BEGIN
	DECLARE @JSON varchar(max)
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\g_contact_types.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[g_contact_types] ON
		INSERT INTO [dbo].[g_contact_types] ([ContactTypeId], [Type])
		SELECT [ContactTypeId], [Type]
		FROM OPENJSON(@JSON) WITH (
			[ContactTypeId] [int],
			[Type] [varchar](10)
		)
	SET IDENTITY_INSERT [dbo].[g_contact_types] OFF
END
-- g_contact_sub_types
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\g_contact_sub_types.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[g_contact_sub_types] ON
		INSERT INTO [dbo].[g_contact_sub_types] ([ContactSubTypeId], [ContactTypeId], [Sub_Type])
		SELECT [ContactSubTypeId], [ContactTypeId], [Sub_Type]
		FROM OPENJSON(@JSON) WITH (
			[ContactSubTypeId] [int],
			[ContactTypeId] [int],
			[Sub_Type] [varchar](10)
		)
	SET IDENTITY_INSERT [dbo].[g_contact_sub_types] OFF
END
-- g_licence_types
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\g_licence_types.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[g_licence_types] ON
		INSERT INTO [dbo].[g_licence_types] ([LicenceId], [Licence])
		SELECT [LicenceId], [Licence]
		FROM OPENJSON(@JSON) WITH (
			[LicenceId] [int],
			[Licence] [varchar](255)
		)
	SET IDENTITY_INSERT [dbo].[g_licence_types] OFF
END
-- g_vehicle_parent_classes
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\g_vehicle_parent_classes.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[g_vehicle_parent_classes] ON
		INSERT INTO [dbo].[g_vehicle_parent_classes] ([ParentClassId], [Parent_Class])
		SELECT [ParentClassId], [Parent_Class]
		FROM OPENJSON(@JSON) WITH (
			[ParentClassId] [int],
			[Parent_Class] [varchar](50)
		)
	SET IDENTITY_INSERT [dbo].[g_vehicle_parent_classes] OFF
END
-- g_vehicle_classes
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\g_vehicle_classes.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[g_vehicle_classes] ON
		INSERT INTO [dbo].[g_vehicle_classes] ([VehicleClassId], [ParentClassId], [Class])
		SELECT [VehicleClassId], [ParentClassId], [Class]
		FROM OPENJSON(@JSON) WITH (
			[VehicleClassId] [int],
			[ParentClassId] [int],
			[Class] [varchar](50)
		)
	SET IDENTITY_INSERT [dbo].[g_vehicle_classes] OFF
END
-- shops.json
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\shops.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[shops] ON
		INSERT INTO [dbo].[shops] ([ShopId], [Shop_Name], [Address_1], [Address_2], [Address_3], [City], [County], [PostCode], [Shop_Website], [Shop_Email], [Shop_Telephone], [Start_Date], [End_Date], [Picture])
		SELECT [ShopId], [Shop_Name], [Address_1], [Address_2], [Address_3], [City], [County], [PostCode], [Shop_Website], [Shop_Email], [Shop_Telephone], [Start_Date], [End_Date], [Picture]
		FROM OPENJSON(@JSON) WITH (
			[ShopId] [int],
			[Shop_Name] [varchar](255),
			[Address_1] [varchar](255),
			[Address_2] [varchar](255),
			[Address_3] [varchar](255),
			[City] [varchar](255),
			[County] [varchar](255),
			[PostCode] [varchar](10),
			[Shop_Website] [varchar](255),
			[Shop_Email] [varchar](255) '$.Shop_Email',
			[Shop_Telephone] [varchar](15),
			[Start_Date] [date],
			[End_Date] [date],
			[Picture] [varchar](255)
		)
	SET IDENTITY_INSERT [dbo].[shops] OFF
END
-- clubs
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs] ON
		INSERT INTO [dbo].[clubs] ([ClubId], [Club_Name], [Address_1], [Address_2], [Address_3], [City], [County], [PostCode], [Club_Website], [Club_Email], [Club_Telephone], [Start_Date], [End_Date], [Picture])
		SELECT [ClubId], [Club_Name], [Address_1], [Address_2], [Address_3], [City], [County], [PostCode], [Club_Website], [Club_Email], [Club_Telephone], [Start_Date], [End_Date], [Picture]
		FROM OPENJSON(@JSON) WITH (
			[ClubId] [int],
			[Club_Name] [varchar](255),
			[Address_1] [varchar](255),
			[Address_2] [varchar](255),
			[Address_3] [varchar](255),
			[City] [varchar](255),
			[County] [varchar](255),
			[PostCode] [varchar](10),
			[Club_Website] [varchar](255),
			[Club_Email] [varchar](255) '$.Club_Email',
			[Club_Telephone] [varchar](15),
			[Start_Date] [date],
			[End_Date] [date],
			[Picture] [varchar](255)
		)
	SET IDENTITY_INSERT [dbo].[clubs] OFF
END
-- clubs_classes
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs_classes.json', SINGLE_CLOB) AS import
	
		INSERT INTO [dbo].[clubs_classes] ([ClubId], [VehicleClassId])
		SELECT [ClubId], [VehicleClassId]
		FROM OPENJSON(@JSON) WITH (
			[ClubId] [int],
			[VehicleClassId] [int]
		)
END
-- clubs_rankings
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs_rankings.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs_rankings] ON
		INSERT INTO [dbo].[clubs_rankings] ([ClubRankId], [ClubId], [Rank])
		SELECT [ClubRankId], [ClubId], [Rank]
		FROM OPENJSON(@JSON) WITH (
			[ClubRankId] [int],
			[ClubId] [int],
			[Rank] [varchar](10)
		)
	SET IDENTITY_INSERT [dbo].[clubs_rankings] OFF
END
-- clubs_series
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs_series.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs_series] ON
		INSERT INTO [dbo].[clubs_series] ([SeriesId], [Series_Name], [Series_Start_Date], [Series_End_Date], [Championship], [National_Series])
		SELECT [SeriesId], [Series_Name], [Series_Start_Date], [Series_End_Date], [Championship], [National_Series]
		FROM OPENJSON(@JSON) WITH (
			[SeriesId] [int],
			[Series_Name] [varchar](255),
			[Series_Start_Date] [date],
			[Series_End_Date] [date],
			[Championship] [bit],
			[National_Series] [bit]
		)
	SET IDENTITY_INSERT [dbo].[clubs_series] OFF
END
-- clubs_series_rules
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs_series_rules.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs_series_rules] ON
		INSERT INTO [dbo].[clubs_series_rules] ([SeriesRulesId],[SeriesId], [VehicleClassId], [Ranked], [TQ_Bonus], [Legs], [Legs_No], [Legs_Rules], [Max_Points], [Rounds], [Rounds_To_Count], [Tie_Break_Rule])
		SELECT [SeriesRulesId],[SeriesId], [VehicleClassId], [Ranked], [TQ_Bonus], [Legs], [Legs_No], [Legs_Rules], [Max_Points], [Rounds], [Rounds_To_Count], [Tie_Break_Rule]
		FROM OPENJSON(@JSON) WITH (
			[SeriesRulesId] [int],
			[SeriesId] [int],
			[VehicleClassId] [int],
			[Ranked] [bit],
			[TQ_Bonus] [bit],
			[Legs] [bit],
			[Legs_No] [int],
			[Legs_Rules] [varchar](100),
			[Max_Points] [int],
			[Rounds] [int],
			[Rounds_To_Count] [int],
			[Tie_Break_Rule] [varchar](50)
		)
	SET IDENTITY_INSERT [dbo].[clubs_series_rules] OFF
END
-- users
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[users] ON
		INSERT INTO [dbo].[users] ([UserId], [FirstName], [LastName], [DOB], [Junior], [Sex], [Picture])
		SELECT [UserId], [FirstName], [LastName], [DOB], [Junior], [Sex], [Picture]
		FROM OPENJSON(@JSON) WITH (
			[UserId] [int],
			[FirstName] [varchar](255),
			[LastName] [varchar](255),
			[DOB] [date],
			[Junior] [bit],
			[Sex] [varchar](1),
			[Picture] [varchar](255)
		)
	SET IDENTITY_INSERT [dbo].[users] OFF
END
-- clubs_series_events
BEGIN	
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs_series_events.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs_series_events] ON
		INSERT INTO [dbo].[clubs_series_events] ([EventId],[ClubId], [SeriesId], [Round], [Event_Date], [Event_Name])
		SELECT [EventId],[ClubId], [SeriesId], [Round], [Event_Date], [Event_Name]
		FROM OPENJSON(@JSON) WITH (
			[EventId] [int],
			[ClubId] [int],
			[SeriesId] [int],
			[Round] [int],
			[Event_Date] [date],
			[Event_Name] [varchar](255)
		)
	SET IDENTITY_INSERT [dbo].[clubs_series_events] OFF
END
-- clubs_series_events_classes
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs_series_events_classes.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs_series_events_classes] ON
		INSERT INTO [dbo].[clubs_series_events_classes] ([EventClassId],[EventId], [VehicleClassId])
		SELECT [EventClassId],[EventId], [VehicleClassId]
		FROM OPENJSON(@JSON) WITH (
			[EventClassId] [int],
			[EventId] [int],
			[VehicleClassId] [int]
		)
	SET IDENTITY_INSERT [dbo].[clubs_series_events_classes] OFF
END
-- users_contacts
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_contacts.json', SINGLE_CLOB) AS import
	
		INSERT INTO [dbo].[users_contacts] ([UserId], [ContactTypeId], [ContactSubTypeId], [Contact_Details])
		SELECT [UserId], [ContactTypeId], [ContactSubTypeId], [Contact_Details]
		FROM OPENJSON(@JSON) WITH (
			[UserId] [int],
			[ContactTypeId] [int],
			[ContactSubTypeId] [int],
			[Contact_Details] [varchar](255)
		)
END
-- users_licences
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_licences.json', SINGLE_CLOB) AS import
	
		INSERT INTO [dbo].[users_licences] ([UserId], [LicenceId], [Licence_Refernce])
		SELECT [UserId], [LicenceId], [Licence_Refernce]
		FROM OPENJSON(@JSON) WITH (
			[UserId] [int],
			[LicenceId] [int],
			[Licence_Refernce] varchar(10)
		)
END
-- users_vehicle_classes
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_vehicle_classes.json', SINGLE_CLOB) AS import
	
		INSERT INTO [dbo].[users_vehicle_classes] ([UserId], [VehicleClassId], [Transponder], [Sponsors], [Chassis], [Power], [Tyres])
		SELECT [UserId], [VehicleClassId], [Transponder], [Sponsors], [Chassis], [Power], [Tyres]
		FROM OPENJSON(@JSON) WITH (
			[UserId] [int],
			[VehicleClassId] [int],
			[Transponder] [varchar](10),
			[Sponsors] [varchar](255),
			[Chassis] [varchar](100),
			[Power] [varchar](100),
			[Tyres] [varchar](100)
		)
END
-- users_clubs
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_clubs.json', SINGLE_CLOB) AS import
	
		INSERT INTO [dbo].[users_clubs] ([UserId], [ClubId], [Join_Date])
		SELECT [UserId], [ClubId], [Join_Date]
		FROM OPENJSON(@JSON) WITH (
			[UserId] [int],
			[ClubId] [int],
			[Join_Date] [date]
		)
END
-- users_series_rankings
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_series_rankings.json', SINGLE_CLOB) AS import
	
		INSERT INTO [dbo].[users_series_rankings] ([UserId], [SeriesId], [ClubRankId])
		SELECT [UserId], [SeriesId], [ClubRankId]
		FROM OPENJSON(@JSON) WITH (
			[UserId] [int],
			[SeriesId] [int],
			[ClubRankId] [int]
		)
END
-- users_series_events
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_series_events.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[users_series_events] ON
		INSERT INTO [dbo].[users_series_events] ([UserEventId], [UserId], [EventClassId])
		SELECT [UserEventId], [UserId], [EventClassId]
		FROM OPENJSON(@JSON) WITH (
			[UserEventId] [int],
			[UserId] [int],
			[EventClassId] [int]
		)
	SET IDENTITY_INSERT [dbo].[users_series_events] OFF
END
-- users_series_events_results
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_series_events_results.json', SINGLE_CLOB) AS import
	
		INSERT INTO [dbo].[users_series_events_results] ([UserEventId], [Leg], [Final], [Finish_Position], [Qualify_Position], [UserId], [Result_Laps], [Result_Time], [Best10], [Best], [Series_Calcd])
		SELECT [UserEventId], [Leg], [Final], [Finish_Position], [Qualify_Position], [UserId], [Result_Laps], [Result_Time], [Best10], [Best], [Series_Calcd]
		FROM OPENJSON(@JSON) WITH (
			[UserEventId] [int],
			[Leg] [int],
			[Final] [varchar](1),
			[Finish_Position] [int],
			[Qualify_Position] [int],
			[UserId] [int],
			[Result_Laps] [int],
			[Result_Time] [decimal],
			[Best10] [decimal],
			[Best] [decimal],
			[Series_Calcd] [bit]
		)
END
-- users_series_results
BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\jrhea\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_series_results.json', SINGLE_CLOB) AS import
	
		INSERT INTO [dbo].[users_series_results] ([SeriesId], [UserEventId], [UserId], [Round], [ClubRankId], [Points])
		SELECT [SeriesId], [UserEventId], [UserId], [Round], [ClubRankId], [Points]
		FROM OPENJSON(@JSON) WITH (
			[SeriesId] [int],
			[UserEventId] [int],
			[UserId] [int],
			[Round] [int],
			[ClubRankId] [int],
			[Points] [int]
		)
END