USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[g_contact_types]    Script Date: 26/02/2024 20:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[g_contact_types](
	[ContactTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Contact_Types_id] PRIMARY KEY CLUSTERED 
(
	[ContactTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
