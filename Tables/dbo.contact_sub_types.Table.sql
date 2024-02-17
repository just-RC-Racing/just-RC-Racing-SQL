USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[contact_sub_types]    Script Date: 17/02/2024 14:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact_sub_types](
	[ContactSubTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Sub_Type] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Contact_Sub_Types_id] PRIMARY KEY CLUSTERED 
(
	[ContactSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
