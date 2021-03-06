/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountHotShots]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountHotShots](
	[IdentityUserId] [nvarchar](450) NOT NULL,
	[HotShotId] [nvarchar](450) NOT NULL,
	[HotShotId1] [int] NULL,
 CONSTRAINT [PK_AccountHotShots] PRIMARY KEY CLUSTERED 
(
	[IdentityUserId] ASC,
	[HotShotId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[AddressLine] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[ZipCode] [nvarchar](max) NOT NULL,
	[IdentityUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[ImageId] [int] NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[SectionId] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galleries]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galleries](
	[GalleryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Galleries] PRIMARY KEY CLUSTERED 
(
	[GalleryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotShots]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotShots](
	[HotShotId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[NewPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ItemsSold] [int] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[HasEnded] [bit] NOT NULL,
 CONSTRAINT [PK_HotShots] PRIMARY KEY CLUSTERED 
(
	[HotShotId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageGalleries]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageGalleries](
	[GalleryId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_ImageGalleries] PRIMARY KEY CLUSTERED 
(
	[GalleryId] ASC,
	[ImageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[PricePerItem] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetailsOrders]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailsOrders](
	[OrderId] [int] NOT NULL,
	[OrderDetailsId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetailsOrders] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC,
	[OrderId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[IdentityUserId] [nvarchar](450) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[TrackingNumber] [nvarchar](max) NULL,
	[AddressId] [int] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[EmployeeId] [nvarchar](450) NULL,
	[PayingMethodId] [int] NOT NULL,
	[ShippingMethodId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayingMethods]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayingMethods](
	[PayingMethodId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Cost] [float] NOT NULL,
	[Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_PayingMethods] PRIMARY KEY CLUSTERED 
(
	[PayingMethodId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayingShippingMethods]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayingShippingMethods](
	[PayingMethodId] [int] NOT NULL,
	[ShippingMethodId] [int] NOT NULL,
 CONSTRAINT [PK_PayingShippingMethods] PRIMARY KEY CLUSTERED 
(
	[PayingMethodId] ASC,
	[ShippingMethodId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[PublicationDate] [datetime2](7) NULL,
	[GalleryId] [int] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[IsRecommended] [bit] NOT NULL,
	[BrandId] [int] NOT NULL,
	[GalleryId] [int] NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[QuantityInStock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTags]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTags](
	[TagId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductTags] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[TagId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[IdentityUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingMethods]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingMethods](
	[ShippingMethodId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Cost] [float] NOT NULL,
	[Icon] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShippingMethods] PRIMARY KEY CLUSTERED 
(
	[ShippingMethodId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[ShoppingCartId] [int] IDENTITY(1,1) NOT NULL,
	[IdentityUserId] [nvarchar](450) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[HotShotId] [int] NULL,
 CONSTRAINT [PK_ShoppingCarts] PRIMARY KEY CLUSTERED 
(
	[ShoppingCartId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagValues]    Script Date: 11.03.2020 09:45:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagValues](
	[TagValueId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[TagId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_TagValues] PRIMARY KEY CLUSTERED 
(
	[TagValueId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110141940_AddSectionsAndCategoriesTables', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110143910_AddBrandsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110150207_AddGalleriesImageAndImageGalleriesTables', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110151232_AddProductsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110152337_AddTagsAndTagsValuesTables', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110152735_AddProductTagsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110160129_AddShoppingCartsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110162457_AddAddressesTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110164937_AddOrderOrderDetailsOrderDetailsOrdersTablesAndMissingPriceColumnToProductsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110165807_AddPostsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200110180503_Config', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200111165045_AddProductIdToTagValuesTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200131155410_AddHotShotsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200131155520_AddAccountHotShotsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200207125054_AddEmployeeIdToOrdersTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200208144507_AddIsCompletedColumnToOrderDetailsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200209145831_AddRatingsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200209181227_AddIsActiveAndQuantityInStockToProductsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200226171146_AddHotShotIdToShoppingCartsTable', N'3.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200226183058_AddShippingAndPayingMethodsTables', N'3.0.0')
INSERT [dbo].[AccountHotShots] ([IdentityUserId], [HotShotId], [HotShotId1]) VALUES (N'4a040c1e-8229-4536-bb6e-ee2e73b0361f', N'1', NULL)
INSERT [dbo].[AccountHotShots] ([IdentityUserId], [HotShotId], [HotShotId1]) VALUES (N'a74c01af-339a-4969-9ef6-532c51f31ef9', N'1', NULL)
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([AddressId], [CustomerName], [City], [AddressLine], [PhoneNumber], [ZipCode], [IdentityUserId]) VALUES (1, N'Jan Kowalski', N'Krosno', N'ul. Sprawiedliwa 20', N'123123123', N'38-400', N'4a040c1e-8229-4536-bb6e-ee2e73b0361f')
INSERT [dbo].[Addresses] ([AddressId], [CustomerName], [City], [AddressLine], [PhoneNumber], [ZipCode], [IdentityUserId]) VALUES (3, N'Tomasz Nowak', N'Krosno', N'ul. Fajna 23', N'123321123', N'38-400', N'a74c01af-339a-4969-9ef6-532c51f31ef9')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'071a3e35-d5b1-4619-9eb4-f2b323d77e92', N'Testowanie', N'TESTOWANIE', N'9b0d9638-a22f-45f6-a5a8-0a70ec71d09b')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'be54a320-81ab-41d3-a035-52c5283c3236', N'Admin', NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'25566d67-263e-4ccb-906c-e932b92c72f4', N'071a3e35-d5b1-4619-9eb4-f2b323d77e92')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4a040c1e-8229-4536-bb6e-ee2e73b0361f', N'071a3e35-d5b1-4619-9eb4-f2b323d77e92')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a74c01af-339a-4969-9ef6-532c51f31ef9', N'be54a320-81ab-41d3-a035-52c5283c3236')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'25566d67-263e-4ccb-906c-e932b92c72f4', N'lukaszk9396@gmail.com', N'LUKASZK9396@GMAIL.COM', N'lukaszk9396@gmail.com', N'LUKASZK9396@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEM9Fqpe++Uhi2C8ftFt5/35Cyw74u0gYS68OOVpeq/d01PXkCa0IAgva7LTISmOH/Q==', N'WAF7RBE55PTVT2MS2QPSOOBUIOIVTFA3', N'd00daa66-56b0-4b5d-bb6b-e00e4b14bd5b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'4a040c1e-8229-4536-bb6e-ee2e73b0361f', N'asd@asd.asd', N'ASD@ASD.ASD', N'asd@asd.asd', N'ASD@ASD.ASD', 0, N'AQAAAAEAACcQAAAAENhpnjAPgNexsw/TrSg/LZNtjtrwTZGxZzrcHeiTH0DyK2XJFNvA/po37GcKl9UxXA==', N'6Q3VU74SQLOHAWPH6VYZF5VVEFN2QT3U', N'c0b0cf34-ebc0-4e61-958c-62ed643850bf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a74c01af-339a-4969-9ef6-532c51f31ef9', N'admin@test.pl', N'ADMIN@TEST.PL', N'admin@test.pl', N'ADMIN@TEST.PL', 0, N'AQAAAAEAACcQAAAAEE5LqQvWPZ+/+7IwjpRPy+3svR2AvSwejCERvO+dhFm2reDqYzzpfEpVUOpjGAaLjw==', N'I5FJXOTOCRO5CVNPUTM633CYMAR3A4UP', N'95be3db6-f8c1-41e9-ab24-10aba6eb7bf3', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e77f4c60-b566-4ee1-9696-1c3058ee916c', N'daft11223344@gmail.com', N'DAFT11223344@GMAIL.COM', N'daft11223344@gmail.com', N'DAFT11223344@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEP8T2SbEQ0HpJgiYtJ3CmafE3DlD1F3MKk6CnVj0hXUht9M5Nr83CcyDGK6f3vbXmA==', N'JIUFEIM7C6DVYAGP4R43DADINB2UXRHZ', N'09cebf69-b25c-44c1-aca7-f822055343e2', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (12, N'Apple', 1)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (13, N'Asus', 7)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (14, N'Dell', 2)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (15, N'Gigabyte', 5)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (16, N'MSI', 6)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (17, N'Panasonic', 3)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (18, N'Playstation', 4)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (19, N'Razer', 10)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (20, N'Sony', 20)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (21, N'Nintendo', 16)
INSERT [dbo].[Brands] ([BrandId], [Name], [ImageId]) VALUES (22, N'Xbox', 25)
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (1, N'Akcesoria', 2)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (2, N'Akcesoria GSM', 3)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (3, N'Aparaty', 5)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (4, N'Drukarki', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (5, N'Dyski HDD i SSD', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (6, N'Głośniki', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (7, N'Kamery', 5)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (8, N'Karty graficzne', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (9, N'Klawiatury', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (10, N'Laptopy', 2)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (11, N'Monitory', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (12, N'Myszki', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (13, N'Nawigacje GPS', 3)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (14, N'Obudowy komputerowe', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (15, N'Pamięci RAM', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (16, N'Płyty główne', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (17, N'Procesory', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (18, N'Projektory', 5)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (19, N'Programy antywirusowe', 6)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (20, N'Programy biurowe', 6)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (21, N'Programy edukacyjne', 6)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (22, N'Programy graficzne', 6)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (23, N'Słuchawki', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (24, N'Smartfony', 3)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (25, N'Smartwatche', 3)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (26, N'Sprzęt audio', 5)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (27, N'Systemy operacyjne', 6)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (28, N'Tablety', 2)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (29, N'Telewizory', 5)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (30, N'Torby i etui', 2)
INSERT [dbo].[Categories] ([CategoryId], [Name], [SectionId]) VALUES (31, N'Zasilacze komputerowe', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Galleries] ON 

INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (1, N'00brands')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (7, N'Nintendo Switch Joy-Con Gray')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (9, N'Gigabyte B450 AORUS PRO')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (10, N'Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (11, N'Panasonic PT-FW530EJ')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (12, N'Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (13, N'Xbox One X + STAR WARS Upadly Zakon')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (14, N'ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (15, N'ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (16, N'Playstation ASTRO A10 czerwone')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (17, N'ASUS PRIME B360M-A')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (18, N'Razer BlackWidow Elite Yellow Switch')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (19, N'Microsoft Office 365 Personal')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (20, N'ASUS ROG PG258Q')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (21, N'Razer Blade 15 i7-9750H')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (22, N'Playstation ASTRO A10 zielone')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (23, N'Gigabyte PB500 500W 80 Plus Bronze')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (24, N'Playstation Redragon THUNDER PRO')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (25, N'Logitech 2.1 Z333')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (26, N'ASUS X543UA-DM1898 4417U8GB256')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (27, N'Microsoft 1850 Wireless Mobile Mouse (czarna)')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (28, N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (29, N'Dell P2719H')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (30, N'Panasonic Lumix DMC-TZ80 czarny')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (31, N'Logitech G PRO X GAMING HEADSET')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (32, N'PlayStation 4 Slim 500GB')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (33, N'Apple MacBook Pro')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (34, N'Gigabyte Aorus AD27QD czarny HDR')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (35, N'Apple iPhone 7 32GB Black')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (36, N'Apple Watch 3')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (37, N'Apple Magic Mouse 2')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (38, N'Sony FDR AX700')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (39, N'Apple iPhone 7 128GB Silver')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (40, N'Sony Xperia 10 I4113 364GB Dual SIM rozowy')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (41, N'Sony WH-1000XM3B Czarne')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (42, N'Dell Alienware AW2518H')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (43, N'Razer Kraken Black')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (44, N'Razer Basilisk')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (45, N'Dell Essential Briefcase 15')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (46, N'Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (47, N'Microsoft Surface Keyboard Bluetooth szary')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (48, N'Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (49, N'Dell Smartcard Keyboard KB813')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (50, N'Panasonic TX-49DX600E')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (51, N'Panasonic zasilacz 125W (8A, 5.5-2.5mm)')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (52, N'MSI Clutch GM30')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (53, N'MSI Vigor GK40')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (54, N'Nintendo Switch Joy-Con RBlue + Labo Variety kit')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (55, N'Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (56, N'Xbox HyperX CloudX')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (57, N'Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (58, N'Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (59, N'Logitech MX Keys')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (60, N'Nintendo Switch Lite (Morski)')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (61, N'Playstation Turtle Beach RECON 50P czarne')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (62, N'MSI DS501 Gaming')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (63, N'Razer Ornata Chroma')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (64, N'Nintendo Switch Lite (Szary)')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (65, N'Logitech G305 LIGHTSPEED czarna')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (66, N'Razer Atheris')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (67, N'Logitech Webcam C270 HD')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (68, N'MSI Clutch GM60 Gaming')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (69, N'MSI Clutch GM11')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (70, N'Xbox One X 1TB Limited Ed. + GoW 5')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (71, N'Razer Kraken Ultimate')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (72, N'Microsoft Windows 10 Home PL 3264bit BOX USB')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (73, N'Panasonic Lumix DMC-TZ80 srebrny')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (74, N'Nintendo Switch Lite (Zolty)')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (75, N'gal1')
INSERT [dbo].[Galleries] ([GalleryId], [Name]) VALUES (76, N'gal2')
SET IDENTITY_INSERT [dbo].[Galleries] OFF
SET IDENTITY_INSERT [dbo].[HotShots] ON 

INSERT [dbo].[HotShots] ([HotShotId], [ProductId], [NewPrice], [Quantity], [ItemsSold], [StartDate], [EndDate], [HasEnded]) VALUES (2, 84, 1000, 100, 0, CAST(N'2020-02-25T00:00:00.0000000' AS DateTime2), CAST(N'2050-02-27T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[HotShots] ([HotShotId], [ProductId], [NewPrice], [Quantity], [ItemsSold], [StartDate], [EndDate], [HasEnded]) VALUES (3, 83, 1000, 50, 0, CAST(N'2020-02-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-02-29T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[HotShots] OFF
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 1, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 2, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 3, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 4, 4)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 5, 5)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 6, 6)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 7, 7)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 9, 8)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 10, 9)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 16, 10)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 20, 11)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (1, 25, 12)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (7, 8, 13)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (7, 92, 14)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (7, 208, 15)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (7, 209, 16)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (9, 11, 17)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (9, 17, 18)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (9, 73, 19)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (9, 114, 20)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (10, 12, 21)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (10, 54, 22)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (10, 96, 23)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (10, 97, 24)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (11, 13, 25)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (11, 83, 26)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (11, 91, 27)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (11, 103, 28)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (12, 14, 29)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (12, 21, 30)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (12, 224, 31)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (12, 253, 32)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (13, 15, 33)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (13, 78, 34)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (13, 240, 35)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (13, 251, 36)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (14, 18, 37)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (14, 19, 38)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (14, 22, 39)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (14, 23, 40)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (16, 24, 41)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (16, 127, 42)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (16, 196, 43)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (16, 232, 44)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (17, 26, 45)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (17, 27, 46)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (17, 29, 47)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (17, 31, 48)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (18, 28, 49)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (18, 47, 50)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (18, 164, 51)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (18, 242, 52)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (19, 30, 53)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (19, 121, 54)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (19, 190, 55)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (19, 195, 56)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (20, 32, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (20, 35, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (20, 36, 4)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (20, 37, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (21, 33, 61)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (21, 172, 62)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (21, 243, 63)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (21, 244, 64)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (22, 34, 65)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (22, 86, 66)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (22, 235, 67)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (22, 237, 68)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (23, 38, 69)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (23, 124, 70)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (23, 125, 71)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (23, 129, 72)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (24, 39, 73)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (24, 101, 74)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (24, 175, 75)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (24, 229, 76)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (25, 40, 77)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (25, 138, 78)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (25, 139, 79)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (25, 141, 80)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (26, 41, 81)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (26, 42, 82)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (26, 44, 83)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (26, 52, 84)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (27, 43, 85)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (27, 176, 86)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (27, 191, 87)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (27, 193, 88)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (28, 45, 89)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (28, 49, 90)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (28, 51, 91)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (28, 53, 92)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (29, 46, 93)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (29, 69, 94)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (29, 95, 95)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (29, 100, 96)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (30, 48, 97)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (30, 144, 98)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (30, 219, 99)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (30, 222, 100)
GO
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (31, 50, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (31, 63, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (31, 143, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (31, 145, 4)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (32, 55, 105)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (32, 140, 106)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (32, 179, 107)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (32, 227, 108)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (33, 57, 109)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (33, 58, 110)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (33, 59, 111)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (33, 72, 112)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (34, 56, 113)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (34, 104, 114)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (34, 106, 115)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (34, 115, 116)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (35, 60, 117)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (35, 74, 118)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (35, 75, 119)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (36, 61, 120)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (36, 67, 121)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (37, 62, 122)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (37, 68, 123)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (37, 70, 124)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (37, 71, 125)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (38, 64, 126)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (38, 198, 127)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (38, 221, 128)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (38, 250, 129)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (39, 65, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (39, 77, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (39, 79, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (40, 66, 133)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (40, 217, 134)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (40, 234, 135)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (40, 252, 136)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (41, 76, 137)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (41, 146, 138)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (41, 213, 139)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (41, 236, 140)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (42, 80, 2)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (42, 84, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (42, 87, 3)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (42, 89, 4)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (43, 81, 145)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (43, 119, 146)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (43, 157, 147)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (43, 246, 148)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (44, 82, 149)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (44, 183, 150)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (44, 203, 151)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (44, 205, 152)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (45, 85, 153)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (45, 88, 154)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (45, 90, 155)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (45, 107, 156)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (46, 93, 157)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (46, 113, 158)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (46, 201, 159)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (46, 204, 160)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (47, 94, 161)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (47, 168, 162)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (47, 197, 163)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (47, 200, 164)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (48, 98, 165)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (48, 130, 166)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (48, 220, 167)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (48, 228, 168)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (49, 99, 169)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (49, 102, 170)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (49, 111, 171)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (49, 112, 172)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (50, 105, 173)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (50, 120, 174)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (50, 215, 175)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (51, 108, 176)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (51, 230, 177)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (51, 231, 178)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (52, 109, 179)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (52, 173, 180)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (52, 174, 181)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (52, 177, 182)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (53, 110, 183)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (53, 154, 184)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (53, 180, 185)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (53, 189, 186)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (54, 116, 187)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (54, 149, 188)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (54, 192, 189)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (54, 211, 190)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (55, 117, 191)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (55, 131, 192)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (55, 133, 193)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (55, 136, 194)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (56, 118, 195)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (56, 233, 196)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (56, 254, 197)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (56, 255, 198)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (57, 122, 199)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (57, 123, 200)
GO
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (57, 126, 201)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (57, 128, 202)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (59, 132, 203)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (59, 155, 204)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (59, 156, 205)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (59, 158, 206)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (60, 134, 207)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (61, 135, 208)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (61, 159, 209)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (61, 202, 210)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (61, 210, 211)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (62, 137, 212)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (62, 184, 213)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (62, 186, 214)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (62, 188, 215)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (63, 142, 216)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (63, 187, 217)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (63, 194, 218)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (64, 147, 219)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (64, 214, 220)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (65, 148, 221)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (65, 150, 222)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (65, 152, 223)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (65, 153, 224)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (66, 151, 225)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (66, 207, 226)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (66, 212, 227)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (66, 239, 228)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (67, 160, 229)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (67, 161, 230)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (67, 163, 231)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (68, 162, 232)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (68, 178, 233)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (68, 181, 234)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (68, 182, 235)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (69, 165, 236)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (69, 167, 237)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (69, 170, 238)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (69, 171, 239)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (70, 166, 240)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (70, 238, 241)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (70, 241, 242)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (70, 245, 243)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (71, 169, 244)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (71, 247, 245)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (71, 248, 246)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (71, 249, 247)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (72, 185, 248)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (72, 206, 249)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (73, 199, 250)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (73, 223, 251)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (73, 225, 252)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (73, 226, 253)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (74, 216, 254)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (74, 218, 255)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (75, 256, 1)
INSERT [dbo].[ImageGalleries] ([GalleryId], [ImageId], [Order]) VALUES (76, 257, 1)
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (1, N'apple.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/apple.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (2, N'dell.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/dell.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (3, N'panasonic.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/panasonic.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (4, N'playstation.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/playstation.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (5, N'gigabyte.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/gigabyte.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (6, N'msi.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/msi.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (7, N'asus.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/asus.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (8, N'Nintendo Switch Joy-Con Gray (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Joy-Con Gray/Nintendo Switch Joy-Con Gray (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (9, N'brands.txt', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/brands.txt')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (10, N'razer.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/razer.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (11, N'Gigabyte B450 AORUS PRO (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte B450 AORUS PRO/Gigabyte B450 AORUS PRO (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (12, N' Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny/ Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (13, N'Panasonic PT-FW530EJ (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic PT-FW530EJ/Panasonic PT-FW530EJ (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (14, N'Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern/Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (15, N' Xbox One X + STAR WARS Upadly Zakon (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox One X + STAR WARS Upadly Zakon/ Xbox One X + STAR WARS Upadly Zakon (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (16, N'switch.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/switch.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (17, N'Gigabyte B450 AORUS PRO (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte B450 AORUS PRO/Gigabyte B450 AORUS PRO (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (18, N'ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6/ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (19, N'ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6/ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (20, N'sony.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/sony.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (21, N'Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern/Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (22, N'ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6/ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (23, N'ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6/ASUS GeForce RTX 2080 SUPER Strix OC 8GB GDDR6 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (24, N'Playstation ASTRO A10 czerwone (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation ASTRO A10 czerwone/Playstation ASTRO A10 czerwone (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (25, N'xbox.png', N'https://kompexstorage.blob.core.windows.net/kompiutex/00brands/xbox.png')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (26, N'ASUS PRIME B360M-A (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS PRIME B360M-A/ASUS PRIME B360M-A (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (27, N'ASUS PRIME B360M-A (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS PRIME B360M-A/ASUS PRIME B360M-A (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (28, N'Razer BlackWidow Elite Yellow Switch (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer BlackWidow Elite Yellow Switch/Razer BlackWidow Elite Yellow Switch (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (29, N'ASUS PRIME B360M-A (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS PRIME B360M-A/ASUS PRIME B360M-A (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (30, N' Microsoft Office 365 Personal (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Office 365 Personal/ Microsoft Office 365 Personal (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (31, N'ASUS PRIME B360M-A (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS PRIME B360M-A/ASUS PRIME B360M-A (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (32, N' ASUS ROG PG258Q (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS ROG PG258Q/ ASUS ROG PG258Q (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (33, N'Razer Blade 15 i7-9750H (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Blade 15 i7-9750H/Razer Blade 15 i7-9750H (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (34, N' Playstation ASTRO A10 zielone (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation ASTRO A10 zielone/ Playstation ASTRO A10 zielone (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (35, N' ASUS ROG PG258Q (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS ROG PG258Q/ ASUS ROG PG258Q (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (36, N' ASUS ROG PG258Q (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS ROG PG258Q/ ASUS ROG PG258Q (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (37, N' ASUS ROG PG258Q (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS ROG PG258Q/ ASUS ROG PG258Q (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (38, N' Gigabyte PB500 500W 80 Plus Bronze (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte PB500 500W 80 Plus Bronze/ Gigabyte PB500 500W 80 Plus Bronze (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (39, N'Playstation Redragon THUNDER PRO (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation Redragon THUNDER PRO/Playstation Redragon THUNDER PRO (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (40, N'Logitech 2.1 Z333 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech 2.1 Z333/Logitech 2.1 Z333 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (41, N'ASUS X543UA-DM1898 4417U8GB2561.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS X543UA-DM1898 4417U8GB256/ASUS X543UA-DM1898 4417U8GB2561.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (42, N'ASUS X543UA-DM1898 4417U8GB2562.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS X543UA-DM1898 4417U8GB256/ASUS X543UA-DM1898 4417U8GB2562.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (43, N' Microsoft 1850 Wireless Mobile Mouse (czarna) (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft 1850 Wireless Mobile Mouse (czarna)/ Microsoft 1850 Wireless Mobile Mouse (czarna) (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (44, N'ASUS X543UA-DM1898 4417U8GB2564.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS X543UA-DM1898 4417U8GB256/ASUS X543UA-DM1898 4417U8GB2564.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (45, N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (46, N'Dell P2719H (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell P2719H/Dell P2719H (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (47, N'Razer BlackWidow Elite Yellow Switch (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer BlackWidow Elite Yellow Switch/Razer BlackWidow Elite Yellow Switch (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (48, N' Panasonic Lumix DMC-TZ80 czarny (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic Lumix DMC-TZ80 czarny/ Panasonic Lumix DMC-TZ80 czarny (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (49, N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (50, N'Logitech G PRO X GAMING HEADSET (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech G PRO X GAMING HEADSET/Logitech G PRO X GAMING HEADSET (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (51, N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (52, N'ASUS X543UA-DM1898 4417U8GB2563.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS X543UA-DM1898 4417U8GB256/ASUS X543UA-DM1898 4417U8GB2563.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (53, N'ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny/ASUS ZenFone 6 ZS630KL 8256GB Dual SIM czarny (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (54, N' Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny/ Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (55, N'PlayStation 4 Slim 500GB (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/PlayStation 4 Slim 500GB/PlayStation 4 Slim 500GB (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (56, N'Gigabyte Aorus AD27QD czarny HDR (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte Aorus AD27QD czarny HDR/Gigabyte Aorus AD27QD czarny HDR (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (57, N'Apple MacBook Pro1.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple MacBook Pro/Apple MacBook Pro1.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (58, N'Apple MacBook Pro3.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple MacBook Pro/Apple MacBook Pro3.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (59, N'Apple MacBook Pro2.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple MacBook Pro/Apple MacBook Pro2.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (60, N'Apple iPhone 7 32GB Black3.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple iPhone 7 32GB Black/Apple iPhone 7 32GB Black3.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (61, N'Apple Watch 31.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple Watch 3/Apple Watch 31.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (62, N'Apple Magic Mouse 2 4.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple Magic Mouse 2/Apple Magic Mouse 2 4.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (63, N'Logitech G PRO X GAMING HEADSET (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech G PRO X GAMING HEADSET/Logitech G PRO X GAMING HEADSET (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (64, N' Sony FDR AX700 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony FDR AX700/ Sony FDR AX700 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (65, N'2.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple iPhone 7 128GB Silver/2.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (66, N'Sony Xperia 10 I4113 364GB Dual SIM rozowy (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia 10 I4113 364GB Dual SIM rozowy/Sony Xperia 10 I4113 364GB Dual SIM rozowy (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (67, N'Apple Watch 32.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple Watch 3/Apple Watch 32.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (68, N'Apple Magic Mouse 2 2.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple Magic Mouse 2/Apple Magic Mouse 2 2.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (69, N'Dell P2719H (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell P2719H/Dell P2719H (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (70, N'Apple Magic Mouse 2 1.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple Magic Mouse 2/Apple Magic Mouse 2 1.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (71, N'Apple Magic Mouse 2 3.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple Magic Mouse 2/Apple Magic Mouse 2 3.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (72, N'Apple MacBook Pro4.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple MacBook Pro/Apple MacBook Pro4.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (73, N'Gigabyte B450 AORUS PRO (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte B450 AORUS PRO/Gigabyte B450 AORUS PRO (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (74, N'Apple iPhone 7 32GB Black2.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple iPhone 7 32GB Black/Apple iPhone 7 32GB Black2.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (75, N'Apple iPhone 7 32GB Black1.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple iPhone 7 32GB Black/Apple iPhone 7 32GB Black1.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (76, N'Sony WH-1000XM3B Czarne (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony WH-1000XM3B Czarne/Sony WH-1000XM3B Czarne (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (77, N'1.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple iPhone 7 128GB Silver/1.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (78, N' Xbox One X + STAR WARS Upadly Zakon (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox One X + STAR WARS Upadly Zakon/ Xbox One X + STAR WARS Upadly Zakon (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (79, N'3.jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Apple iPhone 7 128GB Silver/3.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (80, N'Dell Alienware AW2518H (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Alienware AW2518H/Dell Alienware AW2518H (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (81, N'Razer Kraken Black (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Kraken Black/Razer Kraken Black (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (82, N' Razer Basilisk (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Basilisk/ Razer Basilisk (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (83, N'Panasonic PT-FW530EJ (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic PT-FW530EJ/Panasonic PT-FW530EJ (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (84, N'Dell Alienware AW2518H (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Alienware AW2518H/Dell Alienware AW2518H (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (85, N'Dell Essential Briefcase 15 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Essential Briefcase 15/Dell Essential Briefcase 15 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (86, N' Playstation ASTRO A10 zielone (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation ASTRO A10 zielone/ Playstation ASTRO A10 zielone (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (87, N'Dell Alienware AW2518H (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Alienware AW2518H/Dell Alienware AW2518H (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (88, N'Dell Essential Briefcase 15 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Essential Briefcase 15/Dell Essential Briefcase 15 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (89, N'Dell Alienware AW2518H (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Alienware AW2518H/Dell Alienware AW2518H (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (90, N'Dell Essential Briefcase 15 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Essential Briefcase 15/Dell Essential Briefcase 15 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (91, N'Panasonic PT-FW530EJ (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic PT-FW530EJ/Panasonic PT-FW530EJ (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (92, N'Nintendo Switch Joy-Con Gray (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Joy-Con Gray/Nintendo Switch Joy-Con Gray (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (93, N'Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny/Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (94, N' Microsoft Surface Keyboard Bluetooth szary (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Surface Keyboard Bluetooth szary/ Microsoft Surface Keyboard Bluetooth szary (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (95, N'Dell P2719H (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell P2719H/Dell P2719H (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (96, N' Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny/ Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (97, N' Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny/ Dell Inspiron 3593 i5-1035G18GB256Win10 Srebrny (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (98, N'Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen/Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (99, N'Dell Smartcard Keyboard KB813 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Smartcard Keyboard KB813/Dell Smartcard Keyboard KB813 (1).jpg')
GO
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (100, N'Dell P2719H (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell P2719H/Dell P2719H (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (101, N'Playstation Redragon THUNDER PRO (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation Redragon THUNDER PRO/Playstation Redragon THUNDER PRO (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (102, N'Dell Smartcard Keyboard KB813 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Smartcard Keyboard KB813/Dell Smartcard Keyboard KB813 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (103, N'Panasonic PT-FW530EJ (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic PT-FW530EJ/Panasonic PT-FW530EJ (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (104, N'Gigabyte Aorus AD27QD czarny HDR (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte Aorus AD27QD czarny HDR/Gigabyte Aorus AD27QD czarny HDR (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (105, N'Panasonic TX-49DX600E (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic TX-49DX600E/Panasonic TX-49DX600E (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (106, N'Gigabyte Aorus AD27QD czarny HDR (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte Aorus AD27QD czarny HDR/Gigabyte Aorus AD27QD czarny HDR (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (107, N'Dell Essential Briefcase 15 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Essential Briefcase 15/Dell Essential Briefcase 15 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (108, N'Panasonic zasilacz 125W (8A, 5.5-2 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic zasilacz 125W (8A, 5.5-2.5mm)/Panasonic zasilacz 125W (8A, 5.5-2 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (109, N'MSI Clutch GM30 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM30/MSI Clutch GM30 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (110, N'MSI Vigor GK40 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Vigor GK40/MSI Vigor GK40 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (111, N'Dell Smartcard Keyboard KB813 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Smartcard Keyboard KB813/Dell Smartcard Keyboard KB813 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (112, N'Dell Smartcard Keyboard KB813 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Dell Smartcard Keyboard KB813/Dell Smartcard Keyboard KB813 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (113, N'Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny/Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (114, N'Gigabyte B450 AORUS PRO (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte B450 AORUS PRO/Gigabyte B450 AORUS PRO (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (115, N'Gigabyte Aorus AD27QD czarny HDR (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte Aorus AD27QD czarny HDR/Gigabyte Aorus AD27QD czarny HDR (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (116, N'Nintendo Switch Joy-Con RBlue + Labo Variety kit (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Joy-Con RBlue + Labo Variety kit/Nintendo Switch Joy-Con RBlue + Labo Variety kit (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (117, N' Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6/ Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (118, N'Xbox HyperX CloudX (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox HyperX CloudX/Xbox HyperX CloudX (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (119, N'Razer Kraken Black (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Kraken Black/Razer Kraken Black (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (120, N'Panasonic TX-49DX600E (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic TX-49DX600E/Panasonic TX-49DX600E (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (121, N' Microsoft Office 365 Personal (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Office 365 Personal/ Microsoft Office 365 Personal (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (122, N' Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB/ Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (123, N' Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB/ Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (124, N' Gigabyte PB500 500W 80 Plus Bronze (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte PB500 500W 80 Plus Bronze/ Gigabyte PB500 500W 80 Plus Bronze (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (125, N' Gigabyte PB500 500W 80 Plus Bronze (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte PB500 500W 80 Plus Bronze/ Gigabyte PB500 500W 80 Plus Bronze (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (126, N' Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB/ Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (127, N'Playstation ASTRO A10 czerwone (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation ASTRO A10 czerwone/Playstation ASTRO A10 czerwone (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (128, N' Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB/ Gigabyte GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (129, N' Gigabyte PB500 500W 80 Plus Bronze (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte PB500 500W 80 Plus Bronze/ Gigabyte PB500 500W 80 Plus Bronze (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (130, N'Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen/Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (131, N' Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6/ Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (132, N' Logitech MX Keys (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech MX Keys/ Logitech MX Keys (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (133, N' Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6/ Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (134, N'Nintendo Switch Lite (Morski).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Lite (Morski)/Nintendo Switch Lite (Morski).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (135, N'Playstation Turtle Beach RECON 50P czarne (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation Turtle Beach RECON 50P czarne/Playstation Turtle Beach RECON 50P czarne (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (136, N' Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6/ Gigabyte Radeon RX 5700 XT Gaming OC 8GB GDDR6 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (137, N'MSI DS501 Gaming (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI DS501 Gaming/MSI DS501 Gaming (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (138, N'Logitech 2.1 Z333 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech 2.1 Z333/Logitech 2.1 Z333 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (139, N'Logitech 2.1 Z333 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech 2.1 Z333/Logitech 2.1 Z333 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (140, N'PlayStation 4 Slim 500GB (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/PlayStation 4 Slim 500GB/PlayStation 4 Slim 500GB (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (141, N'Logitech 2.1 Z333 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech 2.1 Z333/Logitech 2.1 Z333 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (142, N'Razer Ornata Chroma (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Ornata Chroma/Razer Ornata Chroma (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (143, N'Logitech G PRO X GAMING HEADSET (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech G PRO X GAMING HEADSET/Logitech G PRO X GAMING HEADSET (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (144, N' Panasonic Lumix DMC-TZ80 czarny (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic Lumix DMC-TZ80 czarny/ Panasonic Lumix DMC-TZ80 czarny (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (145, N'Logitech G PRO X GAMING HEADSET (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech G PRO X GAMING HEADSET/Logitech G PRO X GAMING HEADSET (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (146, N'Sony WH-1000XM3B Czarne (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony WH-1000XM3B Czarne/Sony WH-1000XM3B Czarne (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (147, N'Nintendo Switch Lite (Szary) (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Lite (Szary)/Nintendo Switch Lite (Szary) (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (148, N'Logitech G305 LIGHTSPEED czarna (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech G305 LIGHTSPEED czarna/Logitech G305 LIGHTSPEED czarna (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (149, N'Nintendo Switch Joy-Con RBlue + Labo Variety kit (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Joy-Con RBlue + Labo Variety kit/Nintendo Switch Joy-Con RBlue + Labo Variety kit (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (150, N'Logitech G305 LIGHTSPEED czarna (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech G305 LIGHTSPEED czarna/Logitech G305 LIGHTSPEED czarna (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (151, N'Razer Atheris (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Atheris/Razer Atheris (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (152, N'Logitech G305 LIGHTSPEED czarna (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech G305 LIGHTSPEED czarna/Logitech G305 LIGHTSPEED czarna (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (153, N'Logitech G305 LIGHTSPEED czarna (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech G305 LIGHTSPEED czarna/Logitech G305 LIGHTSPEED czarna (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (154, N'MSI Vigor GK40 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Vigor GK40/MSI Vigor GK40 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (155, N' Logitech MX Keys (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech MX Keys/ Logitech MX Keys (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (156, N' Logitech MX Keys (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech MX Keys/ Logitech MX Keys (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (157, N'Razer Kraken Black (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Kraken Black/Razer Kraken Black (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (158, N' Logitech MX Keys (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech MX Keys/ Logitech MX Keys (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (159, N'Playstation Turtle Beach RECON 50P czarne (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation Turtle Beach RECON 50P czarne/Playstation Turtle Beach RECON 50P czarne (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (160, N'Logitech Webcam C270 HD (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech Webcam C270 HD/Logitech Webcam C270 HD (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (161, N'Logitech Webcam C270 HD (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech Webcam C270 HD/Logitech Webcam C270 HD (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (162, N'MSI Clutch GM60 Gaming (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM60 Gaming/MSI Clutch GM60 Gaming (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (163, N'Logitech Webcam C270 HD (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Logitech Webcam C270 HD/Logitech Webcam C270 HD (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (164, N'Razer BlackWidow Elite Yellow Switch (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer BlackWidow Elite Yellow Switch/Razer BlackWidow Elite Yellow Switch (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (165, N'MSI Clutch GM11 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM11/MSI Clutch GM11 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (166, N'Xbox One X 1TB Limited Ed. + GoW 5 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox One X 1TB Limited Ed. + GoW 5/Xbox One X 1TB Limited Ed. + GoW 5 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (167, N'MSI Clutch GM11 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM11/MSI Clutch GM11 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (168, N' Microsoft Surface Keyboard Bluetooth szary (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Surface Keyboard Bluetooth szary/ Microsoft Surface Keyboard Bluetooth szary (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (169, N'Razer Kraken Ultimate (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Kraken Ultimate/Razer Kraken Ultimate (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (170, N'MSI Clutch GM11 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM11/MSI Clutch GM11 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (171, N'MSI Clutch GM11 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM11/MSI Clutch GM11 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (172, N'Razer Blade 15 i7-9750H (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Blade 15 i7-9750H/Razer Blade 15 i7-9750H (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (173, N'MSI Clutch GM30 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM30/MSI Clutch GM30 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (174, N'MSI Clutch GM30 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM30/MSI Clutch GM30 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (175, N'Playstation Redragon THUNDER PRO (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation Redragon THUNDER PRO/Playstation Redragon THUNDER PRO (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (176, N' Microsoft 1850 Wireless Mobile Mouse (czarna) (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft 1850 Wireless Mobile Mouse (czarna)/ Microsoft 1850 Wireless Mobile Mouse (czarna) (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (177, N'MSI Clutch GM30 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM30/MSI Clutch GM30 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (178, N'MSI Clutch GM60 Gaming (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM60 Gaming/MSI Clutch GM60 Gaming (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (179, N'PlayStation 4 Slim 500GB (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/PlayStation 4 Slim 500GB/PlayStation 4 Slim 500GB (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (180, N'MSI Vigor GK40 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Vigor GK40/MSI Vigor GK40 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (181, N'MSI Clutch GM60 Gaming (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM60 Gaming/MSI Clutch GM60 Gaming (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (182, N'MSI Clutch GM60 Gaming (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Clutch GM60 Gaming/MSI Clutch GM60 Gaming (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (183, N' Razer Basilisk (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Basilisk/ Razer Basilisk (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (184, N'MSI DS501 Gaming (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI DS501 Gaming/MSI DS501 Gaming (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (185, N'Microsoft Windows 10 Home PL 3264bit BOX USB (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Windows 10 Home PL 3264bit BOX USB/Microsoft Windows 10 Home PL 3264bit BOX USB (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (186, N'MSI DS501 Gaming (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI DS501 Gaming/MSI DS501 Gaming (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (187, N'Razer Ornata Chroma (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Ornata Chroma/Razer Ornata Chroma (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (188, N'MSI DS501 Gaming (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI DS501 Gaming/MSI DS501 Gaming (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (189, N'MSI Vigor GK40 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/MSI Vigor GK40/MSI Vigor GK40 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (190, N' Microsoft Office 365 Personal (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Office 365 Personal/ Microsoft Office 365 Personal (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (191, N' Microsoft 1850 Wireless Mobile Mouse (czarna) (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft 1850 Wireless Mobile Mouse (czarna)/ Microsoft 1850 Wireless Mobile Mouse (czarna) (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (192, N'Nintendo Switch Joy-Con RBlue + Labo Variety kit (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Joy-Con RBlue + Labo Variety kit/Nintendo Switch Joy-Con RBlue + Labo Variety kit (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (193, N' Microsoft 1850 Wireless Mobile Mouse (czarna) (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft 1850 Wireless Mobile Mouse (czarna)/ Microsoft 1850 Wireless Mobile Mouse (czarna) (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (194, N'Razer Ornata Chroma (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Ornata Chroma/Razer Ornata Chroma (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (195, N' Microsoft Office 365 Personal (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Office 365 Personal/ Microsoft Office 365 Personal (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (196, N'Playstation ASTRO A10 czerwone (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation ASTRO A10 czerwone/Playstation ASTRO A10 czerwone (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (197, N' Microsoft Surface Keyboard Bluetooth szary (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Surface Keyboard Bluetooth szary/ Microsoft Surface Keyboard Bluetooth szary (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (198, N' Sony FDR AX700 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony FDR AX700/ Sony FDR AX700 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (199, N'Panasonic Lumix DMC-TZ80 srebrny (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic Lumix DMC-TZ80 srebrny/Panasonic Lumix DMC-TZ80 srebrny (4).jpg')
GO
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (200, N' Microsoft Surface Keyboard Bluetooth szary (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Surface Keyboard Bluetooth szary/ Microsoft Surface Keyboard Bluetooth szary (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (201, N'Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny/Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (202, N'Playstation Turtle Beach RECON 50P czarne (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation Turtle Beach RECON 50P czarne/Playstation Turtle Beach RECON 50P czarne (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (203, N' Razer Basilisk (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Basilisk/ Razer Basilisk (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (204, N'Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny/Microsoft Surface Laptop 3 Ryzen 58GB256 Czarny (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (205, N' Razer Basilisk (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Basilisk/ Razer Basilisk (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (206, N'Microsoft Windows 10 Home PL 3264bit BOX USB (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Microsoft Windows 10 Home PL 3264bit BOX USB/Microsoft Windows 10 Home PL 3264bit BOX USB (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (207, N'Razer Atheris (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Atheris/Razer Atheris (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (208, N'Nintendo Switch Joy-Con Gray (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Joy-Con Gray/Nintendo Switch Joy-Con Gray (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (209, N'Nintendo Switch Joy-Con Gray (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Joy-Con Gray/Nintendo Switch Joy-Con Gray (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (210, N'Playstation Turtle Beach RECON 50P czarne (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation Turtle Beach RECON 50P czarne/Playstation Turtle Beach RECON 50P czarne (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (211, N'Nintendo Switch Joy-Con RBlue + Labo Variety kit (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Joy-Con RBlue + Labo Variety kit/Nintendo Switch Joy-Con RBlue + Labo Variety kit (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (212, N'Razer Atheris (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Atheris/Razer Atheris (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (213, N'Sony WH-1000XM3B Czarne (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony WH-1000XM3B Czarne/Sony WH-1000XM3B Czarne (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (214, N'Nintendo Switch Lite (Szary) (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Lite (Szary)/Nintendo Switch Lite (Szary) (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (215, N'Panasonic TX-49DX600E (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic TX-49DX600E/Panasonic TX-49DX600E (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (216, N'Nintendo Switch Lite (Zolty) (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Lite (Zolty)/Nintendo Switch Lite (Zolty) (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (217, N'Sony Xperia 10 I4113 364GB Dual SIM rozowy (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia 10 I4113 364GB Dual SIM rozowy/Sony Xperia 10 I4113 364GB Dual SIM rozowy (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (218, N'Nintendo Switch Lite (Zolty) (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Nintendo Switch Lite (Zolty)/Nintendo Switch Lite (Zolty) (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (219, N' Panasonic Lumix DMC-TZ80 czarny (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic Lumix DMC-TZ80 czarny/ Panasonic Lumix DMC-TZ80 czarny (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (220, N'Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen/Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (221, N' Sony FDR AX700 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony FDR AX700/ Sony FDR AX700 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (222, N' Panasonic Lumix DMC-TZ80 czarny (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic Lumix DMC-TZ80 czarny/ Panasonic Lumix DMC-TZ80 czarny (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (223, N'Panasonic Lumix DMC-TZ80 srebrny (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic Lumix DMC-TZ80 srebrny/Panasonic Lumix DMC-TZ80 srebrny (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (224, N'Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern/Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (225, N'Panasonic Lumix DMC-TZ80 srebrny (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic Lumix DMC-TZ80 srebrny/Panasonic Lumix DMC-TZ80 srebrny (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (226, N'Panasonic Lumix DMC-TZ80 srebrny (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic Lumix DMC-TZ80 srebrny/Panasonic Lumix DMC-TZ80 srebrny (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (227, N'PlayStation 4 Slim 500GB (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/PlayStation 4 Slim 500GB/PlayStation 4 Slim 500GB (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (228, N'Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen/Sony Xperia XZ3 H9436 464GB Dual SIM Lesna zielen (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (229, N'Playstation Redragon THUNDER PRO (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation Redragon THUNDER PRO/Playstation Redragon THUNDER PRO (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (230, N'Panasonic zasilacz 125W (8A, 5.5-2 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic zasilacz 125W (8A, 5.5-2.5mm)/Panasonic zasilacz 125W (8A, 5.5-2 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (231, N'Panasonic zasilacz 125W (8A, 5.5-2 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Panasonic zasilacz 125W (8A, 5.5-2.5mm)/Panasonic zasilacz 125W (8A, 5.5-2 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (232, N'Playstation ASTRO A10 czerwone (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation ASTRO A10 czerwone/Playstation ASTRO A10 czerwone (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (233, N'Xbox HyperX CloudX (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox HyperX CloudX/Xbox HyperX CloudX (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (234, N'Sony Xperia 10 I4113 364GB Dual SIM rozowy (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia 10 I4113 364GB Dual SIM rozowy/Sony Xperia 10 I4113 364GB Dual SIM rozowy (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (235, N' Playstation ASTRO A10 zielone (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation ASTRO A10 zielone/ Playstation ASTRO A10 zielone (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (236, N'Sony WH-1000XM3B Czarne (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony WH-1000XM3B Czarne/Sony WH-1000XM3B Czarne (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (237, N' Playstation ASTRO A10 zielone (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Playstation ASTRO A10 zielone/ Playstation ASTRO A10 zielone (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (238, N'Xbox One X 1TB Limited Ed. + GoW 5 (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox One X 1TB Limited Ed. + GoW 5/Xbox One X 1TB Limited Ed. + GoW 5 (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (239, N'Razer Atheris (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Atheris/Razer Atheris (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (240, N' Xbox One X + STAR WARS Upadly Zakon (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox One X + STAR WARS Upadly Zakon/ Xbox One X + STAR WARS Upadly Zakon (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (241, N'Xbox One X 1TB Limited Ed. + GoW 5 (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox One X 1TB Limited Ed. + GoW 5/Xbox One X 1TB Limited Ed. + GoW 5 (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (242, N'Razer BlackWidow Elite Yellow Switch (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer BlackWidow Elite Yellow Switch/Razer BlackWidow Elite Yellow Switch (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (243, N'Razer Blade 15 i7-9750H (4).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Blade 15 i7-9750H/Razer Blade 15 i7-9750H (4).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (244, N'Razer Blade 15 i7-9750H (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Blade 15 i7-9750H/Razer Blade 15 i7-9750H (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (245, N'Xbox One X 1TB Limited Ed. + GoW 5 (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox One X 1TB Limited Ed. + GoW 5/Xbox One X 1TB Limited Ed. + GoW 5 (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (246, N'Razer Kraken Black (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Kraken Black/Razer Kraken Black (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (247, N'Razer Kraken Ultimate (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Kraken Ultimate/Razer Kraken Ultimate (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (248, N'Razer Kraken Ultimate (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Kraken Ultimate/Razer Kraken Ultimate (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (249, N'Razer Kraken Ultimate (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Razer Kraken Ultimate/Razer Kraken Ultimate (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (250, N' Sony FDR AX700 (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony FDR AX700/ Sony FDR AX700 (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (251, N' Xbox One X + STAR WARS Upadly Zakon (2).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox One X + STAR WARS Upadly Zakon/ Xbox One X + STAR WARS Upadly Zakon (2).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (252, N'Sony Xperia 10 I4113 364GB Dual SIM rozowy (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia 10 I4113 364GB Dual SIM rozowy/Sony Xperia 10 I4113 364GB Dual SIM rozowy (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (253, N'Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern/Sony Xperia XZ2 Compact H8324 Dual SIM Ksiezycowa czern (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (254, N'Xbox HyperX CloudX (1).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox HyperX CloudX/Xbox HyperX CloudX (1).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (255, N'Xbox HyperX CloudX (3).jpg', N'https://kompexstorage.blob.core.windows.net/kompiutex/Xbox HyperX CloudX/Xbox HyperX CloudX (3).jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (256, N'11', N'https://kompexstorage.blob.core.windows.net/kompiutex/g2/de70799ca7b7dca562cf4f783c5ce2a9.jpg')
INSERT [dbo].[Images] ([ImageId], [Name], [Url]) VALUES (257, N'212', N'https://kompexstorage.blob.core.windows.net/kompiutex/g2/g1.jfif')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (1, 1, 86, 899, 5, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (2, 2, 81, 1000, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (3, 3, 90, 2179, 123, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (4, 4, 83, 1769, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (5, 4, 93, 1900, 15, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (6, 4, 94, 2100, 2, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (7, 5, 86, 899, 1, 1)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (8, 6, 94, 2100, 800, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (9, 7, 81, 1000, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (10, 8, 83, 1769, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (11, 8, 90, 2179, 3, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (12, 9, 99, 2200, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (13, 10, 87, 319, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (14, 11, 93, 1900, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (15, 11, 86, 899, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (16, 12, 86, 899, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (17, 13, 86, 899, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (18, 14, 86, 899, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (19, 15, 86, 899, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (20, 16, 86, 899, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (21, 17, 86, 899, 1, 0)
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [ProductId], [PricePerItem], [Quantity], [IsCompleted]) VALUES (22, 18, 86, 899, 1, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (1, 1)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (2, 2)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (3, 3)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (4, 4)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (4, 5)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (4, 6)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (5, 7)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (6, 8)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (7, 9)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (8, 10)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (8, 11)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (9, 12)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (10, 13)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (11, 14)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (11, 15)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (12, 16)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (13, 17)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (14, 18)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (15, 19)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (16, 20)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (17, 21)
INSERT [dbo].[OrderDetailsOrders] ([OrderId], [OrderDetailsId]) VALUES (18, 22)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (1, N'4a040c1e-8229-4536-bb6e-ee2e73b0361f', CAST(N'2020-02-26T20:27:15.9670083' AS DateTime2), 4495, 2, NULL, 1, NULL, N'a74c01af-339a-4969-9ef6-532c51f31ef9', 3, 2)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (2, N'4a040c1e-8229-4536-bb6e-ee2e73b0361f', CAST(N'2020-02-26T20:27:44.9044645' AS DateTime2), 1000, 2, NULL, 1, NULL, N'a74c01af-339a-4969-9ef6-532c51f31ef9', 4, 3)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (3, N'4a040c1e-8229-4536-bb6e-ee2e73b0361f', CAST(N'2020-02-26T20:27:53.5177886' AS DateTime2), 268017, 1, NULL, 1, NULL, NULL, 1, 2)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (4, N'4a040c1e-8229-4536-bb6e-ee2e73b0361f', CAST(N'2020-02-26T20:29:03.5517587' AS DateTime2), 34469, 1, NULL, 1, NULL, NULL, 1, 2)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (5, N'4a040c1e-8229-4536-bb6e-ee2e73b0361f', CAST(N'2020-02-26T20:29:23.6331463' AS DateTime2), 899, 5, NULL, 1, NULL, N'a74c01af-339a-4969-9ef6-532c51f31ef9', 1, 2)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (6, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-02-26T20:37:22.7367949' AS DateTime2), 1680000, 2, NULL, 3, NULL, N'a74c01af-339a-4969-9ef6-532c51f31ef9', 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (7, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-02-26T20:40:56.9846571' AS DateTime2), 1000, 2, NULL, 3, NULL, N'a74c01af-339a-4969-9ef6-532c51f31ef9', 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (8, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-02-26T21:34:38.8422125' AS DateTime2), 8306, 2, NULL, 3, NULL, N'a74c01af-339a-4969-9ef6-532c51f31ef9', 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (9, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-02-27T10:33:22.2631801' AS DateTime2), 2200, 1, NULL, 3, NULL, NULL, 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (10, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-02-27T10:33:27.1708837' AS DateTime2), 319, 1, NULL, 3, NULL, NULL, 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (11, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-02-27T10:33:42.6225825' AS DateTime2), 2799, 1, NULL, 3, NULL, NULL, 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (12, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-03-01T13:00:17.3714770' AS DateTime2), 899, 1, NULL, 3, NULL, NULL, 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (13, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-03-01T13:04:05.8654212' AS DateTime2), 899, 1, NULL, 3, NULL, NULL, 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (14, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-03-01T13:04:34.7946259' AS DateTime2), 899, 1, NULL, 3, NULL, NULL, 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (15, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-03-01T13:06:16.3818945' AS DateTime2), 899, 1, NULL, 3, NULL, NULL, 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (16, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-03-01T13:07:16.1632459' AS DateTime2), 899, 1, NULL, 3, NULL, NULL, 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (17, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-03-01T13:08:06.0511434' AS DateTime2), 899, 1, NULL, 3, NULL, NULL, 2, 1)
INSERT [dbo].[Orders] ([OrderId], [IdentityUserId], [OrderDate], [TotalPrice], [OrderStatus], [TrackingNumber], [AddressId], [Message], [EmployeeId], [PayingMethodId], [ShippingMethodId]) VALUES (18, N'a74c01af-339a-4969-9ef6-532c51f31ef9', CAST(N'2020-03-01T13:08:38.7933018' AS DateTime2), 899, 1, NULL, 3, NULL, NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[PayingMethods] ON 

INSERT [dbo].[PayingMethods] ([PayingMethodId], [Name], [Cost], [Icon]) VALUES (1, N'Gotówka przy odbiorze', 5, N'fas fa-box-open')
INSERT [dbo].[PayingMethods] ([PayingMethodId], [Name], [Cost], [Icon]) VALUES (2, N'Przelew bankowy', 0, N'fas fa-university')
INSERT [dbo].[PayingMethods] ([PayingMethodId], [Name], [Cost], [Icon]) VALUES (3, N'PayPal', 0, N'fab fa-paypal')
INSERT [dbo].[PayingMethods] ([PayingMethodId], [Name], [Cost], [Icon]) VALUES (4, N'Płatność kartą', 5, N'fab fa-cc-visa')
SET IDENTITY_INSERT [dbo].[PayingMethods] OFF
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (2, 1)
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (3, 1)
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (4, 1)
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (1, 2)
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (2, 2)
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (3, 2)
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (4, 2)
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (2, 3)
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (3, 3)
INSERT [dbo].[PayingShippingMethods] ([PayingMethodId], [ShippingMethodId]) VALUES (4, 3)
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostId], [Title], [Content], [IsActive], [PublicationDate], [GalleryId]) VALUES (1, N'Lorem ipsum dolor sit amet', N'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker', 1, CAST(N'2020-02-12T00:00:00.0000000' AS DateTime2), 75)
INSERT [dbo].[Posts] ([PostId], [Title], [Content], [IsActive], [PublicationDate], [GalleryId]) VALUES (2, N'Lorem ipsum dolor sit amet', N'    Layout = "_UserLayout";
    ViewBag.DisableNavbar = true;
    ViewBag.DisableFooter = true;', 1, CAST(N'2020-02-06T00:00:00.0000000' AS DateTime2), 76)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (81, N'iPhone 7 32GB Black', 0, 12, 35, 24, 1459, 1, 998)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (83, N'iPhone 7 128GB Silver', 0, 12, 39, 24, 1769, 1, 998)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (84, N'MacBook Pro', 0, 12, 33, 10, 6799, 1, 1000)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (86, N'Watch 3', 1, 12, 36, 25, 899, 1, 986)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (87, N'Magic Mouse 2', 1, 12, 37, 12, 319, 1, 999)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (89, N'X543UA-DM1898', 1, 13, 26, 10, 1130, 1, 1000)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (90, N'Alienware AW2518H', 1, 14, 42, 11, 2179, 1, 874)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (92, N'ZenFone 6 ZS630KL', 1, 13, 28, 24, 2300, 1, 1000)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (93, N'Radeon RX 5700 XT Gaming OC 8GB', 1, 15, 55, 8, 1900, 1, 984)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (94, N'ROG PG258Q', 1, 13, 20, 11, 2100, 1, 198)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (95, N'GeForce RTX 2070 SUPER WINDFORCE OC 3X 8GB', 0, 15, 57, 8, 2400, 1, 1000)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (96, N'PRIME B360M-A', 0, 13, 17, 16, 449, 1, 1000)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (97, N'P2719H', 0, 14, 29, 11, 809, 1, 1000)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (98, N'B450 AORUS PRO', 1, 15, 9, 16, 500, 1, 1000)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (99, N'Aorus AD27QD', 1, 15, 34, 11, 2200, 1, 999)
INSERT [dbo].[Products] ([ProductId], [Name], [IsRecommended], [BrandId], [GalleryId], [CategoryId], [Price], [IsActive], [QuantityInStock]) VALUES (100, N'PB500 500W 80 Plus Bronze', 1, 15, 23, 31, 179, 1, 1000)
SET IDENTITY_INSERT [dbo].[Products] OFF
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (1, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (1, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (2, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (2, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (2, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (3, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (3, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (3, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (3, 86)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (4, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (5, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (5, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (5, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (5, 86)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (6, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (6, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (6, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (6, 86)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (15, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (15, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (15, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (15, 86)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (15, 87)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (16, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (16, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (16, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (16, 86)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (16, 87)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (17, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (17, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (17, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (17, 86)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (17, 87)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (19, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (19, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (19, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (19, 86)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (29, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (29, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (29, 87)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (35, 87)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (38, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (38, 83)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (39, 84)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (40, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (41, 81)
INSERT [dbo].[ProductTags] ([TagId], [ProductId]) VALUES (41, 83)
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([RatingId], [ProductId], [Value], [IdentityUserId]) VALUES (1, 81, 4, N'25566d67-263e-4ccb-906c-e932b92c72f4')
INSERT [dbo].[Ratings] ([RatingId], [ProductId], [Value], [IdentityUserId]) VALUES (2, 81, 5, N'a74c01af-339a-4969-9ef6-532c51f31ef9')
SET IDENTITY_INSERT [dbo].[Ratings] OFF
SET IDENTITY_INSERT [dbo].[Sections] ON 

INSERT [dbo].[Sections] ([SectionId], [Name], [Icon]) VALUES (1, N'Podzespoly komputerowe', N'fas fa-hdd')
INSERT [dbo].[Sections] ([SectionId], [Name], [Icon]) VALUES (2, N'Tablety i laptopy', N'fas fa-laptop')
INSERT [dbo].[Sections] ([SectionId], [Name], [Icon]) VALUES (3, N'Telefony i GPS', N'fas fa-mobile')
INSERT [dbo].[Sections] ([SectionId], [Name], [Icon]) VALUES (4, N'Urzadzenia peryferyjne', N'fas fa-keyboard')
INSERT [dbo].[Sections] ([SectionId], [Name], [Icon]) VALUES (5, N'RTV', N'fas fa-tv')
INSERT [dbo].[Sections] ([SectionId], [Name], [Icon]) VALUES (6, N'Oprogramowanie', N'fab fa-windows')
SET IDENTITY_INSERT [dbo].[Sections] OFF
SET IDENTITY_INSERT [dbo].[ShippingMethods] ON 

INSERT [dbo].[ShippingMethods] ([ShippingMethodId], [Name], [Cost], [Icon]) VALUES (1, N'Dostawa kurierem', 20, N'fas fa-truck-moving')
INSERT [dbo].[ShippingMethods] ([ShippingMethodId], [Name], [Cost], [Icon]) VALUES (2, N'Odbierz w salonie', 0, N'fas fa-store')
INSERT [dbo].[ShippingMethods] ([ShippingMethodId], [Name], [Cost], [Icon]) VALUES (3, N'Odbiór w paczkomacie', 9.9, N'fas fa-boxes')
SET IDENTITY_INSERT [dbo].[ShippingMethods] OFF
SET IDENTITY_INSERT [dbo].[ShoppingCarts] ON 

INSERT [dbo].[ShoppingCarts] ([ShoppingCartId], [IdentityUserId], [ProductId], [Quantity], [HotShotId]) VALUES (26, N'a74c01af-339a-4969-9ef6-532c51f31ef9', 86, 1, NULL)
SET IDENTITY_INSERT [dbo].[ShoppingCarts] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (1, N'Przekątna ekranu')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (2, N'Pamięć RAM')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (3, N'Procesor')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (4, N'Grafika')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (5, N'Matryca')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (6, N'Rozdzielczość')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (7, N'Chipset')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (8, N'Gniazdo procesora')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (9, N'Format')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (10, N'Typ obsługiwanej pamięci')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (11, N'Liczba banków pamięci')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (12, N'Maksymalna wielkość pamięci RAM')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (13, N'Złącza')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (14, N'Układ audio')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (15, N'Szerokość')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (16, N'Wysokość')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (17, N'Gwarancja')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (18, N'Układ')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (19, N'Pamięć')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (20, N'Rodzaj pamięci')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (21, N'Częstotliwość odświeśania')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (22, N'Format ekranu')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (23, N'Czas reakcji')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (24, N'Liczba wyświetlanych kolorów')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (25, N'Jasność')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (26, N'Kontrast')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (27, N'Głośniki')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (28, N'Tuner TV')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (29, N'Waga')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (30, N'Pobór mocy podczas pracy')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (31, N'Pobór mocy podczas spoczynku')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (32, N'Szyna pamięci')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (33, N'Taktowanie pamięci')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (34, N'Rekomendowana moc zasilacza')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (35, N'Długość')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (36, N'Rodzaj złącza')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (37, N'Kamera internetowa')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (38, N'System operacyjny')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (39, N'Kolor dominujący')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (40, N'Dołączone akcesoria')
INSERT [dbo].[Tags] ([TagId], [Name]) VALUES (41, N'Bateria')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[TagValues] ON 

INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (204, N'1960 mAh', 41, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (207, N'Ładowarka, słuchawki', 40, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (208, N'12 miesięcy', 17, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (209, N'IPS', 5, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (210, N'32 GB', 19, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (211, N'2 GB', 2, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (212, N'Apple A10', 3, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (213, N'4,7"', 1, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (214, N'1334 x 750', 6, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (215, N'iOS 10', 38, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (216, N'67,1 mm', 15, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (217, N'138 g', 29, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (218, N'138,3 mm', 16, 81)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (219, N'1960 mAh', 41, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (220, N'12 miesięcy', 17, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (221, N'IPS', 5, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (222, N'128 GB', 19, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (223, N'2 GB', 2, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (224, N'Apple A10', 3, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (225, N'4,7"', 1, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (226, N'1334 x 750', 6, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (227, N'iOS 10', 38, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (228, N'67,1 mm', 15, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (229, N'138,3 mm', 16, 83)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (230, N'Intel Iris Plus Graphics 655', 4, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (231, N'12 miesięcy', 17, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (232, N'Srebrny', 39, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (233, N'LED, IPS, Retina', 5, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (234, N'256 GB', 19, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (235, N'8 GB', 2, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (236, N'Intel Core i5-8279U', 3, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (237, N'2560 x 1600', 6, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (238, N'304 mm', 15, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (239, N'1,37 kg', 29, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (240, N'14,9 mm', 16, 84)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (241, N'12 miesięcy', 17, 86)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (242, N'OLED, Retina', 5, 86)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (243, N'8 GB', 19, 86)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (244, N'Apple S3', 3, 86)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (245, N'312 x 390 px', 6, 86)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (246, N'36,4 mm', 15, 86)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (247, N'42,5 mm', 16, 86)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (248, N'113,5 mm', 35, 87)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (249, N'6 miesięcy', 17, 87)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (250, N'57,1 mm', 15, 87)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (251, N'99,2 g', 29, 87)
INSERT [dbo].[TagValues] ([TagValueId], [Value], [TagId], [ProductId]) VALUES (252, N'21,6 mm', 16, 87)
SET IDENTITY_INSERT [dbo].[TagValues] OFF
ALTER TABLE [dbo].[Brands] ADD  DEFAULT ((0)) FOR [ImageId]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [PayingMethodId]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [ShippingMethodId]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [QuantityInStock]
GO
ALTER TABLE [dbo].[TagValues] ADD  DEFAULT ((0)) FOR [ProductId]
GO
ALTER TABLE [dbo].[AccountHotShots]  WITH CHECK ADD  CONSTRAINT [FK_AccountHotShots_AspNetUsers_IdentityUserId] FOREIGN KEY([IdentityUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountHotShots] CHECK CONSTRAINT [FK_AccountHotShots_AspNetUsers_IdentityUserId]
GO
ALTER TABLE [dbo].[AccountHotShots]  WITH CHECK ADD  CONSTRAINT [FK_AccountHotShots_HotShots_HotShotId1] FOREIGN KEY([HotShotId1])
REFERENCES [dbo].[HotShots] ([HotShotId])
GO
ALTER TABLE [dbo].[AccountHotShots] CHECK CONSTRAINT [FK_AccountHotShots_HotShots_HotShotId1]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_AspNetUsers_IdentityUserId] FOREIGN KEY([IdentityUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_AspNetUsers_IdentityUserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Brands]  WITH CHECK ADD  CONSTRAINT [FK_Brands_Images_ImageId] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Images] ([ImageId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Brands] CHECK CONSTRAINT [FK_Brands_Images_ImageId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Sections_SectionId] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([SectionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Sections_SectionId]
GO
ALTER TABLE [dbo].[HotShots]  WITH CHECK ADD  CONSTRAINT [FK_HotShots_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HotShots] CHECK CONSTRAINT [FK_HotShots_Products_ProductId]
GO
ALTER TABLE [dbo].[ImageGalleries]  WITH CHECK ADD  CONSTRAINT [FK_ImageGalleries_Galleries_GalleryId] FOREIGN KEY([GalleryId])
REFERENCES [dbo].[Galleries] ([GalleryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImageGalleries] CHECK CONSTRAINT [FK_ImageGalleries_Galleries_GalleryId]
GO
ALTER TABLE [dbo].[ImageGalleries]  WITH CHECK ADD  CONSTRAINT [FK_ImageGalleries_Images_ImageId] FOREIGN KEY([ImageId])
REFERENCES [dbo].[Images] ([ImageId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImageGalleries] CHECK CONSTRAINT [FK_ImageGalleries_Images_ImageId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderDetailsOrders]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsOrders_OrderDetails_OrderDetailsId] FOREIGN KEY([OrderDetailsId])
REFERENCES [dbo].[OrderDetails] ([OrderDetailsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetailsOrders] CHECK CONSTRAINT [FK_OrderDetailsOrders_OrderDetails_OrderDetailsId]
GO
ALTER TABLE [dbo].[OrderDetailsOrders]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailsOrders_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetailsOrders] CHECK CONSTRAINT [FK_OrderDetailsOrders_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Addresses_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Addresses] ([AddressId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Addresses_AddressId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_EmployeeId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_IdentityUserId] FOREIGN KEY([IdentityUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_IdentityUserId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PayingMethods_PayingMethodId] FOREIGN KEY([PayingMethodId])
REFERENCES [dbo].[PayingMethods] ([PayingMethodId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PayingMethods_PayingMethodId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_ShippingMethods_ShippingMethodId] FOREIGN KEY([ShippingMethodId])
REFERENCES [dbo].[ShippingMethods] ([ShippingMethodId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_ShippingMethods_ShippingMethodId]
GO
ALTER TABLE [dbo].[PayingShippingMethods]  WITH CHECK ADD  CONSTRAINT [FK_PayingShippingMethods_PayingMethods_PayingMethodId] FOREIGN KEY([PayingMethodId])
REFERENCES [dbo].[PayingMethods] ([PayingMethodId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PayingShippingMethods] CHECK CONSTRAINT [FK_PayingShippingMethods_PayingMethods_PayingMethodId]
GO
ALTER TABLE [dbo].[PayingShippingMethods]  WITH CHECK ADD  CONSTRAINT [FK_PayingShippingMethods_ShippingMethods_ShippingMethodId] FOREIGN KEY([ShippingMethodId])
REFERENCES [dbo].[ShippingMethods] ([ShippingMethodId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PayingShippingMethods] CHECK CONSTRAINT [FK_PayingShippingMethods_ShippingMethods_ShippingMethodId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Galleries_GalleryId] FOREIGN KEY([GalleryId])
REFERENCES [dbo].[Galleries] ([GalleryId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Galleries_GalleryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Galleries_GalleryId] FOREIGN KEY([GalleryId])
REFERENCES [dbo].[Galleries] ([GalleryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Galleries_GalleryId]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_ProductTags_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_ProductTags_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_ProductTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_ProductTags_Tags_TagId]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_AspNetUsers_IdentityUserId] FOREIGN KEY([IdentityUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_AspNetUsers_IdentityUserId]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Products_ProductId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_AspNetUsers_IdentityUserId] FOREIGN KEY([IdentityUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_AspNetUsers_IdentityUserId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_HotShots_HotShotId] FOREIGN KEY([HotShotId])
REFERENCES [dbo].[HotShots] ([HotShotId])
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_HotShots_HotShotId]
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Products_ProductId]
GO
ALTER TABLE [dbo].[TagValues]  WITH CHECK ADD  CONSTRAINT [FK_TagValues_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TagValues] CHECK CONSTRAINT [FK_TagValues_Products_ProductId]
GO
ALTER TABLE [dbo].[TagValues]  WITH CHECK ADD  CONSTRAINT [FK_TagValues_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TagValues] CHECK CONSTRAINT [FK_TagValues_Tags_TagId]
GO
