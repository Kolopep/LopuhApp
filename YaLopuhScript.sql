USE [LopushokShop]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 3/4/2023 1:52:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 3/4/2023 1:52:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 3/4/2023 1:52:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 3/4/2023 1:52:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/4/2023 1:52:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (1, N'С1ованный материал серый 0x2', 5, N' м', 140, 49, N'', CAST(33128.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (2, N'2 бумаги зеленый 1x1', 3, N' м', 634, 36, N'', CAST(26841.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (3, N'С1ованный материал розовый 2x1', 8, N' м', 636, 21, N'', CAST(52606.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (4, N'3 для бумаги розовый 2x2', 10, N' л', 661, 16, N'', CAST(10608.00 AS Decimal(10, 2)), N'', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (5, N'С1ованный материал белый 1x1', 7, N' кг', 843, 16, N'', CAST(43440.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (6, N'2 бумаги белый 1x0', 1, N' м', 501, 49, N'', CAST(15833.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (7, N'Переработка бумаги синий 0x3', 9, N' м', 958, 32, N'', CAST(14180.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (8, N'2 бумаги цветной 2x0', 3, N' м', 386, 46, N'', CAST(35544.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (9, N'2 бумаги зеленый 2x2', 8, N' кг', 593, 20, N'', CAST(55016.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (10, N'2 бумаги белый 3x2', 4, N' кг', 16, 31, N'', CAST(53759.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (11, N'Переработка бумаги серый 3x3', 10, N' м', 89, 20, N'', CAST(49391.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (12, N'3 для бумаги синий 1x2', 6, N' л', 112, 34, N'', CAST(25624.00 AS Decimal(10, 2)), N'', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (13, N'2 бумаги серый 3x3', 3, N' м', 596, 8, N'', CAST(50247.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (14, N'С1ованный материал цветной 1x3', 3, N' м', 772, 40, N'', CAST(51672.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (15, N'2 бумаги синий 2x2', 6, N' кг', 363, 47, N'', CAST(38450.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (16, N'3 для бумаги розовый 0x3', 4, N' л', 379, 41, N'', CAST(3868.00 AS Decimal(10, 2)), N'', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (17, N'Переработка бумаги цветной 1x3', 6, N' кг', 32, 34, N'', CAST(37930.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (18, N'3 для бумаги цветной 0x1', 5, N' л', 759, 28, N'', CAST(9216.00 AS Decimal(10, 2)), N'', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (19, N'2 бумаги цветной 1x2', 10, N' м', 246, 37, N'', CAST(5016.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (20, N'Переработка бумаги серый 1x2', 8, N' м', 516, 49, N'', CAST(35981.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (21, N'С1ованный материал синий 0x2', 3, N' кг', 514, 40, N'', CAST(6555.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (22, N'Переработка бумаги синий 1x2', 4, N' м', 81, 32, N'', CAST(47873.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (23, N'С1ованный материал цветной 1x2', 1, N' м', 429, 47, N'', CAST(15802.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (24, N'2 бумаги розовый 2x1', 1, N' м', 349, 9, N'', CAST(36163.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (25, N'2 бумаги белый 3x3', 2, N' кг', 201, 46, N'', CAST(51261.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (26, N'2 бумаги цветной 2x2', 10, N' кг', 534, 46, N'', CAST(50776.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (27, N'С1ованный материал розовый 2x3', 3, N' м', 552, 7, N'', CAST(4657.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (28, N'2 бумаги розовый 3x2', 9, N' м', 144, 41, N'', CAST(51776.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (29, N'Переработка бумаги синий 0x1', 7, N' м', 97, 30, N'', CAST(47937.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (30, N'С1ованный материал розовый 1x2', 7, N' м', 509, 26, N'', CAST(10604.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (31, N'2 бумаги цветной 1x3', 10, N' кг', 149, 13, N'', CAST(22724.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (32, N'2 бумаги синий 3x2', 9, N' м', 508, 16, N'', CAST(25561.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (33, N'2 бумаги зеленый 2x3', 2, N' м', 181, 35, N'', CAST(45388.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (34, N'3 для бумаги розовый 0x2', 7, N' кг', 37, 50, N'', CAST(17227.00 AS Decimal(10, 2)), N'', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (35, N'Переработка бумаги цветной 0x0', 9, N' м', 508, 19, N'', CAST(51147.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (36, N'Переработка бумаги серый 0x2', 3, N' м', 167, 17, N'', CAST(10248.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (37, N'3 для бумаги цветной 0x3', 10, N' кг', 962, 33, N'', CAST(35922.00 AS Decimal(10, 2)), N'', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (38, N'2 бумаги зеленый 3x3', 3, N' м', 861, 45, N'', CAST(37283.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (39, N'2 бумаги белый 0x3', 2, N' м', 933, 50, N'', CAST(7253.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (40, N'2 бумаги синий 3x1', 3, N' м', 720, 11, N'', CAST(44675.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (41, N'С1ованный материал белый 3x3', 8, N' м', 942, 12, N'', CAST(17600.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (42, N'2 бумаги белый 1x3', 2, N' кг', 382, 10, N'', CAST(32770.00 AS Decimal(10, 2)), N'', 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (43, N'Переработка бумаги белый 3x0', 10, N' м', 247, 11, N'', CAST(39500.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (44, N'3 для бумаги синий 1x3', 10, N' л', 841, 18, N'', CAST(38700.00 AS Decimal(10, 2)), N'', 3)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (45, N'С1ованный материал синий 3x1', 10, N' м', 270, 50, N'', CAST(38809.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (46, N'С1ованный материал цветной 0x0', 6, N' м', 754, 24, N'', CAST(4611.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (47, N'Переработка бумаги цветной 0x1', 8, N' м', 833, 34, N'', CAST(53875.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (48, N'С1ованный материал цветной 1x0', 8, N' м', 856, 26, N'', CAST(12817.00 AS Decimal(10, 2)), N'', 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (49, N'Переработка бумаги синий 0x2', 9, N' кг', 709, 47, N'', CAST(23157.00 AS Decimal(10, 2)), N'', 4)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (50, N'Переработка бумаги белый 2x0', 5, N' м', 794, 17, N'', CAST(21637.00 AS Decimal(10, 2)), N'', 4)
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Пресс', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Рулон', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Гранулы', NULL)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (4, N'Нарезка', NULL)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Набор 24М Дыня', 2, N'337632', N'', N'\products\paper_20.jpeg', 5, 5, CAST(11471.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Набор 9М Бриз', 2, N'259548', N'', NULL, 4, 5, CAST(2317.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Набор 50М Клубника', 3, N'278721', N'', NULL, 3, 1, CAST(14220.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Полотенце 24М Дыня', 2, N'264493', N'', NULL, 5, 10, CAST(10479.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Бумага 21М Дыня', 4, N'366160', N'', NULL, 1, 2, CAST(11064.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Полотенце 37М Клубника', 5, N'292358', N'', N'\products\paper_2.jpeg', 4, 2, CAST(3961.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Набор 6М Бриз', 5, N'289779', N'', NULL, 1, 6, CAST(14154.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Бумага 37М Клубника', 3, N'442634', N'', NULL, 5, 4, CAST(12664.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Набор 41М Дыня', 5, N'385037', N'', N'\products\paper_14.jpeg', 5, 9, CAST(3295.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Бумага 26М Ваниль', 4, N'444337', N'', N'\products\paper_21.jpeg', 4, 4, CAST(3007.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Бумага 50М Ваниль', 3, N'454479', N'', NULL, 3, 9, CAST(3163.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Набор 25М Бриз', 5, N'434113', N'', NULL, 4, 4, CAST(13047.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Бумага 32М Бриз', 3, N'379800', N'', NULL, 1, 7, CAST(6832.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Полотенце 41М Дыня', 3, N'239349', N'', NULL, 2, 9, CAST(6238.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Бумага 9М Ваниль', 3, N'446348', N'', NULL, 3, 1, CAST(13568.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Бумага 3М Бриз', 2, N'260492', N'', NULL, 1, 9, CAST(8278.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Бумага 5М Дыня', 5, N'256862', N'', NULL, 5, 5, CAST(3712.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Полотенце 16М Ваниль', 4, N'259488', N'', N'\products\paper_5.jpeg', 3, 6, CAST(10095.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Бумага 44М Бриз', 5, N'422185', N'', NULL, 2, 5, CAST(6441.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Набор 19М Дыня', 4, N'382063', N'', NULL, 1, 7, CAST(2373.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Бумага 29М Клубника', 5, N'334943', N'', NULL, 1, 10, CAST(5997.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Полотенце 27М Дыня', 2, N'238686', N'', NULL, 2, 2, CAST(7864.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Набор 11М Дыня', 2, N'450659', N'', NULL, 3, 7, CAST(5956.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Полотенце 48М Клубника', 4, N'292206', N'', N'\products\paper_16.jpeg', 3, 3, CAST(9801.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Полотенце 16М Бриз', 1, N'418298', N'', NULL, 2, 1, CAST(7342.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Полотенце 14М Клубника', 2, N'309862', N'', NULL, 4, 8, CAST(10682.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Полотенце 43М Клубника', 4, N'425641', N'', N'\products\paper_17.jpeg', 2, 6, CAST(14151.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Набор 19М Бриз', 3, N'277950', N'', NULL, 5, 9, CAST(9962.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Набор 32М Клубника', 4, N'351062', N'', NULL, 3, 8, CAST(4450.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Набор 26М Дыня', 2, N'279801', N'', NULL, 2, 1, CAST(4628.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Бумага 15М Клубника', 2, N'449359', N'', NULL, 3, 7, CAST(10009.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Полотенце 45М Бриз', 3, N'303994', N'', NULL, 2, 1, CAST(13081.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Набор 50М Бриз', 2, N'414595', N'', N'\products\paper_6.jpeg', 4, 6, CAST(10750.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Набор 16М Дыня', 5, N'376834', N'', N'\products\paper_8.jpeg', 4, 6, CAST(11927.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Бумага 45М Бриз', 3, N'374276', N'', NULL, 3, 9, CAST(13605.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Бумага 45М Клубника', 4, N'400484', N'', NULL, 3, 4, CAST(3475.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Бумага 16М Дыня', 4, N'262257', N'', NULL, 5, 2, CAST(9107.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Набор 40М Дыня', 3, N'346154', N'', NULL, 4, 8, CAST(3427.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Бумага 33М Бриз', 2, N'347239', N'', NULL, 5, 9, CAST(13767.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Полотенце 45М Клубника', 1, N'352034', N'', NULL, 2, 5, CAST(11939.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Набор 43М Клубника', 5, N'443538', N'', NULL, 1, 10, CAST(13786.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Набор 34М Ваниль', 4, N'316033', N'', NULL, 1, 4, CAST(13533.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Бумага 32М Дыня', 5, N'268393', N'', NULL, 4, 3, CAST(7424.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Бумага 12М Бриз', 5, N'426804', N'', NULL, 1, 4, CAST(10703.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Полотенце 6М Ваниль', 2, N'324941', N'', NULL, 1, 2, CAST(5594.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Полотенце 47М Клубника', 5, N'378723', N'', NULL, 4, 2, CAST(3871.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Полотенце 15М Бриз', 5, N'365615', N'', NULL, 1, 6, CAST(13013.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Набор 9М Дыня', 5, N'440942', N'', NULL, 3, 4, CAST(2580.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Набор 17М Клубника', 4, N'441239', N'', NULL, 2, 10, CAST(14863.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (51, N'Набор 5М Бриз', 2, N'278382', N'', NULL, 3, 9, CAST(7325.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (52, N'Набор 29М Ваниль', 1, N'344868', N'', NULL, 1, 9, CAST(7618.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (53, N'Набор 31М Дыня', 5, N'449401', N'', N'\products\paper_4.jpeg', 5, 10, CAST(5236.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (54, N'Набор 45М Бриз', 2, N'349802', N'', NULL, 1, 8, CAST(12040.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (55, N'Бумага 13М Дыня', 1, N'348651', N'', NULL, 3, 8, CAST(3477.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (56, N'Набор 24М Клубника', 3, N'296007', N'', NULL, 2, 3, CAST(14162.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (57, N'Набор 10М Дыня', 5, N'431234', N'', NULL, 4, 9, CAST(3816.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (58, N'Бумага 12М Клубника', 5, N'456129', N'', N'\products\paper_22.jpeg', 3, 4, CAST(6467.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (59, N'Полотенце 11М Дыня', 4, N'400418', N'', N'\products\paper_1.jpeg', 2, 7, CAST(11660.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (60, N'Набор 42М Дыня', 3, N'390914', N'', N'\products\paper_25.jpeg', 5, 10, CAST(14344.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (61, N'Бумага 5М Бриз', 5, N'345239', N'', N'\products\paper_13.jpeg', 1, 8, CAST(9243.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (62, N'Набор 14М Дыня', 1, N'373939', N'', NULL, 2, 3, CAST(3382.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (63, N'Бумага 33М Клубника', 1, N'252485', N'', NULL, 3, 6, CAST(4240.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (64, N'Набор 34М Клубника', 2, N'381110', N'', N'\products\paper_0.jpeg', 3, 1, CAST(2372.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (65, N'Полотенце 14М Дыня', 2, N'331688', N'', NULL, 2, 8, CAST(10330.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (66, N'Бумага 40М Бриз', 2, N'326200', N'', NULL, 5, 1, CAST(12927.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (67, N'Бумага 20М Клубника', 5, N'253218', N'', N'\products\paper_19.jpeg', 2, 6, CAST(11684.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (68, N'Бумага 50М Бриз', 3, N'340583', N'', NULL, 4, 7, CAST(6788.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (69, N'Полотенце 23М Ваниль', 1, N'437519', N'', N'\products\paper_15.jpeg', 1, 10, CAST(3317.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (70, N'Набор 8М Дыня', 5, N'240580', N'', NULL, 5, 2, CAST(7465.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (71, N'Бумага 10М Клубника', 2, N'275591', N'', NULL, 4, 8, CAST(13600.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (72, N'Набор 41М Клубника', 4, N'281425', N'', N'\products\paper_7.jpeg', 4, 6, CAST(9908.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (73, N'Набор 10М Ваниль', 4, N'261465', N'', N'\products\paper_23.jpeg', 5, 3, CAST(13028.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (74, N'Полотенце 17М Бриз', 2, N'309067', N'', N'\products\paper_12.jpeg', 1, 6, CAST(13825.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (75, N'Полотенце 27М Ваниль', 2, N'278463', N'', N'\products\paper_24.jpeg', 3, 5, CAST(3978.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (76, N'Полотенце 50М Ваниль', 1, N'310212', N'', N'\products\paper_10.jpeg', 1, 10, CAST(13204.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (77, N'Набор 20М Бриз', 5, N'377042', N'', N'\products\paper_11.jpeg', 5, 9, CAST(9227.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (78, N'Полотенце 47М Дыня', 4, N'294441', N'', N'\products\paper_9.jpeg', 4, 5, CAST(11460.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (79, N'Бумага 29М Дыня', 1, N'332522', N'', NULL, 3, 6, CAST(5439.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (80, N'Полотенце 44М Ваниль', 5, N'357053', N'', N'\products\paper_18.jpeg', 5, 1, CAST(3396.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (81, N'Полотенце 7М Ваниль', 3, N'397143', N'', NULL, 2, 9, CAST(2868.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (82, N'Бумага 49М Бриз', 1, N'414339', N'', NULL, 1, 6, CAST(10786.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (83, N'Полотенце 7М Бриз', 2, N'350515', N'', NULL, 2, 2, CAST(4986.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (84, N'Полотенце 25М Бриз', 1, N'258695', N'', NULL, 1, 8, CAST(3631.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (85, N'Полотенце 17М Ваниль', 4, N'403054', N'', NULL, 2, 9, CAST(5048.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (86, N'Бумага 14М Бриз', 3, N'310507', N'', NULL, 1, 3, CAST(7846.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (87, N'Набор 40М Бриз', 2, N'353930', N'', NULL, 2, 8, CAST(12767.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (88, N'Набор 22М Клубника', 1, N'360424', N'', NULL, 4, 3, CAST(13524.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (89, N'Бумага 13М Бриз', 2, N'349861', N'', NULL, 4, 6, CAST(3842.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (90, N'Бумага 7М Ваниль', 4, N'290729', N'', NULL, 4, 4, CAST(6934.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (91, N'Набор 24М Ваниль', 5, N'374263', N'', NULL, 5, 9, CAST(3907.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (92, N'Набор 43М Дыня', 1, N'330360', N'', NULL, 5, 4, CAST(5867.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (93, N'Полотенце 33М Бриз', 4, N'297840', N'', NULL, 4, 1, CAST(4611.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (94, N'Набор 12М Бриз', 3, N'349614', N'', NULL, 1, 7, CAST(2551.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (95, N'Бумага 38М Ваниль', 1, N'416066', N'', N'\products\paper_3.jpeg', 2, 2, CAST(12175.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (96, N'Бумага 20М Бриз', 3, N'285792', N'', NULL, 3, 7, CAST(14370.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (97, N'Бумага 28М Дыня', 3, N'298632', N'', NULL, 4, 4, CAST(14671.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (98, N'Бумага 10М Дыня', 5, N'446103', N'', NULL, 1, 3, CAST(13975.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (99, N'Набор 22М Бриз', 3, N'443382', N'', NULL, 3, 5, CAST(4501.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (100, N'Набор 18М Ваниль', 1, N'331270', N'', NULL, 4, 8, CAST(11171.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (101, N's3', 1, N'1', N'1', NULL, 1, 1, CAST(1.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 2, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 41, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 42, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 2, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (4, 1, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (4, 22, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 2, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 6, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 20, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 1, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 4, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 31, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (7, 3, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (8, 5, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (8, 13, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (8, 21, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (8, 30, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (9, 4, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (9, 14, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (9, 35, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 7, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 13, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 20, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 23, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 37, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (11, 5, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (11, 12, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (11, 37, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (11, 38, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (12, 4, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (13, 6, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (14, 6, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (15, 6, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (15, 12, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (15, 27, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (16, 8, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (16, 9, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (16, 19, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (17, 10, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (17, 29, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (18, 11, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (19, 11, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (19, 23, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (19, 30, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (19, 33, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (19, 38, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (20, 11, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (20, 25, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (20, 35, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (21, 8, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (21, 20, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 10, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 19, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 27, 13)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 38, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 14, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 17, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 37, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (24, 12, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 13, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 18, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (26, 8, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (26, 15, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (27, 13, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (27, 41, 16)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (28, 16, 9)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 11, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 21, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 39, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 13, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (31, 11, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (31, 24, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (31, 33, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (31, 34, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (32, 9, 2)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 16, 11)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 23, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (34, 19, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (34, 25, 14)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 19, 1)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (36, 20, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (36, 33, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 20, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 28, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 38, 6)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 21, 19)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 36, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (39, 21, 7)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (39, 27, 5)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (40, 26, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (40, 40, 4)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 32, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 42, 3)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (42, 38, 8)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (43, 39, 17)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (44, 40, 4)
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Три слоя', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Два слоя', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Детская', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N'Супер мягкая', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (5, N'Один слой', NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
