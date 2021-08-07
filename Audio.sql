USE [master]
GO
/****** Object:  Database [Audio]    Script Date: 8/2/2021 8:07:10 PM ******/
CREATE DATABASE [Audio]
GO
CREATE TABLE [dbo].[Categories](
	[id] [varchar](5) NOT NULL,
	[namecategory] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 8/2/2021 8:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idproduct] [varchar](5) NOT NULL,
	[percentdiscount] [float] NOT NULL,
 CONSTRAINT [PK_Discount_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderdetail]    Script Date: 8/2/2021 8:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderdetail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idorder] [bigint] NOT NULL,
	[idproduct] [varchar](5) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/2/2021 8:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[iduser] [varchar](5) NOT NULL,
	[datepurchase] [date] NOT NULL,
	[address] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/2/2021 8:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [varchar](5) NOT NULL,
	[nameproduct] [nvarchar](100) NOT NULL,
	[description] [nvarchar](4000) NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[idcategory] [varchar](5) NOT NULL,
	[createdate] [date] NOT NULL,
	[image] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/2/2021 8:07:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [varchar](5) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[birthday] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[admin] [varchar](50) NOT NULL,
	[actived] [bit] NOT NULL,
	[photo] [varchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([id], [namecategory]) VALUES (N'LH001', N'Tai nghe có dây 1')
GO
INSERT [dbo].[Categories] ([id], [namecategory]) VALUES (N'LH002', N'Tai nghe không dây')
GO
INSERT [dbo].[Categories] ([id], [namecategory]) VALUES (N'LH004', N'Loa không dây')
GO
SET IDENTITY_INSERT [dbo].[Orderdetail] ON 
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (57, 62, N'SP007', 4990000, 4)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (58, 62, N'SP002', 45000, 4)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (59, 62, N'SP012', 99000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (60, 63, N'SP006', 1000000, 3)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (75, 76, N'SP006', 1000000, 10)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (76, 77, N'SP013', 1399000, 12)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (77, 77, N'SP001', 450000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (78, 78, N'SP001', 450000, 10)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (79, 79, N'SP013', 1399000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (80, 79, N'SP004', 1000000, 2)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (81, 79, N'SP012', 100000, 4)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (82, 80, N'SP004', 1000000, 11)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (83, 80, N'SP013', 1399000, 2)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (84, 81, N'SP012', 100000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (85, 81, N'SP008', 5000000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (86, 81, N'SP007', 4990000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (87, 82, N'SP007', 4990000, 2)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (88, 83, N'SP001', 450000, 2)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (89, 83, N'SP006', 1000000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (90, 83, N'SP345', 1399000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10061, 10064, N'SP001', 450000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10062, 10064, N'SP004', 1000000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10063, 10064, N'SP007', 4990000, 7)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10064, 10065, N'SP001', 450000, 5)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10065, 10065, N'SP013', 1399000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10066, 10066, N'SP002', 2000, 4)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10067, 10067, N'SP013', 1399000, 3)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10068, 10067, N'SP008', 5000000, 1)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10069, 10068, N'SP007', 4990000, 2)
GO
INSERT [dbo].[Orderdetail] ([id], [idorder], [idproduct], [price], [quantity]) VALUES (10070, 10068, N'SP006', 1000000, 1)
GO
SET IDENTITY_INSERT [dbo].[Orderdetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (62, N'US004', CAST(N'2021-06-24' AS Date), N'qwqwq')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (63, N'US004', CAST(N'2021-06-24' AS Date), N'')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (76, N'US001', CAST(N'2021-07-24' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (77, N'US004', CAST(N'2021-07-24' AS Date), N'B7-8 Văn Tiến Dũng, Điện Ngọc, Điện Bàn, Quảng Nam, Việt Nam')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (78, N'US001', CAST(N'2021-07-24' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (79, N'US001', CAST(N'2021-07-24' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (80, N'US001', CAST(N'2021-07-25' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (81, N'US004', CAST(N'2021-07-25' AS Date), N'B7-8 Văn Tiến Dũng, Điện Ngọc, Điện Bàn, Quảng Nam, Việt Nam')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (82, N'US001', CAST(N'2021-07-26' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (83, N'US001', CAST(N'2021-07-26' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (10064, N'US001', CAST(N'2021-07-27' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (10065, N'US001', CAST(N'2021-07-27' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (10066, N'US015', CAST(N'2021-07-28' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (10067, N'US123', CAST(N'2021-07-29' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000, Việt Nam')
GO
INSERT [dbo].[Orders] ([id], [iduser], [datepurchase], [address]) VALUES (10068, N'US001', CAST(N'2021-08-02' AS Date), N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP001', N'Tai nghe bluetooth AKG-N200A', N'Tai nghe blutooth có thể kết nối blutooth xa tới tận 5 métsdasdasdasd', 450000, 10000, N'LH002', CAST(N'2021-07-19' AS Date), N'4d7d380b.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP002', N'Tai Không dây Klippsich', N'Tai nghe blutooth có thể kết nối blutooth xa tới tận 5 mét', 2000, 20000, N'LH002', CAST(N'2021-07-28' AS Date), N'1e765934.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP004', N'Tai nghe SODO MH1', N'Hàng chất lượng cao', 1000000, 100, N'LH002', CAST(N'2021-07-19' AS Date), N'294d84c7.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP006', N'Tai nghe Airpor pro', N'Mới đây trang chủ của Apple vừa cập nhật thông tin về thế hệ tai nghe Airpods thứ 3 của hãng mang tên : tai nghe Airpod Pro. Tai nghe Airpods Pro có sự khác biệt lớn so với thế hệ cũ, kèm nhiều tính năng nổi bật.', 1000000, 100, N'LH002', CAST(N'2021-07-19' AS Date), N'21d12dad.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP007', N'Loa Blutooth 113', N'Sony XBA-N1AP là một trong những mẫu in-ear hybrid nổi bật của hãng âm thanh tới từ Nhật Bản. Sony XBA-N1AP sở hữu một thiết kế riêng biệt cùng với những công nghệ âm thanh độc quyền của hãng. 

 

Sony XBA-N1AP đóng hộp 
Sony XBA-N1AP được đóng hộp một cách cẩn thận và chất lượng bên trong hộp bìa cứng, phía ngoài chúng ta sẽ có hình ảnh của tai nghe cũng như những thông tin về công nghệ cao cấp được áp dụng trên Sony XBA-N1AP. Bên trong hộp, ngoài Sony XBA-N1AP, chúng ta sẽ còn có rất nhiều bộ tips đệm thay thế, đồ cuộn dây và một túi đựng. ', 4990000, 100, N'LH004', CAST(N'2021-07-29' AS Date), N'aab1c120.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP008', N'Loa MHC-V4D', N'Hệ thống loa đem lại âm thanh sống động

 

Sony XBA-N1AP đóng hộp 
Sony XBA-N1AP được đóng hộp một cách cẩn thận và chất lượng bên trong hộp bìa cứng, phía ngoài chúng ta sẽ có hình ảnh của tai nghe cũng như những thông tin về công nghệ cao cấp được áp dụng trên Sony XBA-N1AP. Bên trong hộp, ngoài Sony XBA-N1AP, chúng ta sẽ còn có rất nhiều bộ tips đệm thay thế, đồ cuộn dây và một túi đựng. ', 5000000, 100, N'LH004', CAST(N'2021-07-19' AS Date), N'6332486f.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP009', N'Loa bluetooth', N'Hệ thống loa đem lại âm thanh sống động

 

Sony XBA-N1AP đóng hộp 
Sony XBA-N1AP được đóng hộp một cách cẩn thận và chất lượng bên trong hộp bìa cứng, phía ngoài chúng ta sẽ có hình ảnh của tai nghe cũng như những thông tin về công nghệ cao cấp được áp dụng trên Sony XBA-N1AP. Bên trong hộp, ngoài Sony XBA-N1AP, chúng ta sẽ còn có rất nhiều bộ tips đệm thay thế, đồ cuộn dây và một túi đựng. ', 1000000, 100, N'LH004', CAST(N'2021-07-19' AS Date), N'2327e15c.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP010', N'Loa bluetooth JBL FLIP 5', N'Dòng loa JBL Flip những năm qua luôn tạo được sức hút cực kì lớn với những người chơi loa và âm thanh, đặc biệt là những bạn trẻ. Và mới đây tại sự kiện CES 2019, JBL đã tung ra phiên bản thứ 5 của dòng sản phẩm này, JBL Flip 5 ra mắt với nhiều sự kế thừa, nâng cấp vô cùng đáng để mong đợi. 

 

Sony XBA-N1AP đóng hộp 
Sony XBA-N1AP được đóng hộp một cách cẩn thận và chất lượng bên trong hộp bìa cứng, phía ngoài chúng ta sẽ có hình ảnh của tai nghe cũng như những thông tin về công nghệ cao cấp được áp dụng trên Sony XBA-N1AP. Bên trong hộp, ngoài Sony XBA-N1AP, chúng ta sẽ còn có rất nhiều bộ tips đệm thay thế, đồ cuộn dây và một túi đựng. ', 1500000, 100, N'LH004', CAST(N'2021-07-19' AS Date), N'2556eb6d.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP012', N'Tai nghe không dây Baseus', N'Tai nghe không dây Baseus Là dòng tai nghe inear Monitors mới nhất đến từ DT1990 cũng là phiên bản nâng cấp toàn diện của người đàn anh đi trướcDT1990', 100000, 1000, N'LH001', CAST(N'2021-07-27' AS Date), N'f40b1c23.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP013', N'Tai nghe DT1990', N'Tai nghe Behringer HC 2000BNC có khả năng chống ồn tốt vừa hỗ trợ cắm dây, vừa kết nối bluetooth.
Đệm tai dạng over-ear tuy nhiên đường kính driver có phần nhỏ hơn với chỉ 40mm nhưng vẫn kín tai, đeo cách âm tốt.', 1399000, 1000, N'LH002', CAST(N'2021-07-19' AS Date), N'4ab9ad17.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP014', N'Loa Google Home MiNi', N'Google home mini là loa hệ thống loa thông minh do google sản xuất, sản phẩm này chăm sóc đến tận răng cho nhu cầu nghe nhạc của bạn...', 2500000, 1000, N'LH004', CAST(N'2021-07-29' AS Date), N'aeb4662f.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP015', N'Loa Không dây Sony SRS RA3000', N'Loa Không dây Sony SRS XB40là loa hệ thống loa thông minh do Sony sản xuất, sản phẩm này chăm sóc đến tận răng cho nhu cầu nghe nhạc của bạn...', 800000, 1000, N'LH004', CAST(N'2021-07-29' AS Date), N'9a111b89.jpg')
GO
INSERT [dbo].[Products] ([id], [nameproduct], [description], [price], [quantity], [idcategory], [createdate], [image]) VALUES (N'SP345', N'Tai nghe thể thao 112D', N'Tai nghe Behringer HC 2000BNC có khả năng chống ồn tốt vừa hỗ trợ cắm dây, vừa kết nối bluetooth.
Đệm tai dạng over-ear tuy nhiên đường kính driver có phần nhỏ hơn với chỉ 40mm nhưng vẫn kín tai, đeo cách âm tốt.', 1399000, 1000, N'LH004', CAST(N'2021-08-02' AS Date), N'14408f49.jpg')
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US001', N'12345678', N'Phạm Văn Nhiều', CAST(N'2021-06-24' AS Date), 1, N'phamvannhieu2001@gmail.com', N'0373976537', N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000', N'ADMIN', 1, NULL)
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US004', N'1234567', N'Phạm Văn A', CAST(N'2021-06-10' AS Date), 1, N'phamvannhieu2001@gmail.com', N'0373976537', N'B7-8 Văn Tiến Dũng, Điện Ngọc, Điện Bàn, Quảng Nam, Việt Nam', N'ADMIN', 1, N'c644362f.jpg')
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US006', N'1234567', N'Phạm Văn Nhiều', CAST(N'2021-06-10' AS Date), 1, N'phamvannhieu2001@gmail.com', N'0373976537', N'B7-8 Văn Tiến Dũng, Điện Ngọc, Điện Bàn, Quảng Nam, Việt Nam', N'ADMIN', 1, N'default.png')
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US007', N'$2ihhihihh', N'Phạm Văn Nhiều', CAST(N'2021-06-10' AS Date), 1, N'phamvannhieu2001@gmail.com', N'0373976537', N'B7-8 Văn Tiến Dũng, Điện Ngọc, Điện Bàn, Quảng Nam, Việt Nam', N'USER', 1, N'default.png')
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US008', N'1234567d', N'Phạm Văn Nhiều', CAST(N'2021-06-10' AS Date), 1, N'phamvannhieu2001@gmail.com', N'0373976537', N'B7-8 Văn Tiến Dũng, Điện Ngọc, Điện Bàn, Quảng Nam, Việt Nam', N'USER', 1, NULL)
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US009', N'12345678', N'Phạm Văn Nhiều', CAST(N'2021-06-10' AS Date), 1, N'phamvannhieu2001@gmail.com', N'0373976537', N'B7-8 Văn Tiến Dũng, Điện Ngọc, Điện Bàn, Quảng Nam, Việt Nam', N'USER', 1, NULL)
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US010', N'1234567777', N'Trần Văn Dần', CAST(N'2001-01-26' AS Date), 0, N'phamvannhieu2001@gmail.com', N'0373976537', N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000', N'ADMIN', 0, N'85e59e53.jpg')
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US012', N'hongduy321', N'Nguyễn Phong Hồng duy', CAST(N'2000-01-28' AS Date), 1, N'Hongduy@gmail.com', N'0373976537', N'B7-8 Văn Tiến Dũng, Điện Ngọc, Điện Bàn, Quảng Nam, Việt Nam', N'USER', 0, N'1f02bbf3.jpg')
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US015', N'1234567', N'Nguyễn Phong Hồng duy', CAST(N'2021-07-15' AS Date), 1, N'duyhong@gmail.com', N'0373976537', N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000', N'ADMIN', 0, N'fdfc508c.jpg')
GO
INSERT [dbo].[Users] ([id], [password], [name], [birthday], [gender], [email], [phone], [address], [admin], [actived], [photo]) VALUES (N'US123', N'1234567', N'Phạm Văn Nhiều', CAST(N'2021-07-23' AS Date), 0, N'nhieupvpd03910@fpt.edu.vn', N'0332144557', N'35 Hòa Nam 2, Hoà An, Cẩm Lệ, Đà Nẵng 550000, Việt Nam', N'USER', 1, N'e426f8b3.jpg')
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [FK_Discount_Products1] FOREIGN KEY([idproduct])
REFERENCES [dbo].[Products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [FK_Discount_Products1]
GO
ALTER TABLE [dbo].[Orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([idorder])
REFERENCES [dbo].[Orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orderdetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Orderdetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products] FOREIGN KEY([idproduct])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orderdetail] CHECK CONSTRAINT [FK_OrderDetail_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([iduser])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories1] FOREIGN KEY([idcategory])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories1]
GO
USE [master]
GO
ALTER DATABASE [Audio] SET  READ_WRITE 
GO
