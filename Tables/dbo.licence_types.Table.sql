USE [just_rc_racing]
GO
/****** Object:  Table [dbo].[licence_types]    Script Date: 17/02/2024 14:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[licence_types](
	[LicenceId] [int] IDENTITY(1,1) NOT NULL,
	[Licence] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Licence_Type_id] PRIMARY KEY CLUSTERED 
(
	[LicenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
