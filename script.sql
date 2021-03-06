USE [Quanly]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/12/2022 2:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/12/2022 2:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] NOT NULL,
	[customer_name] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[phone] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2/12/2022 2:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Orders_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[num] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Orders_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/12/2022 2:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[exp] [date] NOT NULL,
	[mfg] [date] NOT NULL,
	[images] [nvarchar](300) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[category_id] [int] NOT NULL,
	[price] [nchar](455) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 2/12/2022 2:21:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[staff_name] [nvarchar](255) NULL,
	[dob] [date] NULL,
	[password] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'rau')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'thịt')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'đồ hộp')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'hải sản')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (5, N'giải khát')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (6, N'đồ khô')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (7, N'gia vị')
GO
INSERT [dbo].[Customers] ([customer_id], [customer_name], [dob], [phone]) VALUES (1, N'Duy', CAST(N'2001-09-01' AS Date), 98987265)
INSERT [dbo].[Customers] ([customer_id], [customer_name], [dob], [phone]) VALUES (2, N'Quang', CAST(N'2000-09-03' AS Date), 98999282)
INSERT [dbo].[Customers] ([customer_id], [customer_name], [dob], [phone]) VALUES (3, N'Huy', CAST(N'1998-08-02' AS Date), 9288337)
INSERT [dbo].[Customers] ([customer_id], [customer_name], [dob], [phone]) VALUES (4, N'Viet', CAST(N'1993-09-04' AS Date), 9738472)
GO
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (1, N'snack', 25, CAST(N'2001-01-01' AS Date), CAST(N'2022-02-02' AS Date), N'https://cf.shopee.vn/file/bdccb04d734b93b6fe5d5541c079710c', N'snack cua gói', 6, N'5.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (2, N'thịt bò', 100, CAST(N'2022-01-13' AS Date), CAST(N'2021-12-30' AS Date), N'https://meatworksasia.com/wp-content/uploads/2021/12/Thit-Bo-Uc-Nhap-Khau-2-large.png', N'bò ba chỉ mỹ khay 200gr', 1, N'200.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (3, N'pate ', 50, CAST(N'2023-06-06' AS Date), CAST(N'2021-12-22' AS Date), N'https://th.bing.com/th/id/OIP.nwGPcUpht_adEOLliKykqwHaFj?w=268&h=201&c=7&r=0&o=5&pid=1.7', N'pate gan hạ long', 3, N'20.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (4, N'hạt nêm', 12, CAST(N'2022-12-24' AS Date), CAST(N'2021-08-10' AS Date), N'https://salt.tikicdn.com/cache/w1200/ts/product/15/89/78/0fb34078f099f12907d1ee24b5fe6b3e.jpg', N'hạt nêm knorr gói 900gr', 7, N'15.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (7, N'tôm khô', 10, CAST(N'2022-12-05' AS Date), CAST(N'2022-01-01' AS Date), N'https://cdn.tgdd.vn/Files/2021/09/18/1383835/cach-lam-tom-kho-1-nang-sieu-nhanh-don-gian-tai-nha-202112301143396070.jpg', N'tôm nõn khô', 6, N'30.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (8, N'mì omni', 20, CAST(N'2022-09-23' AS Date), CAST(N'2022-01-02' AS Date), N'https://th.bing.com/th/id/OIP.jlemDMJ4L2yR94yz2cIVawHaHa?pid=ImgDet&rs=1', N'mì tôm chanh cốc, thùng', 6, N'60.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (9, N'mì bò hầm', 20, CAST(N'2022-09-23' AS Date), CAST(N'2022-01-02' AS Date), N'https://cdn.shopify.com/s/files/1/0523/6532/8573/products/TG-1558_800x.png?v=1616715198', N'omachi,gói, thùng', 6, N'45.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (12, N'rau muống', 25, CAST(N'2022-12-03' AS Date), CAST(N'2022-02-02' AS Date), N'http://media.vietq.vn/files/ngocluong/rau-muong-va-nhung-loi-ich-bat-ngo3.jpg', N'rau muống bó', 1, N'15.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (13, N'muối tôm tây ninh', 20, CAST(N'2024-09-23' AS Date), CAST(N'2022-02-02' AS Date), N'https://vietmartjp.com/wp-content/uploads/2020/09/muoi-tom-tay-ninh-dh-foods-gia-vi-viet-o-nhat-vietmart-1.jpg', N'lọ', 7, N'15.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (24, N'cá chỉ vàng', 500, CAST(N'2022-12-12' AS Date), CAST(N'2021-01-12' AS Date), N'https://th.bing.com/th/id/OIP.iVMlYxsFZfVPMUMYYcTL1QHaGV?w=221&h=189&c=7&r=0&o=5&pid=1.7', N'khay 250gr', 6, N'100.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[Products] ([product_id], [product_name], [quantity], [exp], [mfg], [images], [description], [category_id], [price]) VALUES (30, N'hạt tiêu', 12, CAST(N'2021-12-12' AS Date), CAST(N'2022-12-12' AS Date), N'https://th.bing.com/th/id/R.efca226225c3ffc4d2f726b5a5f9726d?rik=qXQwSf8GtNMP%2bg&pid=ImgRaw&r=0', N'lọ', 7, N'15.000                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ')
GO
SET IDENTITY_INSERT [dbo].[Staffs] ON 

INSERT [dbo].[Staffs] ([staff_id], [staff_name], [dob], [password]) VALUES (1, N'Trung', CAST(N'2001-01-01' AS Date), N'1123                                              ')
INSERT [dbo].[Staffs] ([staff_id], [staff_name], [dob], [password]) VALUES (2, N'Trang', CAST(N'1998-02-12' AS Date), N'2091                                              ')
INSERT [dbo].[Staffs] ([staff_id], [staff_name], [dob], [password]) VALUES (3, N'hanh', CAST(N'2001-01-01' AS Date), N'1234                                              ')
INSERT [dbo].[Staffs] ([staff_id], [staff_name], [dob], [password]) VALUES (4, N'Thy', CAST(N'2002-09-09' AS Date), N'123                                               ')
INSERT [dbo].[Staffs] ([staff_id], [staff_name], [dob], [password]) VALUES (5, N'Tram', CAST(N'2001-07-17' AS Date), N'123                                               ')
SET IDENTITY_INSERT [dbo].[Staffs] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Staffs] FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staffs] ([staff_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Staffs]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
