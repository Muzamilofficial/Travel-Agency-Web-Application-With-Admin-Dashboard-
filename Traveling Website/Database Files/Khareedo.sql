USE [master]
GO
/****** Object:  Database [kahreedo]    Script Date: 27/08/2023 9:50:57 am ******/
CREATE DATABASE [kahreedo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kahreedo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\kahreedo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kahreedo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\kahreedo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [kahreedo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kahreedo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kahreedo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kahreedo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kahreedo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kahreedo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kahreedo] SET ARITHABORT OFF 
GO
ALTER DATABASE [kahreedo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [kahreedo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kahreedo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kahreedo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kahreedo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kahreedo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kahreedo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kahreedo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kahreedo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kahreedo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kahreedo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kahreedo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kahreedo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kahreedo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kahreedo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kahreedo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kahreedo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kahreedo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kahreedo] SET  MULTI_USER 
GO
ALTER DATABASE [kahreedo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kahreedo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kahreedo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kahreedo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kahreedo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kahreedo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [kahreedo] SET QUERY_STORE = ON
GO
ALTER DATABASE [kahreedo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [kahreedo]
GO
/****** Object:  Table [dbo].[admin_Employee]    Script Date: 27/08/2023 9:51:00 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Employee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NULL,
	[Age] [int] NULL,
	[DateofBirth] [date] NULL,
	[Gender] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Mobile] [varchar](15) NOT NULL,
	[PhotoPath] [varchar](500) NULL,
	[Password] [nvarchar](150) NULL,
	[InActive] [bit] NULL,
 CONSTRAINT [PK_admin_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin_Login]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleType] [int] NULL,
	[Notes] [varchar](255) NULL,
 CONSTRAINT [PK_admin_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
	[Picture1] [varchar](255) NULL,
	[Picture2] [varchar](250) NULL,
	[isActive] [bit] NULL,
	[Createddate] [date] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[First Name] [varchar](50) NOT NULL,
	[Last Name] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Age] [int] NULL,
	[Gender] [varchar](50) NULL,
	[DateofBirth] [date] NULL,
	[Organization] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PostalCode] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AltEmail] [varchar](50) NULL,
	[Phone1] [varchar](50) NULL,
	[Phone2] [varchar](20) NULL,
	[Mobile1] [varchar](50) NULL,
	[Mobile2] [varchar](50) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Picture] [varchar](250) NULL,
	[status] [varchar](50) NULL,
	[LastLogin] [datetime] NULL,
	[Created] [date] NULL,
	[Notes] [varchar](250) NULL,
	[InActive] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genMainSlider]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genMainSlider](
	[MainSliderID] [int] IDENTITY(1,1) NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](255) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](255) NULL,
	[BtnText] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genMainSlider] PRIMARY KEY CLUSTERED 
(
	[MainSliderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genPromoRight]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genPromoRight](
	[PromoRightID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](500) NULL,
	[OfferTag] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_genPromoRight] PRIMARY KEY CLUSTERED 
(
	[PromoRightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodReceiptNote]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodReceiptNote](
	[GoodRecieptNote] [int] IDENTITY(1,1) NOT NULL,
	[SupplierQoutationID] [int] NULL,
	[ReqQoutationID] [int] NULL,
	[Product] [nvarchar](150) NULL,
	[Supplier] [nvarchar](150) NULL,
	[QuantityNeeded] [int] NULL,
	[SupplierQuantity] [int] NULL,
	[UnitPrice] [int] NULL,
	[TotalPrice] [int] NULL,
	[SupQuantity] [nvarchar](150) NULL,
	[ConUnit] [nvarchar](150) NULL,
	[Tax] [nvarchar](150) NULL,
	[PaymentTerm] [int] NULL,
 CONSTRAINT [PK__GoodRece__DD40853723EF2006] PRIMARY KEY CLUSTERED 
(
	[GoodRecieptNote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[ShipingID] [int] NULL,
	[Discount] [int] NULL,
	[Taxes] [int] NULL,
	[TotalAmount] [int] NULL,
	[isCompleted] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[DIspatched] [bit] NULL,
	[DispatchedDate] [datetime] NULL,
	[Shipped] [bit] NULL,
	[ShippingDate] [datetime] NULL,
	[Deliver] [bit] NULL,
	[DeliveryDate] [datetime] NULL,
	[Notes] [varchar](500) NULL,
	[CancelOrder] [bit] NULL,
 CONSTRAINT [PK_Oder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Discount] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[OrderDate] [datetime] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[CreditAmount] [money] NULL,
	[DebitAmount] [money] NULL,
	[Balance] [money] NULL,
	[PaymentDateTime] [datetime] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PayTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PayTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NULL,
	[QuantityPerUnit] [varchar](50) NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[OldPrice] [decimal](18, 0) NULL,
	[UnitWeight] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Discount] [decimal](18, 0) NULL,
	[UnitInStock] [int] NULL,
	[UnitOnOrder] [int] NULL,
	[ProductAvailable] [bit] NULL,
	[ImageURL] [varchar](500) NULL,
	[AltText] [varchar](50) NULL,
	[AddBadge] [bit] NULL,
	[OfferTitle] [varchar](50) NULL,
	[OfferBadgeClass] [varchar](50) NULL,
	[ShortDescription] [varchar](300) NULL,
	[LongDescription] [varchar](2000) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[Picture3] [varchar](500) NULL,
	[Picture4] [varchar](500) NULL,
	[Note] [varchar](250) NULL,
	[UnitMeasureID] [int] NULL,
	[InActive] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseReturn]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturn](
	[PurchaseReturnID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier] [int] NULL,
	[Product] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecentlyViews]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecentlyViews](
	[RViewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ViewDate] [datetime] NOT NULL,
	[Note] [varchar](255) NULL,
 CONSTRAINT [PK_RecentlyViews] PRIMARY KEY CLUSTERED 
(
	[RViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestforQoutation]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestforQoutation](
	[ReqQoutationID] [int] IDENTITY(1,1) NOT NULL,
	[Product] [int] NULL,
	[Supplier] [int] NULL,
	[Quantity] [int] NULL,
	[ProductDate] [date] NULL,
	[suppName] [nchar](10) NULL,
 CONSTRAINT [PK__Requestf__6BA8829DBA55FCC9] PRIMARY KEY CLUSTERED 
(
	[ReqQoutationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Review] [varchar](500) NULL,
	[Rate] [int] NULL,
	[DateTime] [datetime] NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[DateCreated] [date] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesReturn]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturn](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](150) NULL,
	[Product] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[BookingID] [int] NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Mobile] [varchar](20) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Province] [varchar](20) NULL,
	[City] [varchar](20) NULL,
	[PostCode] [varchar](10) NULL,
 CONSTRAINT [PK_ShippingDetails] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Description] [varchar](250) NULL,
	[Picture1] [varchar](500) NULL,
	[Picture2] [varchar](500) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[ContactName] [varchar](50) NULL,
	[ContactTitle] [varchar](50) NULL,
	[Address] [varchar](128) NULL,
	[Mobile] [varchar](15) NULL,
	[Phone] [varchar](15) NOT NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[City] [varchar](20) NULL,
	[Country] [varchar](20) NULL,
	[InActive] [bit] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_SupplierPayment]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SupplierPayment](
	[SupplierPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[invoiceId] [int] NULL,
	[Supplier] [int] NULL,
	[PaymentDate] [date] NULL,
	[PaymentTerm] [int] NULL,
	[CreatedDate] [date] NULL,
	[Tax] [int] NULL,
	[Totalamount] [decimal](18, 2) NULL,
	[NetAmount] [decimal](18, 2) NULL,
	[Sup] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Tax]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Tax](
	[TaxID] [int] IDENTITY(1,1) NOT NULL,
	[TaxRate] [decimal](18, 0) NULL,
	[Taxcode] [nvarchar](150) NULL,
	[CreatedDate] [date] NULL,
	[TaxValue] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaxID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UnitofMeasures]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UnitofMeasures](
	[UnitMeasureID] [int] IDENTITY(1,1) NOT NULL,
	[UnitMeasure] [nvarchar](150) NULL,
	[Description] [nvarchar](150) NULL,
	[Abbrevation] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitMeasureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 27/08/2023 9:51:01 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Wishlist] PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin_Employee] ON 

INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (1, N'Hamza', N'Ali', 22, CAST(N'1994-08-26' AS Date), N'Male', N'hamza@gmail.com', N'karachi', N'02136256352', N'03441234567', NULL, N'124d', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (5, N'Ali', N'Akram', 22, CAST(N'1997-08-26' AS Date), N'Male', N'zulfiqar@hotmail.com', N'karachi', N'03441234567', N'03441234567', NULL, N'a', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (6, N'Rumail', N'Kumar', 22, CAST(N'1994-08-26' AS Date), N'Male', N'mevansharma4@gmail.com', N'flat# 201 adan wala appt garden east karachi', N'03420821307', N'03420821307', NULL, N'a', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (7, N'mk', N'mk', 22, CAST(N'1994-08-26' AS Date), N'Female', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'123', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (8, N'Mevan', N'Kumar', 12, CAST(N'1994-08-26' AS Date), N'Female', N'mevansharma4@gmail.com', N'flat# 201 adan wala appt garden east karachi', N'+923420821307', N'+923420821307', NULL, N'123', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (9, N'Mevan', N'Kumar', 12, CAST(N'1994-08-26' AS Date), N'Male', N'mevansharma4@gmail.com', N'flat# 201 adan wala appt garden east karachi', N'+923420821307', N'+923420821307', NULL, N'123', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (10, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'0336350693', N'0336350693', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (11, N'mk', N'mk', 0, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'0336350693', N'0336350693', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (12, N'mk', N'mk', 0, CAST(N'1990-12-12' AS Date), NULL, N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (13, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'0336350693', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (14, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), NULL, N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'033635069', NULL, N'abc', NULL)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (15, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'abc', 1)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (16, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'abc', 0)
INSERT [dbo].[admin_Employee] ([EmpID], [FirstName], [LastName], [Age], [DateofBirth], [Gender], [Email], [Address], [Phone], [Mobile], [PhotoPath], [Password], [InActive]) VALUES (17, N'mk', N'mk', 12, CAST(N'1990-12-12' AS Date), N'Male', N'mkmuzammil191@gmail.com', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'abc', 0)
SET IDENTITY_INSERT [dbo].[admin_Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[admin_Login] ON 

INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (1, 1, N'Hamza123', N'123456', 2, NULL)
INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (2, 5, N'Zulfiqar', N'123456', 1, NULL)
INSERT [dbo].[admin_Login] ([LoginID], [EmpID], [UserName], [Password], [RoleType], [Notes]) VALUES (3, 6, N'rumail', N'123', 2, NULL)
SET IDENTITY_INSERT [dbo].[admin_Login] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (1, N'Adventure Travel', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (2, N'Beach and Sun', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (3, N'Cultural Tour', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (4, N'Beach and Sun', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (5, N'Honeymoon', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (6, N'Vacations', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (7, N'Nature Exploration', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (8, N'Cruise and Sailing', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (9, N'Wellness Retreats', N'abc example', NULL, NULL, NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive], [Createddate]) VALUES (10, N'Food Experiences', N'abc example', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (1, N'Zulfiqar', N'Akram', N'Zulfiqar', N'1234', 22, N'Male', CAST(N'1994-08-26' AS Date), N'BUKC', N'Pakistan', N'Sindh', N'Karachi', N'75300', N'zulfiqar.akram366@yahoo.com', NULL, N'02112354887', NULL, N'+923448127902', NULL, N'Majeed SRE Dalmain karachi', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (6, N'Ali', N'Sultan', N'Ali-Sultan', N'1234', NULL, NULL, NULL, NULL, N'Pakistan', NULL, NULL, NULL, N'ali123@gmail.com', NULL, NULL, NULL, N'03441234567', NULL, N'karachi', NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (7, N'Faraz', N'Ali', N'FarazAli', N'1234', NULL, NULL, NULL, NULL, N'China', NULL, NULL, NULL, N'faraz@hotmail.com', NULL, NULL, NULL, N'03441234567', NULL, N'karachi', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (8, N'inzi', N'mam', N'inzi', N'1234', NULL, NULL, NULL, NULL, N'USA', NULL, NULL, NULL, N'inzi@gmail.com', NULL, NULL, NULL, N'03441234567', NULL, N'cpo14-1', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (9, N'Mosa', N'Khan', N'Mosa', N'1234', NULL, NULL, NULL, NULL, N'India', NULL, NULL, NULL, N'mosa123@gmail.com', NULL, NULL, NULL, N'+923448127902', NULL, N'Dalmain karachi', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (10, N'Sajjad', N'Akram', N'zulfi', N'12345', NULL, NULL, NULL, NULL, N'India', NULL, NULL, NULL, N'zulfiqar.akram366@yahoo.com', NULL, NULL, NULL, N'+923448127902', NULL, N'Dalmain karachi', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (11, N'Zulfiqar', N'Akram', N'zulfiqarAkram', N'1234', 22, N'Male', CAST(N'1994-08-26' AS Date), NULL, N'Pakistan', N'sindh', N'Karachi', N'75300', N'zulfiqar.akram366@yahoo.com', NULL, NULL, NULL, N'+923448127902', NULL, N'Dalmain karachi, ', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (12, N'Ali', N'Khan', N'AliKhan', N'1234', NULL, NULL, NULL, NULL, N'India', NULL, NULL, NULL, N'ali123@gmail.com', NULL, NULL, NULL, N'03441234567', NULL, N'karachi, punjab', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (13, N'mk', N'mk', N'mk', N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'mkmuzammil191@gmail.com', NULL, NULL, NULL, N'03363506933', NULL, N'model coloy', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (18, N'abc', N'abc', N'abc', N'abc', 12, N'abc', CAST(N'1990-12-12' AS Date), N'abc', N'abc', N'abc', N'abc', N'abc', N'abc', NULL, N'abc', NULL, N'abc', NULL, N'abc', NULL, NULL, NULL, NULL, CAST(N'2023-07-12' AS Date), NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (19, N'q', N'q', N'q', N'q', 12, N'a', CAST(N'1990-12-12' AS Date), N'a', N'a', N'a', N'a', N'12', N'mkmuzammil191@gmail.com', N'mkmuzammil191@gmail.com', N'as11', NULL, N'as11', NULL, N'Model Colony malir Town Karachi', NULL, NULL, NULL, NULL, CAST(N'2023-07-12' AS Date), NULL, 0)
INSERT [dbo].[Customers] ([CustomerID], [First Name], [Last Name], [UserName], [Password], [Age], [Gender], [DateofBirth], [Organization], [Country], [State], [City], [PostalCode], [Email], [AltEmail], [Phone1], [Phone2], [Mobile1], [Mobile2], [Address1], [Address2], [Picture], [status], [LastLogin], [Created], [Notes], [InActive]) VALUES (20, N'mk', N'mk', N'Hamza123', N'abc', 12, N'abc', CAST(N'1990-12-12' AS Date), N'a', N'Pakistan', N'abc', N'Karachi', N'74000', N'mkmuzammil191@gmail.com', N'mkmuzammil191@gmail.com', N'03363506933', NULL, N'03363506933', NULL, N'Model Colony malir Town Karachi', NULL, NULL, NULL, NULL, CAST(N'2023-07-12' AS Date), NULL, 0)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[genMainSlider] ON 

INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (1, N'/Content/img/b1.jpg', N'.', N'Save Up to 75% Off', N'Adventure Travel', N'Forest Bathing and Nature Immersion', N'BOOK NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (2, N'/Content/img/b2.png', N'.', N'Save Up to 40% Off', N'Beach and Sun', N'Wine Tasting in Vineyards', N'BOOK NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (3, N'/Content/img/b3.png', N'.', N'Save Up to 75% Off', N'Cultural and Historical Tours', N'Nightlife and Entertainment Escapes', N'BOOK NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (4, N'/Content/img/b4.jpeg', N'.', N'Save Up to 75% Off', N'Wellness and Spa Retreats', N'Savannah Symphony: Kenya & Tanzania Safari', N'BOOK NOW', 0)
INSERT [dbo].[genMainSlider] ([MainSliderID], [ImageURL], [AltText], [OfferTag], [Title], [Description], [BtnText], [isDeleted]) VALUES (5, N'/Content/img/b5.jpg', N'.', N'Save Up to 50% Off', N'City Breaks', N'Zen Zephyr: Japanese Meditation Retreat', N'BOOK NOW', 0)
SET IDENTITY_INSERT [dbo].[genMainSlider] OFF
GO
SET IDENTITY_INSERT [dbo].[genPromoRight] ON 

INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (0, 1, N'/Content/img/g2.png', N'img', N'50% off', N'BEACH AND SUN', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (1, 5, N'/Content/img/g3.png', N'img', N'Sales off', N'CULTURAL TOUR', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (2, 3, N'/Content/img/g4.png', N'img', N'New Arrivals', N'HONEYMOON', 0)
INSERT [dbo].[genPromoRight] ([PromoRightID], [CategoryID], [ImageURL], [AltText], [OfferTag], [Title], [isDeleted]) VALUES (3, 4, N'/Content/img/g5.png', N'img', N'25% off', N'VACATIONS', 0)
SET IDENTITY_INSERT [dbo].[genPromoRight] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodReceiptNote] ON 

INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (6, 34, 76, NULL, N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (7, 34, 76, NULL, N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (8, 34, 76, NULL, N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (9, 34, 76, NULL, N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (10, 34, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (11, 34, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (12, 34, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (13, 34, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (14, 36, 77, N'Valeo, Ferodo, Interstate Batteries, Duralast', N'3', NULL, NULL, NULL, 30034, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (15, 35, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 27124, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (16, 37, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 27368, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (17, 40, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 37684, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (18, 41, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 162, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (19, 42, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 18180, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (20, 43, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, -2, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (21, 58, 76, N'Valeo, TEXTAR20x20     ', N'3', NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (22, 59, 76, N'Valeo, TEXTAR20
20
  ', N'3', NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (23, 44, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 454, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (24, 45, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 19392, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (25, 60, 76, N'Valeo, TEXTAR20*20     ', N'3', NULL, NULL, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (26, 61, 76, N'Valeo, TEXTAR20*20     ', N'3', NULL, 0, NULL, 800, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (27, 62, 76, N'Valeo, TEXTAR20*20     ', N'3', NULL, NULL, NULL, 800, N'20*20     ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (28, 46, 76, N'Valeo', N'3', NULL, NULL, NULL, 27124, N'20        ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (29, 93, 87, N'Exedy, Valeo, Bosch1*1*1     ', N'2', NULL, NULL, NULL, 36, N'1*1*1     ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (30, 95, 76, N'Valeo, TEXTAR200*200   ', N'3', NULL, NULL, NULL, 160000, N'200*200   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (31, 102, 76, N'Valeo, TEXTAR1*1       ', N'3', NULL, NULL, NULL, 2, N'1*1       ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (32, 101, 76, N'Valeo, TEXTAR900*900   ', N'3', NULL, NULL, NULL, 1620000, N'900*900   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (33, 100, 76, N'Valeo, TEXTAR12*12     ', N'3', NULL, NULL, NULL, 0, N'12*12     ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (34, 99, 76, N'', N'3', NULL, NULL, NULL, -775, N'89*9      ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (35, 47, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 27124, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (36, 97, 87, N'Exedy, Valeo, Bosch78*9*8    ', N'2', NULL, NULL, NULL, 1417, N'78*9*8    ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (37, 98, 76, N'Valeo, TEXTAR1*1       ', N'3', NULL, NULL, NULL, -2, N'1*1       ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (38, 96, 82, N'Braker10        ', N'2', NULL, NULL, NULL, 1110, N'10        ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (39, 92, 76, N'Valeo, TEXTAR2*2*2*2   ', N'3', NULL, NULL, NULL, 8, N'2*2*2*2   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (40, 91, 76, N'2*2*2*2   ', N'3', NULL, NULL, NULL, 8, N'2*2*2*2   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (41, 83, 86, N'Braker, Bosch, TEXTAR1*1*1     ', N'2', NULL, NULL, NULL, 3, N'1*1*1     ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (42, 89, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 8, N'0*1*0*1   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (43, 86, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 2, N'1*1       ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (44, 80, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 8, N'2*2*2*2   ', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (45, 109, 88, N'Exedy, EverStart, Optima Batteries, Ferodo123*123*123*123', N'3', NULL, NULL, NULL, 60516, N'123*123*123*123', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (46, 111, 95, N'Braker, Power Stop, DieHard1*1*1', N'2', NULL, NULL, NULL, 3, N'1*1*1', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (47, 110, 76, N'Valeo, TEXTAR20*1', N'3', NULL, NULL, NULL, 21, N'20*1', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (48, 116, 104, N'Akebono, Power Stop', N'3', NULL, NULL, NULL, 288, N'12*12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (49, 118, 104, N'Akebono, Power Stop', N'3', NULL, NULL, NULL, 1848, N'23*33', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (50, 119, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 288, N'12*12*0', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (51, 117, 112, N'Valeo', N'3', NULL, NULL, NULL, 18000, N'900', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (52, 121, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 432, N'12*12*12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (53, 48, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, -29088, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (54, 120, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 1232, N'12*22*22', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (55, 121, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 432, N'12*12*12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (56, 122, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 432, N'12,12,12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (57, 115, 112, N'Valeo', N'3', NULL, NULL, NULL, 144, N'12', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (58, 148, 112, N'Valeo', N'3', NULL, NULL, NULL, 1, N'1', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (59, 147, 114, N'Sachs, DieHard', N'3', NULL, NULL, NULL, 968, N'22,22', NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (60, 146, 112, N'Valeo', N'3', NULL, NULL, NULL, 2, N'1', N'2:1', N'3', 4)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (61, 149, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 1452, N'22,22,22', N'22,22,22', N'22,22,22', 12)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (62, 150, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 22000, N'20,100,100', N'100,100,100', N'100,100,100', 100)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (63, 145, 114, N'Sachs, DieHard', N'3', NULL, NULL, NULL, 528, N'12,12', N'22:12,22:12', N'22,22', 12)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (64, 144, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 672, N'12,12,12', N'22', N'2,2,2', 1)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (65, 151, 115, N'Sachs, EverStart, Ferodo', N'2', NULL, NULL, NULL, 1200, N'20,20,20', N'20,20,20', N'1,1,1', 1)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (66, 49, 76, N'Valeo, TEXTAR', N'3', NULL, NULL, NULL, 10748, NULL, NULL, NULL, NULL)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (67, 152, 117, N'Centerforce, Optima Batteries, TEXTAR, DieHard', N'2', NULL, NULL, NULL, 444, N'12,12,12,12', N'12,21,2,2', N'12,12,12,21', 13)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (68, 154, 118, N'EBC Brakes', N'3', NULL, NULL, NULL, 8, N'2', N'2', N'2', 2)
INSERT [dbo].[GoodReceiptNote] ([GoodRecieptNote], [SupplierQoutationID], [ReqQoutationID], [Product], [Supplier], [QuantityNeeded], [SupplierQuantity], [UnitPrice], [TotalPrice], [SupQuantity], [ConUnit], [Tax], [PaymentTerm]) VALUES (69, 153, 118, N'EBC Brakes', N'3', NULL, NULL, NULL, 4, N'2', N'2', N'2', 2)
SET IDENTITY_INSERT [dbo].[GoodReceiptNote] OFF
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (1, 1, 1, 1, 0, 0, 450, 1, CAST(N'2016-09-09T20:54:32.980' AS DateTime), 0, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (2, 6, 2, 2, 0, 0, 3250, 1, CAST(N'2016-09-11T17:57:16.727' AS DateTime), 1, NULL, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (3, 7, 3, 3, 0, 0, 1000, 1, CAST(N'2016-09-11T18:01:33.653' AS DateTime), 0, NULL, 1, NULL, 0, NULL, NULL, 0)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (4, 1, 4, 4, 0, 0, 3650, 1, CAST(N'2016-09-11T18:07:10.180' AS DateTime), 0, NULL, 0, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (5, 6, 5, 5, 0, 0, 2550, 1, CAST(N'2016-09-12T11:48:10.897' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (6, 6, 6, 6, 0, 0, 1400, 1, CAST(N'2016-09-12T11:49:50.607' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (7, 8, 7, 7, 0, 0, 1600, 1, CAST(N'2016-09-12T13:15:02.647' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, 1)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (8, 1, 8, 8, 0, NULL, 6650, 1, CAST(N'2016-09-16T22:47:37.677' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (9, 1, 9, 9, 0, NULL, 2350, 1, CAST(N'2016-09-17T15:47:05.120' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (10, 12, 10, 10, 0, NULL, 6950, 1, CAST(N'2016-09-17T22:33:22.687' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (11, 13, 11, 11, 0, NULL, 850, 1, CAST(N'2023-06-20T13:49:50.123' AS DateTime), 0, NULL, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (12, 13, 12, 12, 0, NULL, 700, 1, CAST(N'2023-06-20T14:41:33.707' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (13, 13, 13, 13, 0, NULL, 2400, 1, CAST(N'2023-06-28T00:54:07.963' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (14, 13, 14, 14, 0, NULL, 400, 1, CAST(N'2023-07-03T13:35:57.380' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (15, 13, 15, 15, 0, NULL, 20000, 1, CAST(N'2023-08-27T07:25:51.260' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (16, 13, 16, 16, 0, NULL, 20000, 1, CAST(N'2023-08-27T07:26:12.920' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [CustomerID], [PaymentID], [ShipingID], [Discount], [Taxes], [TotalAmount], [isCompleted], [OrderDate], [DIspatched], [DispatchedDate], [Shipped], [ShippingDate], [Deliver], [DeliveryDate], [Notes], [CancelOrder]) VALUES (17, 13, 17, NULL, 0, NULL, 20000, 1, CAST(N'2023-08-27T09:13:58.423' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (1, 1, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (2, 2, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (3, 2, 29, CAST(900 AS Decimal(18, 0)), 2, NULL, CAST(1800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (4, 2, 1, CAST(550 AS Decimal(18, 0)), 3, NULL, CAST(1650 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (5, 2, 25, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (6, 2, 4, CAST(800 AS Decimal(18, 0)), 3, NULL, CAST(2400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (7, 3, 1, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (8, 3, 3, CAST(450 AS Decimal(18, 0)), 3, NULL, CAST(1350 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (9, 4, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (10, 4, 2, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (11, 4, 1, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (12, 4, 26, CAST(850 AS Decimal(18, 0)), 1, NULL, CAST(850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (13, 4, 30, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (14, 4, 33, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (15, 5, 3, CAST(450 AS Decimal(18, 0)), 1, NULL, CAST(450 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (16, 5, 25, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (17, 5, 5, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (18, 5, 34, CAST(850 AS Decimal(18, 0)), 1, NULL, CAST(850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (19, 6, 2, CAST(700 AS Decimal(18, 0)), 2, NULL, CAST(1400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (20, 7, 2, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (21, 7, 3, CAST(450 AS Decimal(18, 0)), 2, NULL, CAST(900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (22, 8, 7, CAST(700 AS Decimal(18, 0)), 4, NULL, CAST(2800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (23, 8, 25, CAST(550 AS Decimal(18, 0)), 7, NULL, CAST(3850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (24, 9, 2, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (25, 9, 31, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (26, 9, 33, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (27, 9, 30, CAST(550 AS Decimal(18, 0)), 1, NULL, CAST(550 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (28, 10, 1, CAST(550 AS Decimal(18, 0)), 5, NULL, CAST(2750 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (29, 10, 29, CAST(900 AS Decimal(18, 0)), 3, NULL, CAST(2700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (30, 10, 35, CAST(750 AS Decimal(18, 0)), 2, NULL, CAST(1500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (31, 11, 10, CAST(850 AS Decimal(18, 0)), 1, NULL, CAST(850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (32, 12, 6, CAST(700 AS Decimal(18, 0)), 1, NULL, CAST(700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (33, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (34, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (35, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (36, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (37, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (38, 13, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (39, 14, 1, CAST(400 AS Decimal(18, 0)), 1, NULL, CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (40, 15, 47, CAST(20000 AS Decimal(18, 0)), 1, NULL, CAST(20000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [UnitPrice], [Quantity], [Discount], [TotalAmount], [OrderDate]) VALUES (41, 17, 47, CAST(20000 AS Decimal(18, 0)), 1, NULL, CAST(20000 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (4, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (5, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (6, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (7, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (8, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (9, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (10, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (12, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (13, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (14, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (15, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (16, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [Type], [CreditAmount], [DebitAmount], [Balance], [PaymentDateTime]) VALUES (17, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (1, N'Cash on Delivery', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (2, N'Paypal', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (3, N'Master Card', NULL)
INSERT [dbo].[PaymentType] ([PayTypeID], [TypeName], [Description]) VALUES (4, N'Easypaisa', NULL)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (1, N'Epic Summit Pursuit: Alpine Heights Expedition', 2, 1, 1, N'3', CAST(40000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), N'90', N'12', NULL, 487, 21, 1, N'/Content/img/a1.png', N'.', 1, N'SALE!', N'aa-saless', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (2, N'Rugged Trails and Hidden Treasures Quest', 2, 1, 6, NULL, CAST(70000 AS Decimal(18, 0)), CAST(85000 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/a2.png', N'.', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (3, N'Jungle Conquest: Into the Heart of the Amazon', 2, 1, 6, NULL, CAST(45000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 9, NULL, NULL, N'/Content/img/a3.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (4, N'Thrills & Heights: Himalayan Adventure Odyssey', 2, 1, 6, NULL, CAST(80000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), NULL, NULL, NULL, 48, NULL, NULL, N'/Content/img/a4.png', N'.', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (5, N'Canyon Rhythms: Desert Discovery Expedition', 2, 1, 6, NULL, CAST(70000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), NULL, NULL, NULL, 51, NULL, NULL, N'/Content/img/a5.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (6, N'Oceanic Adrenaline: Deep Sea Diving Journey', 2, 1, 6, NULL, CAST(70000 AS Decimal(18, 0)), CAST(95000 AS Decimal(18, 0)), NULL, NULL, NULL, 99, NULL, NULL, N'/Content/img/a6.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (7, N'Glacial Explorer: Arctic Wilderness Expedition', 2, 1, 6, NULL, CAST(70000 AS Decimal(18, 0)), CAST(95000 AS Decimal(18, 0)), NULL, NULL, NULL, 20, NULL, NULL, N'/Content/img/a7.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (8, N'Wild Horizons Safari: African Savanna Expedition', 2, 1, 6, NULL, CAST(70000 AS Decimal(18, 0)), CAST(85000 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/a8.png', N'.', 1, N'SOLD OUT', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (9, N'Expedition Beyond: Mysteries of the Rainforest', 2, 2, 1, NULL, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/a9.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (10, N'Skybound Thrills: Paragliding Escapade', 2, 2, 1, NULL, CAST(85000 AS Decimal(18, 0)), CAST(120000 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/a10.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (11, N'Cave of Wonders: Spelunking Adventure Quest', 2, 2, 1, NULL, CAST(75000 AS Decimal(18, 0)), CAST(98000 AS Decimal(18, 0)), NULL, NULL, NULL, 25, NULL, NULL, N'/Content/img/a11.png', N'.', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (12, N'Mountain Majesty: Andean Peak Exploration', 2, 2, 1, NULL, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 2, NULL, NULL, N'/Content/img/a12.png', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (13, N'Whitewater Symphony: Rafting Rush Experience', 2, 2, 1, NULL, CAST(90000 AS Decimal(18, 0)), CAST(56000 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/a13.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (14, N'Uncharted Territories: Jungle Trekking Trail', 2, 2, 1, NULL, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/a14.png', N'.', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (15, N'Volcanic Ventures: Ring of Fire Expedition', 2, 2, 1, NULL, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 16, NULL, NULL, N'/Content/img/a15.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (16, N'Desert Dreamscape: Nomadic Sand Dune Adventure', 2, 2, 1, NULL, CAST(15000 AS Decimal(18, 0)), CAST(67000 AS Decimal(18, 0)), NULL, NULL, NULL, 18, NULL, NULL, N'/Content/img/a16.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (25, N'Summit Whispers: Alpine Ascent Odyssey', 2, 4, 2, NULL, CAST(55000 AS Decimal(18, 0)), CAST(650000 AS Decimal(18, 0)), NULL, NULL, NULL, 45, NULL, NULL, N'/Content/img/a17.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (26, N'Adventures Aloft: Hot Air Balloon Safari', 2, 4, 2, NULL, CAST(85000 AS Decimal(18, 0)), CAST(650000 AS Decimal(18, 0)), NULL, NULL, NULL, 249, NULL, NULL, N'/Content/img/a18.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (27, N'Sunset Serenity: Caribbean Beach Retreat', 2, 4, 2, NULL, CAST(75000 AS Decimal(18, 0)), CAST(650000 AS Decimal(18, 0)), NULL, NULL, NULL, 33, NULL, NULL, N'/Content/img/a19.png', N'.', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (28, N'Island Euphoria: Tropical Paradise Discovery', 2, 4, 2, NULL, CAST(55000 AS Decimal(18, 0)), CAST(650000 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/a20.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (29, N'Azure Dreams: Mediterranean Coastal Escapade', 2, 4, 2, NULL, CAST(90000 AS Decimal(18, 0)), CAST(70000 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/a21.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (30, N'Bali Bliss Odyssey: Island Sanctuary Retreat', 2, 4, 2, NULL, CAST(55000 AS Decimal(18, 0)), CAST(650000 AS Decimal(18, 0)), NULL, NULL, NULL, 0, NULL, NULL, N'/Content/img/a22.png', N'.', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (31, N'Seaside Reverie: Coastal Cabana Getaway', 2, 4, 2, NULL, CAST(55000 AS Decimal(18, 0)), CAST(650000 AS Decimal(18, 0)), NULL, NULL, NULL, 8, NULL, NULL, N'/Content/img/a23.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (32, N'Sand and Solitude: Seychelles Beach Haven', 2, 4, 2, NULL, CAST(150000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), NULL, NULL, NULL, 3, NULL, NULL, N'/Content/img/a24.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (33, N'Aqua Haven: Maldives Overwater Oasis', 2, 6, NULL, NULL, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 30, NULL, NULL, N'/Content/img/a25.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (34, N'Turquoise Tranquility: Fiji Beachfront Getaway', 2, 6, NULL, NULL, CAST(85000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 29, NULL, NULL, N'/Content/img/a30.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (35, N'Tropical Temptations: Hawaiian Hideaway', 2, 6, NULL, NULL, CAST(75000 AS Decimal(18, 0)), CAST(95000 AS Decimal(18, 0)), NULL, NULL, NULL, 21, NULL, NULL, N'/Content/img/a31.png', N'.', 1, N'HOT!', N'aa-hot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (36, N'Bora Bora Bliss: Lagoon Paradise Escape', 2, 6, NULL, NULL, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 19, NULL, NULL, N'/Content/img/a32.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (37, N'Beachfront Rendezvous: Coastal Villa Retreat', 2, 6, NULL, NULL, CAST(90000 AS Decimal(18, 0)), CAST(45000 AS Decimal(18, 0)), NULL, NULL, NULL, 9, NULL, NULL, N'/Content/img/a34.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (38, N'Tropical Breeze Expedition: Island-Hopping Odyssey', 2, 6, NULL, NULL, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 4, NULL, NULL, N'/Content/img/a30.png', N'.', 1, N'SOLD OUT!', N'aa-sold-out', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (39, N'Sunrise Shores: Greek Island Beach Sojourn', 2, 6, NULL, NULL, CAST(55000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 2, NULL, NULL, N'/Content/img/a31.png', N'.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (40, N'Coral Kingdom Serenity: Great Barrier Reef Retreat', 2, 6, NULL, NULL, CAST(15000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, 11, NULL, NULL, N'/Content/img/a32.png', N'.', 1, N'SALE!', N'aa-sale', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (42, N'Beachcomber''s Paradise: Coastal Adventure Quest', 3, 5, 6, N'0', CAST(20000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), N'3 kg', N'3 lbs', NULL, 2000, 100, 1, N'/Content/img/a33.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (43, N'Sailing into Sunset: Caribbean Catamaran Escape', 2, 1, 1, N'-88', CAST(20000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, -300, NULL, NULL, N'/Content/img/a34.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (45, N'Jamaican Rhythms: Reggae & Relaxation Retreat', 2, 1, 1, N'-2222', CAST(20000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/img/a35.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (46, N'Sun-Kissed Shores: Mediterranean Seaside Journey', 2, 1, 1, N'100kh', CAST(20000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), N'200', NULL, NULL, NULL, NULL, NULL, N'/Content/img/a36.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (47, N'Time Traveler''s Odyssey: Historical Heritage Quest', 3, 3, 19, N'100', CAST(20000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), N'2000', N'3 lbs', CAST(2000 AS Decimal(18, 0)), 200, 300, NULL, N'/Content/img/a37.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (48, N'Legends and Landmarks Expedition', 2, 1, 1, N'2000', CAST(20000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), N'3 kg', N'3 lbs', CAST(2 AS Decimal(18, 0)), 300, 400, 1, N'/Content/img/a38.png', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (49, N'Cultural Kaleidoscope: Global Traditions Discovery', 2, 1, 1, N'100', CAST(20000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), N'100', N'20', CAST(10 AS Decimal(18, 0)), 800, 14, 1, N'/Content/img/a39.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1)
INSERT [dbo].[Products] ([ProductID], [Name], [SupplierID], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [OldPrice], [UnitWeight], [Size], [Discount], [UnitInStock], [UnitOnOrder], [ProductAvailable], [ImageURL], [AltText], [AddBadge], [OfferTitle], [OfferBadgeClass], [ShortDescription], [LongDescription], [Picture1], [Picture2], [Picture3], [Picture4], [Note], [UnitMeasureID], [InActive]) VALUES (50, N'Ancient Echoes Escapade: Archaeological Wonders', 4, 7, 20, N'2000', CAST(20000 AS Decimal(18, 0)), CAST(65000 AS Decimal(18, 0)), N'-3', N'12', NULL, 12, 22, NULL, N'/Content/img/a32.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseReturn] ON 

INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (1, 3, 42, 199)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (2, 3, 42, 1801)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (3, 3, 42, 1801)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (4, 3, 42, 1801)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (5, 3, 1, 2)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (6, 2, 1, 4)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (7, 2, 2, 2)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (8, 2, 2, 2)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (9, 2, 2, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (10, 2, 2, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (11, 3, 2, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (12, 2, 2, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (13, 2, 1, 1)
INSERT [dbo].[PurchaseReturn] ([PurchaseReturnID], [Supplier], [Product], [Quantity]) VALUES (14, 2, 1, 12)
SET IDENTITY_INSERT [dbo].[PurchaseReturn] OFF
GO
SET IDENTITY_INSERT [dbo].[RecentlyViews] ON 

INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (1, 8, 3, CAST(N'2016-09-12T13:04:22.833' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (2, 8, 3, CAST(N'2016-09-12T13:06:15.157' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (3, 8, 3, CAST(N'2016-09-12T13:06:23.053' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (4, 8, 3, CAST(N'2016-09-12T13:08:32.260' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (5, 8, 3, CAST(N'2016-09-12T13:08:38.983' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (6, 8, 3, CAST(N'2016-09-12T13:09:03.177' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (7, 8, 3, CAST(N'2016-09-12T13:11:26.760' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (8, 8, 2, CAST(N'2016-09-12T13:13:51.517' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (10, 9, 5, CAST(N'2016-09-16T21:23:59.193' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (11, 9, 31, CAST(N'2016-09-16T21:24:08.987' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (12, 9, 4, CAST(N'2016-09-16T21:24:18.577' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (13, 9, 10, CAST(N'2016-09-16T21:25:00.783' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (14, 1, 6, CAST(N'2016-09-16T22:27:00.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (15, 1, 3, CAST(N'2016-09-16T22:27:04.163' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (16, 1, 27, CAST(N'2016-09-16T22:27:09.210' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (17, 1, 7, CAST(N'2016-09-16T22:27:13.827' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (18, 1, 7, CAST(N'2016-09-16T22:27:17.980' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (19, 1, 7, CAST(N'2016-09-16T22:27:18.000' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (20, 1, 2, CAST(N'2016-09-16T22:35:59.680' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (21, 1, 6, CAST(N'2016-09-16T22:36:14.390' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (22, 1, 5, CAST(N'2016-09-16T22:36:44.520' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (23, 1, 2, CAST(N'2016-09-16T22:44:09.607' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (24, 1, 2, CAST(N'2016-09-16T22:44:15.410' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (25, 1, 7, CAST(N'2016-09-16T22:46:56.820' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (26, 1, 25, CAST(N'2016-09-16T22:47:05.047' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (27, 1, 25, CAST(N'2016-09-16T22:47:12.357' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (28, 1, 25, CAST(N'2016-09-16T22:47:12.407' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (29, 10, 3, CAST(N'2016-09-16T23:27:42.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (30, 10, 3, CAST(N'2016-09-16T23:27:45.477' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (31, 10, 3, CAST(N'2016-09-16T23:27:45.523' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (32, 10, 4, CAST(N'2016-09-16T23:28:35.837' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (33, 1, 2, CAST(N'2016-09-17T15:44:58.923' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (34, 1, 31, CAST(N'2016-09-17T15:45:06.387' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (35, 1, 33, CAST(N'2016-09-17T15:45:15.667' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (36, 1, 30, CAST(N'2016-09-17T15:45:21.820' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (37, 11, 28, CAST(N'2016-09-17T22:25:05.957' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (38, 11, 30, CAST(N'2016-09-17T22:25:13.003' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (39, 11, 34, CAST(N'2016-09-17T22:25:24.977' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (40, 11, 3, CAST(N'2016-09-17T22:25:45.587' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (41, 11, 3, CAST(N'2016-09-17T22:29:14.070' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (42, 11, 3, CAST(N'2016-09-17T22:29:30.140' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (43, 12, 1, CAST(N'2016-09-17T22:30:48.747' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (44, 12, 29, CAST(N'2016-09-17T22:31:00.773' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (45, 12, 26, CAST(N'2016-09-17T22:31:06.380' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (46, 12, 35, CAST(N'2016-09-17T22:31:41.210' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (47, 12, 35, CAST(N'2016-09-17T22:32:11.543' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (48, 12, 35, CAST(N'2016-09-17T22:32:22.803' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (49, 12, 35, CAST(N'2016-09-17T22:32:22.840' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (50, 13, 1, CAST(N'2023-06-20T13:41:35.327' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (51, 13, 1, CAST(N'2023-06-20T13:41:39.620' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (52, 13, 1, CAST(N'2023-06-20T13:45:07.237' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (53, 13, 1, CAST(N'2023-06-20T13:45:12.980' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (54, 13, 10, CAST(N'2023-06-20T13:48:28.457' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (55, 13, 13, CAST(N'2023-06-20T14:39:57.180' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (56, 13, 13, CAST(N'2023-06-20T14:39:57.940' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (57, 13, 13, CAST(N'2023-06-20T14:39:58.347' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (58, 13, 13, CAST(N'2023-06-20T14:39:58.573' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (59, 13, 13, CAST(N'2023-06-20T14:40:00.087' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (60, 13, 6, CAST(N'2023-06-20T14:41:08.433' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (61, 13, 1, CAST(N'2023-06-27T19:09:11.657' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (62, 13, 1, CAST(N'2023-06-27T19:11:32.427' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (63, 13, 1, CAST(N'2023-06-27T19:11:46.747' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (64, 13, 1, CAST(N'2023-06-27T19:15:53.563' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (65, 13, 1, CAST(N'2023-06-27T19:20:06.450' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (66, 13, 1, CAST(N'2023-06-27T19:20:06.610' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (67, 13, 1, CAST(N'2023-06-27T19:20:16.107' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (68, 13, 1, CAST(N'2023-06-27T19:20:18.687' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (69, 13, 1, CAST(N'2023-06-27T19:22:38.417' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (70, 13, 1, CAST(N'2023-06-27T19:22:41.703' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (71, 13, 1, CAST(N'2023-06-27T19:22:59.160' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (72, 13, 1, CAST(N'2023-06-27T19:23:01.473' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (73, 13, 2, CAST(N'2023-06-27T19:23:47.767' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (74, 13, 1, CAST(N'2023-06-27T19:23:50.943' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (75, 13, 2, CAST(N'2023-06-27T19:23:52.937' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (76, 13, 1, CAST(N'2023-06-27T19:32:36.530' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (77, 13, 1, CAST(N'2023-06-27T19:32:39.110' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (78, 13, 1, CAST(N'2023-06-27T19:36:30.200' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (79, 13, 1, CAST(N'2023-06-27T19:36:33.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (80, 13, 1, CAST(N'2023-06-27T19:36:35.687' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (81, 13, 5, CAST(N'2023-06-27T19:46:04.927' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (82, 13, 5, CAST(N'2023-06-27T19:46:08.457' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (83, 13, 1, CAST(N'2023-06-27T19:50:57.327' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (84, 13, 1, CAST(N'2023-06-27T19:51:31.123' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (85, 13, 1, CAST(N'2023-06-27T19:51:33.220' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (86, 13, 1, CAST(N'2023-06-27T19:51:35.020' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (87, 13, 1, CAST(N'2023-06-27T19:51:37.473' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (88, 13, 1, CAST(N'2023-06-27T19:51:44.370' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (89, 13, 1, CAST(N'2023-06-27T19:51:44.397' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (90, 13, 1, CAST(N'2023-06-27T19:51:51.530' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (91, 13, 1, CAST(N'2023-06-27T19:51:51.557' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (92, 13, 1, CAST(N'2023-06-27T19:52:06.300' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (93, 13, 1, CAST(N'2023-06-27T19:52:09.143' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (94, 13, 1, CAST(N'2023-06-27T19:52:11.183' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (95, 13, 1, CAST(N'2023-06-27T19:52:13.377' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (96, 13, 1, CAST(N'2023-06-27T19:59:41.623' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (97, 13, 1, CAST(N'2023-06-27T19:59:45.580' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (98, 13, 1, CAST(N'2023-06-27T19:59:47.787' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (99, 13, 1, CAST(N'2023-06-27T20:04:34.960' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (100, 13, 1, CAST(N'2023-06-27T20:08:59.797' AS DateTime), NULL)
GO
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (101, 13, 1, CAST(N'2023-06-27T20:09:01.790' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (102, 13, 1, CAST(N'2023-06-28T00:33:58.717' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (103, 13, 1, CAST(N'2023-06-28T00:34:00.817' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (104, 13, 2, CAST(N'2023-06-28T00:34:02.943' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (105, 13, 1, CAST(N'2023-06-28T00:36:10.473' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (106, 13, 1, CAST(N'2023-06-28T00:36:12.960' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (107, 13, 1, CAST(N'2023-06-28T00:36:15.090' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (108, 13, 2, CAST(N'2023-06-28T00:43:16.450' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (109, 13, 2, CAST(N'2023-06-28T00:43:21.277' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (110, 13, 2, CAST(N'2023-06-28T00:43:21.310' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (111, 13, 1, CAST(N'2023-06-28T00:47:46.060' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (112, 13, 1, CAST(N'2023-06-28T00:47:48.117' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (113, 13, 1, CAST(N'2023-06-28T00:51:59.997' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (114, 13, 1, CAST(N'2023-06-28T00:52:01.987' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (115, 13, 1, CAST(N'2023-06-28T00:53:43.823' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (116, 13, 1, CAST(N'2023-06-28T00:53:45.830' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (117, 13, 1, CAST(N'2023-07-03T13:35:19.070' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (118, 13, 47, CAST(N'2023-08-27T07:25:11.063' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (119, 13, 47, CAST(N'2023-08-27T07:52:00.920' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (120, 13, 2, CAST(N'2023-08-27T08:54:20.190' AS DateTime), NULL)
INSERT [dbo].[RecentlyViews] ([RViewID], [CustomerID], [ProductID], [ViewDate], [Note]) VALUES (121, 13, 47, CAST(N'2023-08-27T09:13:41.320' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RecentlyViews] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestforQoutation] ON 

INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (76, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (77, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (78, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (80, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (81, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (82, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (85, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (86, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (87, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (88, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (95, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (100, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (101, 1, 2, 199, CAST(N'2023-01-06' AS Date), NULL)
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (102, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (103, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'MKKK      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (104, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (112, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (114, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (115, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'Khan      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (116, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (117, NULL, 2, NULL, CAST(N'2023-05-06' AS Date), N'Khan      ')
INSERT [dbo].[RequestforQoutation] ([ReqQoutationID], [Product], [Supplier], [Quantity], [ProductDate], [suppName]) VALUES (118, NULL, 3, NULL, CAST(N'2023-05-06' AS Date), N'Zaibten   ')
SET IDENTITY_INSERT [dbo].[RequestforQoutation] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (1, 7, 3, N'Faraz Talpur', N'faraz@yahoo.com', N'Good Product.', 4, CAST(N'2016-08-11T19:03:00.227' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (6, 8, 3, N'ABC', N'abc@gmail.com', N'Nice', 5, CAST(N'2016-08-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (7, 8, 3, N'XYZ', N'xyz@hotmail.com', N'Excellent product. thank you', 5, CAST(N'2016-08-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (8, 7, 3, N'dfg', N'dfg@gmail.com', N'bad', 2, CAST(N'2015-09-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (9, 11, 3, N'Zulfiqar Akram', N'zulfiqar.akram366@yahoo.com', N'Good Product', 4, CAST(N'2016-09-17T22:26:20.900' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (10, 11, 3, N'Zulfiqar Akram', N'zulfiqar.akram366@yahoo.com', N'Good Product', 4, CAST(N'2016-09-17T22:29:30.030' AS DateTime), NULL)
INSERT [dbo].[Review] ([ReviewID], [CustomerID], [ProductID], [Name], [Email], [Review], [Rate], [DateTime], [isDelete]) VALUES (11, 12, 35, N'Ali', N'ali@gmail.com', N'Nice Product', 4, CAST(N'2016-09-17T22:32:11.457' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description], [DateCreated]) VALUES (1, N'Admin', N'All rights', NULL)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description], [DateCreated]) VALUES (2, N'Employee', N'Some rights', NULL)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description], [DateCreated]) VALUES (3, N'User', N'Some rights', NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesReturn] ON 

INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (1, N'1', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (2, N'1', 1, 1)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (3, N'1', 1, 12)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (4, N'1', 1, 100)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (5, N'1', 1, 3)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (6, N'1', 1, 12)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (7, N'1', 1, 12)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (8, N'1', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (9, N'1', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (10, N'1', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (11, N'9', 26, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (12, N'9', 1, 199)
INSERT [dbo].[SalesReturn] ([SalesID], [Customer], [Product], [Quantity]) VALUES (13, N'1', 1, 199)
SET IDENTITY_INSERT [dbo].[SalesReturn] OFF
GO
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (1, N'Zulfiqar', N'Akram', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (2, N'Ali', N'sultan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (3, N'Faraz', N'Akram', N'faraz@hotmail.com', N'+923448127902', N'cpo14-1', N'KPK', N'CZXCZ', N'3123')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (4, N'Zulfiqar', N'Akram', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (5, N'Ali', N'sultan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (6, N'Ali', N'sultan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (7, N'inzi', N'mama', N'inzi@gmail.com', N'03441234567', N'cpo14-1', N'Punjab', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (8, N'Zulfiqar', N'Akram', N'zulfiqar.akram366@yahoo.com', N'+923448127902', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75300')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (9, N'Zulfiqar', N'Akram', N'zulfiqar123@yahoo.com', N'+923441234567', N'Dalmain karachi
', N'Sindh', N'Karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (10, N'Ali', N'Khan', N'ali123@gmail.com', N'03441234567', N'karachi
punjab', N'Sindh', N'karachi', N'75000')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (11, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'Sindh', N'Karachi', N'7400')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (12, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'KPK', N'Karachi', N'7400')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (13, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'--', N'Karachi', N'7400')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (14, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'Sindh', N'Karachi', N'7400')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (15, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'--', N'Karachi', N'7400')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (16, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'--', N'Karachi', N'7400')
INSERT [dbo].[ShippingDetails] ([BookingID], [FirstName], [LastName], [Email], [Mobile], [Address], [Province], [City], [PostCode]) VALUES (17, N'mk', N'mk', N'mkmuzammil191@gmail.com', N'03363506933', N'Model Colony malir Town Karachi', N'--', N'Karachi', N'7400')
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (1, 1, N'Altitude Trekking   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (2, 1, N'Jungle Expeditions  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (3, 1, N'Bungee Jumping      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (4, 1, N'White Water Rafting ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (5, 1, N'Winter Sports       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (6, 1, N'
Brake calipers    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (7, 1, N'Desert Safari       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (8, 1, N'Master cylinder     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (11, 1, N'Canyoning           ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (12, 1, N'Arctic and Antarctic', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (13, 1, N'Mountain Biking     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (14, 1, N'Paragliding         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (15, 1, N'Emergency Brake     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (16, 1, N'Multi-Day Wilderness', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (17, 1, N'Hang Gliding        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (18, 1, N'Backing plate       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (19, 2, N'Luxury Beachfront   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (20, 2, N'Private Island      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (21, 2, N'Snorkeling          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (22, 2, N'Diving Getaways     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (23, 2, N'Surf Camps          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (24, 2, N'Tropical Rainforest ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (25, 2, N'Sailing and Island  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (26, 2, N'Secluded Beach      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (27, 2, N'Eco-Friendly Beach  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (28, 2, N'Beach Bonfire       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (29, 2, N'Star Gazing         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (30, 2, N'Beach Vacations     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (32, 4, N'Overwater Bungalow  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (33, 3, N'Ancient Ruins       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (34, 3, N'Cultural Festivals  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (35, 3, N'Heritage Walking    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (36, 3, N'UNESCO World        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (37, 3, N'Art and Architecture', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (38, 4, N'Wine and Romance    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (39, 4, N'Sunset Sailing      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (40, 4, N'Couples'' Spa        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (41, 4, N'Secluded Mountain   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (42, 4, N'Helicopter Tours    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (43, 6, N'Big Five Safari     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (44, 6, N'Bird Watching       ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (45, 6, N'Marine Life         ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (46, 6, N'Rainforest          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (47, 6, N'Arctic Wildlife     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (48, 6, N'Nighttime Wildlife  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (49, 7, N'Luxury Ocean        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (51, 7, N'Boutique River      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (52, 7, N'Expedition Cruises  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (53, 7, N'Mediterranean Yacht ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (54, 7, N'Historical River    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (55, 7, N'Sailboat Races      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (57, 7, N'Cultural Heritage   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (58, 8, N'Yoga and Mindfulness', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (59, 8, N'Ayurvedic Wellness  ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (60, 8, N'Mountain Meditation ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (61, 8, N'Healing Hot Springs ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (62, 8, N'Holistic Health     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (63, 8, N'Forest Bathing      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (64, 8, N'Silent Retreats     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (65, 9, N'Differential        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (66, 9, N'Wine Tours          ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (67, 9, N'Culinary Adventures ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (68, 9, N'Chassis             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (69, 9, N'Street Food Safaris ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (70, 9, N'Chocolate and Pastry', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (71, 9, N'Transfer case
     ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (72, 9, N'Wine Tasting        ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (73, 9, N'Flywheel            ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (74, 10, N'Architectural Marvel', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (75, 10, N'Art and Museum      ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (76, 10, N'Culinary Capitals   ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (77, 10, N'Jazz and Music Scene', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (78, 10, N'Shopping and Fashion', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (79, 10, N'Theater             ', NULL, NULL, NULL, NULL)
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [Name], [Description], [Picture1], [Picture2], [isActive]) VALUES (80, 10, N'Performing          ', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (2, N'Khan', N'Ian Devling', N'Marketing Manager', N'karachi', N'03441234567', N'03441234567', N'(03) 444-6588', N'lan@gmail.com', N'karachi', N'Pakistan', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (3, N'Zaibten', N'Muzamil Khan', N'Manager', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'mkmuzammil191@gmail.com', N'Karachi', N'Pakistan', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (4, N'Zabion', N'Muzamil Khan', N'Manager', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', NULL, N'mkmuzammil191@gmail.com', N'Karachi', N'Pakistan', 0)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (5, N'abc', N'abc', N'abc', N'abc', N'12345678901', N'12345678901', N'abc', N'abc@gmail.com', N'abc', N'abc', 1)
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [ContactTitle], [Address], [Mobile], [Phone], [Fax], [Email], [City], [Country], [InActive]) VALUES (6, N'Zaibten', N'Zaibten', N'Zaibten12', N'Model Colony malir Town Karachi', N'03363506933', N'03363506933', N'abc', N'mkmuzammil191@gmail.com', N'Karachi', N'Pakistan', 1)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_SupplierPayment] ON 

INSERT [dbo].[tbl_SupplierPayment] ([SupplierPaymentID], [invoiceId], [Supplier], [PaymentDate], [PaymentTerm], [CreatedDate], [Tax], [Totalamount], [NetAmount], [Sup]) VALUES (7, 11, NULL, CAST(N'2023-07-27' AS Date), 11, CAST(N'2023-07-10' AS Date), 774, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'Khan')
INSERT [dbo].[tbl_SupplierPayment] ([SupplierPaymentID], [invoiceId], [Supplier], [PaymentDate], [PaymentTerm], [CreatedDate], [Tax], [Totalamount], [NetAmount], [Sup]) VALUES (8, 4, NULL, CAST(N'2023-07-20' AS Date), 15, CAST(N'2023-07-11' AS Date), 774, CAST(2.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), N'Khan')
SET IDENTITY_INSERT [dbo].[tbl_SupplierPayment] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Tax] ON 

INSERT [dbo].[tbl_Tax] ([TaxID], [TaxRate], [Taxcode], [CreatedDate], [TaxValue]) VALUES (774, CAST(13 AS Decimal(18, 0)), N'income Tax', CAST(N'2023-07-08' AS Date), CAST(1200712 AS Decimal(18, 0)))
INSERT [dbo].[tbl_Tax] ([TaxID], [TaxRate], [Taxcode], [CreatedDate], [TaxValue]) VALUES (779, CAST(13 AS Decimal(18, 0)), N'income Tax', CAST(N'2023-07-08' AS Date), CAST(12007 AS Decimal(18, 0)))
INSERT [dbo].[tbl_Tax] ([TaxID], [TaxRate], [Taxcode], [CreatedDate], [TaxValue]) VALUES (784, CAST(13 AS Decimal(18, 0)), N'income Tax', CAST(N'2023-07-08' AS Date), CAST(12007 AS Decimal(18, 0)))
INSERT [dbo].[tbl_Tax] ([TaxID], [TaxRate], [Taxcode], [CreatedDate], [TaxValue]) VALUES (785, CAST(13 AS Decimal(18, 0)), N'Custom Tax', CAST(N'2023-07-12' AS Date), CAST(120000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[tbl_Tax] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_UnitofMeasures] ON 

INSERT [dbo].[tbl_UnitofMeasures] ([UnitMeasureID], [UnitMeasure], [Description], [Abbrevation]) VALUES (1, N'Kilogram', N'abc record', N'kg')
INSERT [dbo].[tbl_UnitofMeasures] ([UnitMeasureID], [UnitMeasure], [Description], [Abbrevation]) VALUES (2, N'Meters', N'abc', N'M')
INSERT [dbo].[tbl_UnitofMeasures] ([UnitMeasureID], [UnitMeasure], [Description], [Abbrevation]) VALUES (3, N'Kilogram', N'A box', N'kg')
SET IDENTITY_INSERT [dbo].[tbl_UnitofMeasures] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (5, 9, 4, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (6, 1, 6, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (7, 1, 5, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (8, 1, 2, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (9, 11, 30, NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [isActive]) VALUES (10, 12, 26, NULL)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Taxes]  DEFAULT ((0)) FOR [Taxes]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_isCompleted]  DEFAULT ((0)) FOR [isCompleted]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DIspatched]  DEFAULT ((0)) FOR [DIspatched]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Shipped]  DEFAULT ((0)) FOR [Shipped]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Deliver]  DEFAULT ((0)) FOR [Deliver]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CancelOrder]  DEFAULT ((0)) FOR [CancelOrder]
GO
ALTER TABLE [dbo].[Wishlist] ADD  CONSTRAINT [DF_Wishlist_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[admin_Login]  WITH CHECK ADD  CONSTRAINT [FK_admin_Login_admin_Employee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[admin_Employee] ([EmpID])
GO
ALTER TABLE [dbo].[admin_Login] CHECK CONSTRAINT [FK_admin_Login_admin_Employee]
GO
ALTER TABLE [dbo].[admin_Login]  WITH CHECK ADD  CONSTRAINT [FK_admin_Login_Roles] FOREIGN KEY([RoleType])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[admin_Login] CHECK CONSTRAINT [FK_admin_Login_Roles]
GO
ALTER TABLE [dbo].[genPromoRight]  WITH CHECK ADD  CONSTRAINT [FK_genPromoRight_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[genPromoRight] CHECK CONSTRAINT [FK_genPromoRight_Categories]
GO
ALTER TABLE [dbo].[GoodReceiptNote]  WITH CHECK ADD  CONSTRAINT [FK__GoodRecei__ReqQo__1332DBDC] FOREIGN KEY([ReqQoutationID])
REFERENCES [dbo].[RequestforQoutation] ([ReqQoutationID])
GO
ALTER TABLE [dbo].[GoodReceiptNote] CHECK CONSTRAINT [FK__GoodRecei__ReqQo__1332DBDC]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([PaymentID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ShippingDetails] FOREIGN KEY([ShipingID])
REFERENCES [dbo].[ShippingDetails] ([BookingID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ShippingDetails]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentType] FOREIGN KEY([Type])
REFERENCES [dbo].[PaymentType] ([PayTypeID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentType]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategory]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Customers]
GO
ALTER TABLE [dbo].[RecentlyViews]  WITH CHECK ADD  CONSTRAINT [FK_RecentlyViews_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RecentlyViews] CHECK CONSTRAINT [FK_RecentlyViews_Products]
GO
ALTER TABLE [dbo].[RequestforQoutation]  WITH CHECK ADD  CONSTRAINT [FK__Requestfo__Produ__19DFD96B] FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RequestforQoutation] CHECK CONSTRAINT [FK__Requestfo__Produ__19DFD96B]
GO
ALTER TABLE [dbo].[RequestforQoutation]  WITH CHECK ADD  CONSTRAINT [FK__Requestfo__Suppl__1AD3FDA4] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[RequestforQoutation] CHECK CONSTRAINT [FK__Requestfo__Suppl__1AD3FDA4]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Customers]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Products]
GO
ALTER TABLE [dbo].[SalesReturn]  WITH CHECK ADD FOREIGN KEY([Product])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Categories]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Customers]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_Products]
GO
/****** Object:  StoredProcedure [dbo].[InsertcustomerQoutation]    Script Date: 27/08/2023 9:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertcustomerQoutation]
    @ReqQoutationID INT,
    @Product NVARCHAR(150),
    @Customer NVARCHAR(150),
    @QuantityNeeded INT,
    @SupplierQuantity INT,
    @UnitPrice INT,
    @TotalPrice INT,
	@ProductDate date,
    @TaxRateID INT,
	@PaymentTerm int,
	@ConUnit nvarchar
AS
BEGIN
    INSERT INTO CustomerQoutation (ReqQoutationID, Product, customer, QuantityNeeded, SupplierQuantity, UnitPrice, TotalPrice, Date,Tax,PaymentTerm,ConUnit)
    VALUES (@ReqQoutationID, @Product, @Customer, @QuantityNeeded, @SupplierQuantity, @UnitPrice, @TotalPrice,@ProductDate, @TaxRateID,@PaymentTerm,@ConUnit)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomerRequestforQoutation]    Script Date: 27/08/2023 9:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCustomerRequestforQoutation]
(
    @Product INT,
    @Customer INT,
    @Quantity INT,
    @ProductDate DATE
)
AS
BEGIN
    INSERT INTO CustomerRequestforQoutation (Product, Customer, Quantity, ProductDate)
    VALUES (@Product, @customer, @Quantity, @ProductDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRequestforQoutation]    Script Date: 27/08/2023 9:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertRequestforQoutation]
(
    @Product INT,
    @Supplier INT,
    @Quantity INT,
    @ProductDate DATE
)
AS
BEGIN
    INSERT INTO RequestforQoutation (Product, Supplier, Quantity, ProductDate)
    VALUES (@Product, @Supplier, @Quantity, @ProductDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSupplierGoodReceipt]    Script Date: 27/08/2023 9:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertSupplierGoodReceipt]
    @ReqQoutationID nvarchar(150),
    @Product NVARCHAR(150),
    @Supplier NVARCHAR(150),
    @QuantityNeeded INT,
    @SupplierQuantity INT,
    @UnitPrice INT,
    @TotalPrice INT,
	@ProductDate date
AS
BEGIN
    INSERT INTO SupplierQoutation (ReqQoutationID, Product, Supplier, QuantityNeeded, SupplierQuantity, UnitPrice, TotalPrice, Date)
    VALUES (@ReqQoutationID, @Product, @Supplier, @QuantityNeeded, @SupplierQuantity, @UnitPrice, @TotalPrice,@ProductDate)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSupplierQoutation]    Script Date: 27/08/2023 9:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSupplierQoutation]
    @ReqQoutationID INT,
    @Product NVARCHAR(150),
    @Supplier NVARCHAR(150),
    @QuantityNeeded INT,
    @SupplierQuantity INT,
    @UnitPrice INT,
    @TotalPrice INT,
    @ProductDate DATE,
    @TaxRateID INT,
	@PaymentTerm int,
	@ConUnit nvarchar
AS
BEGIN
    INSERT INTO SupplierQoutation (ReqQoutationID, Product, Supplier, QuantityNeeded, SupplierQuantity, UnitPrice, TotalPrice, Date,Tax,PaymentTerm,ConUnit)
    VALUES (@ReqQoutationID, @Product, @Supplier, @QuantityNeeded, @SupplierQuantity, @UnitPrice, @TotalPrice, @ProductDate, @TaxRateID,@PaymentTerm,@ConUnit)
END
GO
/****** Object:  StoredProcedure [dbo].[ViewRequestforQoutation]    Script Date: 27/08/2023 9:51:10 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ViewRequestforQoutation]
AS
BEGIN
    SELECT
        r.ReqQoutationID,
        p.Name,
        s.CompanyName,
        r.Quantity,
        r.ProductDate
    FROM
        RequestforQoutation r
        INNER JOIN Products p ON r.Product = p.ProductID
        INNER JOIN Suppliers s ON r.Supplier = s.SupplierID
    ORDER BY
        r.ReqQoutationID;
END
GO
USE [master]
GO
ALTER DATABASE [kahreedo] SET  READ_WRITE 
GO
