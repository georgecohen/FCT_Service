USE [FCT]
GO
/****** Object:  User [fctweb]    Script Date: 12/21/2019 6:33:53 PM ******/
CREATE USER [fctweb] FOR LOGIN [fctweb] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [fctweb]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/21/2019 6:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Token] [text] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/21/2019 6:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Price] [money] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 12/21/2019 6:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[Price] [money] NULL,
	[Quantity] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([ID], [Name], [Email], [Password], [Token]) VALUES (1, N'John Smith', N'testclient@abc.com', N'~Fall2017', NULL)
GO
INSERT [dbo].[Customers] ([ID], [Name], [Email], [Password], [Token]) VALUES (2, N'Tom Lee', N'test@abc.com', N'password', NULL)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (1, N'Christmas Socks', 10.2500, N'Christmas Santa Socks, Small size')
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (2, N'Travel Mug', 16.2700, N'Ello Cole Vacuum-Insulated Stainless Steel Travel Mug')
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (3, N'Brother HL-L2320D Monochrome Laser Printer with Duplex Printing', 105.9900, N'Fast black printing - up to 30ppm, Automatic two-sided printing ; Printer Driver Compatibility')
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (4, N'HP Spectre x360 13" Touchscreen Laptop (Intel Core i7-8565U, 8GB SDRAM, 256GB SSD) 13-ap0010ca', 1648.0000, N'Elevate your every day with the most stunning Spectre yet¡ªfeaturing the latest Quad-Core 8th generation Intel Core i7 processor for top-of-the-line efficiency and speed.')
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (5, N'Dell Optiplex 9010 Desktop Computer, Intel Quad-Core i7-3770 Up to 3.9GHz, 16GB RAM, 2TB 7200 RPM HDD, DVD, USB 3.0, WiFi, Windows 10 Pro (Renewed) (9010 I7)', 520.0000, N'Product works and looks like new. Comes with a 90-day warranty. Dell 9010 Intel I7 Quad-Core 3.4 GHz Processor')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchases] ON 
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (4, 1, 5, 520.0000, 2, CAST(N'2019-12-21T14:09:10.470' AS DateTime))
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (5, 1, 4, 1648.0000, 2, CAST(N'2019-12-21T14:09:10.937' AS DateTime))
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (6, 1, 3, 105.9900, 1, CAST(N'2019-12-21T14:09:42.453' AS DateTime))
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (7, 1, 2, 16.2700, 1, CAST(N'2019-12-21T14:09:42.477' AS DateTime))
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (8, 1, 1, 10.2500, 1, CAST(N'2019-12-21T14:12:00.367' AS DateTime))
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (9, 1, 3, 105.9900, 1, CAST(N'2019-12-21T15:55:51.650' AS DateTime))
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (10, 1, 4, 1648.0000, 1, CAST(N'2019-12-21T15:55:51.707' AS DateTime))
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (11, 2, 2, 16.2700, 2, CAST(N'2019-12-21T16:20:17.760' AS DateTime))
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (12, 2, 4, 1648.0000, 1, CAST(N'2019-12-21T16:20:17.783' AS DateTime))
GO
INSERT [dbo].[Purchases] ([ID], [UserID], [ProductID], [Price], [Quantity], [DateCreated]) VALUES (13, 2, 5, 520.0000, 3, CAST(N'2019-12-21T17:15:03.907' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Purchases] OFF
GO
ALTER TABLE [dbo].[Purchases] ADD  CONSTRAINT [DF_Purchases_DataCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Customer] FOREIGN KEY([UserID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchase_Customer]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchase_Product]
GO
