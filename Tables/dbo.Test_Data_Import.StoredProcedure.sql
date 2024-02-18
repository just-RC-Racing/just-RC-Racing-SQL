USE [just_rc_racing]
GO
/****** Object:  StoredProcedure [dbo].[Test_Data_Import]    Script Date: 18/02/2024 10:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Justin Heath
-- Create date: 17-02-2024
-- Description:	Import Test Data
-- EXEC [dbo].[Test_Data_Import]
-- =============================================
CREATE PROCEDURE [dbo].[Test_Data_Import] 
AS
BEGIN
	-- RESET ALL TABLES --------------------------------------------
	ALTER TABLE [dbo].[clubs_events] DROP CONSTRAINT FK_CE_Club_Id
	ALTER TABLE [dbo].[users_clubs] DROP CONSTRAINT FK_UC_Club_Id
	ALTER TABLE [dbo].[users_vehicle_classes] DROP CONSTRAINT FK_UVC_Class_Id
	ALTER TABLE [dbo].[clubs_events_classes] DROP CONSTRAINT FK_CEC_Class_Id
	ALTER TABLE [dbo].[users_contacts] DROP CONSTRAINT FK_UCon_Contact_Sub_Type_Id
	ALTER TABLE [dbo].[users_contacts] DROP CONSTRAINT FK_UCon_Contact_Type_Id
	ALTER TABLE [dbo].[users_events] DROP CONSTRAINT FK_UE_Event_Class_Id
	ALTER TABLE [dbo].[clubs_events_classes] DROP CONSTRAINT FK_CEC_Event_Id
	ALTER TABLE [dbo].[users_events_results] DROP CONSTRAINT FK_UER_Event_User_Id
	ALTER TABLE [dbo].[users_licences] DROP CONSTRAINT FK_UL_LicenceId
	ALTER TABLE [dbo].[users_clubs] DROP CONSTRAINT FK_UC_User_Id
	ALTER TABLE [dbo].[users_contacts] DROP CONSTRAINT FK_UCon_User_Id
	ALTER TABLE [dbo].[users_events] DROP CONSTRAINT FK_UE_User_Id
	ALTER TABLE [dbo].[users_licences] DROP CONSTRAINT FK_UL_UserId
	ALTER TABLE [dbo].[users_vehicle_classes] DROP CONSTRAINT FK_UVC_User_Id
	ALTER TABLE [dbo].[clubs_events] DROP CONSTRAINT FK_CE_Series_Id
	ALTER TABLE [dbo].[contact_sub_types] DROP CONSTRAINT FK_CST_ContactTypeId
	
	TRUNCATE TABLE [dbo].[clubs]
	TRUNCATE TABLE [dbo].[clubs_events]
	TRUNCATE TABLE [dbo].[clubs_events_classes]
	TRUNCATE TABLE [dbo].[clubs_events_series]
	TRUNCATE TABLE [dbo].[contact_sub_types]
	TRUNCATE TABLE [dbo].[contact_types]
	TRUNCATE TABLE [dbo].[licence_types]
	TRUNCATE TABLE [dbo].[users]
	TRUNCATE TABLE [dbo].[users_clubs]
	TRUNCATE TABLE [dbo].[users_contacts]
	TRUNCATE TABLE [dbo].[users_events]
	TRUNCATE TABLE [dbo].[users_events_results]
	TRUNCATE TABLE [dbo].[users_licences]
	TRUNCATE TABLE [dbo].[users_vehicle_classes]
	TRUNCATE TABLE [dbo].[vehicle_classes]

	ALTER TABLE [dbo].[clubs_events] ADD CONSTRAINT FK_CE_Club_Id FOREIGN KEY(ClubId) REFERENCES [dbo].[clubs] (ClubId)
	ALTER TABLE [dbo].[users_clubs] ADD CONSTRAINT FK_UC_Club_Id FOREIGN KEY(ClubId) REFERENCES [dbo].[clubs] (ClubId)
	ALTER TABLE [dbo].[users_vehicle_classes] ADD CONSTRAINT FK_UVC_Class_Id FOREIGN KEY(VehicleClassId) REFERENCES [dbo].[vehicle_classes] (VehicleClassId)
	ALTER TABLE [dbo].[clubs_events_classes] ADD CONSTRAINT FK_CEC_Class_Id FOREIGN KEY(VehicleClassId) REFERENCES [dbo].[vehicle_classes] (VehicleClassId)
	ALTER TABLE [dbo].[users_contacts] ADD CONSTRAINT FK_UCon_Contact_Sub_Type_Id FOREIGN KEY(ContactSubTypeId) REFERENCES [dbo].[contact_sub_types] (ContactSubTypeId)
	ALTER TABLE [dbo].[users_contacts] ADD CONSTRAINT FK_UCon_Contact_Type_Id FOREIGN KEY(ContactTypeId) REFERENCES [dbo].[contact_types] (ContactTypeId)
	ALTER TABLE [dbo].[users_events] ADD CONSTRAINT FK_UE_Event_Class_Id FOREIGN KEY(EventClassId) REFERENCES [dbo].[clubs_events_classes] (EventClassId)
	ALTER TABLE [dbo].[clubs_events_classes] ADD CONSTRAINT FK_CEC_Event_Id FOREIGN KEY(EventId) REFERENCES [dbo].[clubs_events] (EventId)
	ALTER TABLE [dbo].[users_events_results] ADD CONSTRAINT FK_UER_Event_User_Id FOREIGN KEY(UserEventId) REFERENCES [dbo].[users_events] (UserEventId)
	ALTER TABLE [dbo].[users_licences] ADD CONSTRAINT FK_UL_LicenceId FOREIGN KEY(LicenceId) REFERENCES [dbo].[licence_types] (LicenceId)
	ALTER TABLE [dbo].[users_clubs] ADD CONSTRAINT FK_UC_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_contacts] ADD CONSTRAINT FK_UCon_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_events] ADD CONSTRAINT FK_UE_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_licences] ADD CONSTRAINT FK_UL_UserId FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[users_vehicle_classes] ADD CONSTRAINT FK_UVC_User_Id FOREIGN KEY(UserId) REFERENCES [dbo].[users] (UserId)
	ALTER TABLE [dbo].[clubs_events] ADD CONSTRAINT FK_CE_Series_Id FOREIGN KEY(SeriesId) REFERENCES [dbo].[clubs_events_series] (SeriesId)
	ALTER TABLE [dbo].[contact_sub_types] ADD CONSTRAINT FK_CST_ContactTypeId FOREIGN KEY(ContactTypeId) REFERENCES [dbo].[contact_types] (ContactTypeId)
	---------------------------------------------------------------- 
END

BEGIN
	DECLARE @JSON varchar(max)
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs] ON
		INSERT INTO [dbo].[clubs] ([ClubId],[Club_Name],[Club_Address],[Club_Website],[Club_Email],[Club_Telephone],[Start_Date],[End_Date],[Picture])
		SELECT [ClubId],[Club_Name],[Club_Address],[Club_Website],[Club_Email],[Club_Telephone],[Start_Date],[End_Date],[Picture]
		FROM OPENJSON(@JSON) WITH (
			[ClubId] [int],
			[Club_Name] [varchar](255),
			[Club_Address] [varchar](255),
			[Club_Website] [varchar](255),
			[Club_Email] [varchar](255),
			[Club_Telephone] [varchar](15),
			[Start_Date] [date],
			[End_Date] [date],
			[Picture] [varchar](255)
		)
	SET IDENTITY_INSERT [dbo].[clubs] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs_events_series.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs_events_series] ON
		INSERT INTO [dbo].[clubs_events_series] ([SeriesId], [Series_Name], [Series_Start_Date], [Series_End_Date])
		SELECT [SeriesId], [Series_Name], [Series_Start_Date], [Series_End_Date]
		FROM OPENJSON(@JSON) WITH (
			[SeriesId] [int],
			[Series_Name] [varchar](255),
			[Series_Start_Date] [date],
			[Series_End_Date] [date]
		)
	SET IDENTITY_INSERT [dbo].[clubs_events_series] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\contact_types.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[contact_types] ON
		INSERT INTO [dbo].[contact_types] ([ContactTypeId], [Type])
		SELECT [ContactTypeId], [Type]
		FROM OPENJSON(@JSON) WITH (
			[ContactTypeId] [int],
			[Type] [varchar](10)
		)
	SET IDENTITY_INSERT [dbo].[contact_types] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\licence_types.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[licence_types] ON
		INSERT INTO [dbo].[licence_types] ([LicenceId], [Licence])
		SELECT [LicenceId], [Licence]
		FROM OPENJSON(@JSON) WITH (
			[LicenceId] [int],
			[Licence] [varchar](255)
		)
	SET IDENTITY_INSERT [dbo].[licence_types] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[users] ON
		INSERT INTO [dbo].[users] ([UserId], [FirstName], [LastName], [DOB], [Sex], [Picture])
		SELECT [UserId], [FirstName], [LastName], [DOB], [Sex], [Picture]
		FROM OPENJSON(@JSON) WITH (
			[UserId] [int],
			[FirstName] [varchar](255),
			[LastName] [varchar](255),
			[DOB] [date],
			[Sex] [varchar](1),
			[Picture] [varchar](255)
		)
	SET IDENTITY_INSERT [dbo].[users] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\vehicle_classes.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[vehicle_classes] ON
		INSERT INTO [dbo].[vehicle_classes] ([VehicleClassId], [Class])
		SELECT [VehicleClassId], [Class]
		FROM OPENJSON(@JSON) WITH (
			[VehicleClassId] [int],
			[Class] [varchar](50)
		)
	SET IDENTITY_INSERT [dbo].[vehicle_classes] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs_events.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs_events] ON
		INSERT INTO [dbo].[clubs_events] ([EventId],[ClubId], [SeriesId], [Event_Date], [Event_Name])
		SELECT [EventId],[ClubId], [SeriesId], [Event_Date], [Event_Name]
		FROM OPENJSON(@JSON) WITH (
			[EventId] [int],
			[ClubId] [int],
			[SeriesId] [int],
			[Event_Date] [date],
			[Event_Name] [varchar](255)
		)
	SET IDENTITY_INSERT [dbo].[clubs_events] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\clubs_events_classes.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[clubs_events_classes] ON
		INSERT INTO [dbo].[clubs_events_classes] ([EventClassId],[EventId], [VehicleClassId])
		SELECT [EventClassId],[EventId], [VehicleClassId]
		FROM OPENJSON(@JSON) WITH (
			[EventClassId] [int],
			[EventId] [int],
			[VehicleClassId] [int]
		)
	SET IDENTITY_INSERT [dbo].[clubs_events_classes] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\contact_sub_types.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[contact_sub_types] ON
		INSERT INTO [dbo].[contact_sub_types] ([ContactSubTypeId], [ContactTypeId], [Sub_Type])
		SELECT [ContactSubTypeId], [ContactTypeId], [Sub_Type]
		FROM OPENJSON(@JSON) WITH (
			[ContactSubTypeId] [int],
			[ContactTypeId] [int],
			[Sub_Type] [varchar](10)
		)
	SET IDENTITY_INSERT [dbo].[contact_sub_types] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_clubs.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[users_clubs] ON
		INSERT INTO [dbo].[users_clubs] ([id], [UserId], [ClubId], [Join_Date])
		SELECT [id], [UserId], [ClubId], [Join_Date]
		FROM OPENJSON(@JSON) WITH (
			[id] [int],
			[UserId] [int],
			[ClubId] [int],
			[Join_Date] [date]
		)
	SET IDENTITY_INSERT [dbo].[users_clubs] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_contacts.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[users_contacts] ON
		INSERT INTO [dbo].[users_contacts] ([id], [UserId], [ContactTypeId], [ContactSubTypeId], [Contact_Details])
		SELECT [id], [UserId], [ContactTypeId], [ContactSubTypeId], [Contact_Details]
		FROM OPENJSON(@JSON) WITH (
			[id] [int],
			[UserId] [int],
			[ContactTypeId] [int],
			[ContactSubTypeId] [int],
			[Contact_Details] [varchar](10)
		)
	SET IDENTITY_INSERT [dbo].[users_contacts] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_events.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[users_events] ON
		INSERT INTO [dbo].[users_events] ([UserEventId], [UserId], [EventClassId])
		SELECT [UserEventId], [UserId], [EventClassId]
		FROM OPENJSON(@JSON) WITH (
			[UserEventId] [int],
			[UserId] [int],
			[EventClassId] [int]
		)
	SET IDENTITY_INSERT [dbo].[users_events] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_events_results.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[users_events_results] ON
		INSERT INTO [dbo].[users_events_results] ([id], [UserEventId], [Final], [Leg], [Qualify_Position], [Finish_Position])
		SELECT [id], [UserEventId], [Final], [Leg], [Qualify_Position], [Finish_Position]
		FROM OPENJSON(@JSON) WITH (
			[id] [int],
			[UserEventId] [int],
			[Final] [varchar](1),
			[Leg] [int],
			[Qualify_Position] [int],
			[Finish_Position] [int]
		)
	SET IDENTITY_INSERT [dbo].[users_events_results] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_licences.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[users_licences] ON
		INSERT INTO [dbo].[users_licences] ([id], [UserId], [LicenceId], [Licence_Refernce])
		SELECT [id], [UserId], [LicenceId], [Licence_Refernce]
		FROM OPENJSON(@JSON) WITH (
			[id] [int],
			[UserId] [int],
			[LicenceId] [int],
			[Licence_Refernce] varchar(10)
		)
	SET IDENTITY_INSERT [dbo].[users_licences] OFF
END

BEGIN
	SELECT @JSON = BulkColumn
	FROM OPENROWSET(BULK 'C:\Users\JustinHeath\Documents\00-Repositories\04-JustRCRacing\just-RC-Racing-SQL\_Data\users_vehicle_classes.json', SINGLE_CLOB) AS import
	
	SET IDENTITY_INSERT [dbo].[users_vehicle_classes] ON
		INSERT INTO [dbo].[users_vehicle_classes] ([id], [UserId], [VehicleClassId], [Transponder])
		SELECT [id], [UserId], [VehicleClassId], [Transponder]
		FROM OPENJSON(@JSON) WITH (
			[id] [int],
			[UserId] [int],
			[VehicleClassId] [int],
			[Transponder] [varchar](10)
		)
	SET IDENTITY_INSERT [dbo].[users_vehicle_classes] OFF
END


GO
