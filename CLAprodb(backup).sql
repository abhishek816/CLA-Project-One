USE [prodb]
GO
/****** Object:  Table [dbo].[acnt_details]    Script Date: 11-12-2024 10:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acnt_details](
	[acnt_id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[acnt_nmber] [bigint] NOT NULL,
	[acnt_holder] [varchar](50) NOT NULL,
	[ifscode] [varchar](50) NOT NULL,
	[balance] [bigint] NOT NULL,
 CONSTRAINT [PK_acnt_details] PRIMARY KEY CLUSTERED 
(
	[acnt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin_reg]    Script Date: 11-12-2024 10:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_reg](
	[admin_id] [int] NOT NULL,
	[admin_name] [varchar](50) NOT NULL,
	[admin_email] [varchar](50) NOT NULL,
	[admin_phone] [bigint] NOT NULL,
 CONSTRAINT [PK_admin_reg] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bill_tab]    Script Date: 11-12-2024 10:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill_tab](
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[b_date] [varchar](50) NOT NULL,
	[user_id] [int] NOT NULL,
	[total_price] [float] NOT NULL,
 CONSTRAINT [PK_bill_tab] PRIMARY KEY CLUSTERED 
(
	[b_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_tab]    Script Date: 11-12-2024 10:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_tab](
	[cart_id] [int] NOT NULL,
	[p_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[p_qty] [int] NOT NULL,
	[p_price] [float] NOT NULL,
 CONSTRAINT [PK_cart_tab] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_tab]    Script Date: 11-12-2024 10:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_tab](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [varchar](50) NOT NULL,
	[cat_desc] [varchar](100) NOT NULL,
	[cat_photo] [varchar](200) NULL,
 CONSTRAINT [PK_category__tab] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[login_tab]    Script Date: 11-12-2024 10:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_tab](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[reg_id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[log_type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_login_tab] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_tab]    Script Date: 11-12-2024 10:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_tab](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[p_id] [int] NOT NULL,
	[p_name] [varchar](200) NULL,
	[p_price] [float] NOT NULL,
	[p_qty] [int] NOT NULL,
	[order_date] [varchar](50) NOT NULL,
	[order_status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_order_tab] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tab_product]    Script Date: 11-12-2024 10:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tab_product](
	[p_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_id] [int] NOT NULL,
	[p_name] [varchar](200) NULL,
	[p_details] [varchar](200) NOT NULL,
	[p_price] [float] NOT NULL,
	[p_photo] [varchar](200) NOT NULL,
	[p_status] [varchar](50) NOT NULL,
	[p_stock] [int] NOT NULL,
 CONSTRAINT [PK_tab_product] PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_reg]    Script Date: 11-12-2024 10:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_reg](
	[user_id] [int] NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[address] [varchar](200) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [bigint] NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[user_status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user_reg] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[acnt_details] ON 
GO
INSERT [dbo].[acnt_details] ([acnt_id], [userid], [acnt_nmber], [acnt_holder], [ifscode], [balance]) VALUES (1, 2, 587649231548, N'Abhishek B Kumar', N'SBIN563984', 1490000)
GO
SET IDENTITY_INSERT [dbo].[acnt_details] OFF
GO
INSERT [dbo].[admin_reg] ([admin_id], [admin_name], [admin_email], [admin_phone]) VALUES (1, N'Abhishek B Kumar', N'abhishekbkumar321@gmail.com', 9633583170)
GO
SET IDENTITY_INSERT [dbo].[bill_tab] ON 
GO
INSERT [dbo].[bill_tab] ([b_id], [b_date], [user_id], [total_price]) VALUES (1, N'2024-11-05', 2, 10000)
GO
SET IDENTITY_INSERT [dbo].[bill_tab] OFF
GO
SET IDENTITY_INSERT [dbo].[category_tab] ON 
GO
INSERT [dbo].[category_tab] ([cat_id], [cat_name], [cat_desc], [cat_photo]) VALUES (1, N'Graphics Card', N'Graphical Powerhouse of your PC', N'~/catimg/gpu.jpeg')
GO
INSERT [dbo].[category_tab] ([cat_id], [cat_name], [cat_desc], [cat_photo]) VALUES (2, N'Processor', N'Brain of your PC', N'~/catimg/processor.jpeg')
GO
INSERT [dbo].[category_tab] ([cat_id], [cat_name], [cat_desc], [cat_photo]) VALUES (3, N'Ram', N'Temporary manager of your pc', N'~/catimg/Ram.jpeg')
GO
SET IDENTITY_INSERT [dbo].[category_tab] OFF
GO
SET IDENTITY_INSERT [dbo].[login_tab] ON 
GO
INSERT [dbo].[login_tab] ([log_id], [reg_id], [username], [password], [log_type]) VALUES (1, 1, N'Abhi@321', N'Abhi_321', N'admin')
GO
INSERT [dbo].[login_tab] ([log_id], [reg_id], [username], [password], [log_type]) VALUES (2, 2, N'santhosh', N'santhosh@123', N'user')
GO
SET IDENTITY_INSERT [dbo].[login_tab] OFF
GO
SET IDENTITY_INSERT [dbo].[order_tab] ON 
GO
INSERT [dbo].[order_tab] ([order_id], [user_id], [p_id], [p_name], [p_price], [p_qty], [order_date], [order_status]) VALUES (1, 2, 6, N'Intel i5-12400F 4.4 GHz Upto 4.4 GHz LGA1700 Socket 6 Cores 12 Threads Desktop Processor ', 10000, 1, N'2024-11-05', N'paid')
GO
SET IDENTITY_INSERT [dbo].[order_tab] OFF
GO
SET IDENTITY_INSERT [dbo].[tab_product] ON 
GO
INSERT [dbo].[tab_product] ([p_id], [cat_id], [p_name], [p_details], [p_price], [p_photo], [p_status], [p_stock]) VALUES (1, 1, N'ZOTAC NVIDIA GeForce RTX 4060 8GB Twin Edge 8 GB GDDR6 Graphics Card ', N'2475 MHzClock Speed
Chipset: NVIDIA
BUS Standard: 128
Graphics Engine: Boost: 2475 MHz
Memory Interface 128 bit', 29316, N'~/proimg/zotac card2.jpeg', N'available', 15)
GO
INSERT [dbo].[tab_product] ([p_id], [cat_id], [p_name], [p_details], [p_price], [p_photo], [p_status], [p_stock]) VALUES (3, 1, N'ZOTAC NVIDIA RTX 3060 Twin Edge OC 12 GB GDDR6 Graphics Card', N'1807 MHzClock Speed
Chipset: NVIDIA
BUS Standard: PCI Express 4.0 16x
Graphics Engine: GeForce RTX 3060
Memory Interface 192 bit', 27747, N'~/proimg/zotac card.jpeg', N'available', 10)
GO
INSERT [dbo].[tab_product] ([p_id], [cat_id], [p_name], [p_details], [p_price], [p_photo], [p_status], [p_stock]) VALUES (4, 1, N'MSI NVIDIA GeForce RTX 3080 SUPRIM X 12G LHR 12 GB GDDR6X Graphics Card', N'1905 MHzClock Speed
Chipset: NVIDIA
BUS Standard: PCI Express Gen 4
Graphics Engine: NVIDIA GeForce RTX 3080
Memory Interface 384 bit', 184000, N'~/proimg/4080.jpeg', N'available', 2)
GO
INSERT [dbo].[tab_product] ([p_id], [cat_id], [p_name], [p_details], [p_price], [p_photo], [p_status], [p_stock]) VALUES (5, 1, N'ASUS AMD/ATI TUF Gaming Radeon RX 7800 XT OC Edition 16 GB GDDR6 Graphics Card', N'2565 MHzClock Speed
Chipset: AMD/ATI
BUS Standard: PCI Express 4.0
Graphics Engine: AMD Radeon RX 7800 XT
Memory Interface 256 bit', 559449, N'~/proimg/rx.jpeg', N'available', 25)
GO
INSERT [dbo].[tab_product] ([p_id], [cat_id], [p_name], [p_details], [p_price], [p_photo], [p_status], [p_stock]) VALUES (6, 2, N'Intel i5-12400F 4.4 GHz Upto 4.4 GHz LGA1700 Socket 6 Cores 12 Threads Desktop Processor ', N'For Desktop
Hexa-Core
LGA1700
Clock Speed: 4.4 GHz', 10000, N'~/proimg/12400f.jpeg', N'available', 10)
GO
INSERT [dbo].[tab_product] ([p_id], [cat_id], [p_name], [p_details], [p_price], [p_photo], [p_status], [p_stock]) VALUES (7, 2, N'AMD Ryzen 5 5600G 3.9 GHz Upto 4.4 GHz AM4 Socket 6 Cores 12 Threads 3 kB L2 16 kB L3 Desktop Processor', N'For Desktop
Hexa-Core
AM4
Clock Speed: 3.9 GHz', 14000, N'~/proimg/5600g.jpeg', N'available', 25)
GO
INSERT [dbo].[tab_product] ([p_id], [cat_id], [p_name], [p_details], [p_price], [p_photo], [p_status], [p_stock]) VALUES (8, 3, N'Trident Z', N'Trident Z ram 32 ', 12000, N'~/proimg/trident z.jpeg', N'available', 12)
GO
INSERT [dbo].[tab_product] ([p_id], [cat_id], [p_name], [p_details], [p_price], [p_photo], [p_status], [p_stock]) VALUES (9, 1, N'Corsair Vengeance leo', N'Corsair Vengeance leo 8 gb', 3500, N'~/proimg/vengeance leo.jpeg', N'available', 10)
GO
SET IDENTITY_INSERT [dbo].[tab_product] OFF
GO
INSERT [dbo].[user_reg] ([user_id], [user_name], [age], [address], [email], [phone], [gender], [user_status]) VALUES (2, N'Santhosh TK', 50, N'Emerald Publications,New Building,Old narrow road,ABC place', N'santhosh.emerald@gmail.com', 9647231458, N'Male', N'active')
GO
