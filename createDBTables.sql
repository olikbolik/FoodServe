USE [master]
GO
/****** Object:  Database [Lv-402.DB.FoodServe]    Script Date: 4/22/2019 7:07:19 PM ******/
CREATE DATABASE [Lv-402.DB.FoodServe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lv-402.DB.FoodServe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.TC\MSSQL\DATA\Lv-402.DB.FoodServe.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Lv-402.DB.FoodServe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.TC\MSSQL\DATA\Lv-402.DB.FoodServe_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lv-402.DB.FoodServe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET RECOVERY FULL 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET  MULTI_USER 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Lv-402.DB.FoodServe', N'ON'
GO
USE [Lv-402.DB.FoodServe]
GO
/****** Object:  Table [dbo].[BusinessUnits]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessUnits](
	[BusinessUnitID] [int] NOT NULL,
	[Name] [nchar](10) NULL,
	[City] [nchar](10) NOT NULL,
	[Adress] [nchar](10) NOT NULL,
	[PostIndex] [int] NOT NULL,
	[Phone] [nchar](13) NOT NULL,
	[Active] [bit] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_BusinessUnits] PRIMARY KEY CLUSTERED 
(
	[BusinessUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessUnitTypes]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessUnitTypes](
	[BusinessUnitTypeID] [int] NOT NULL,
	[MarkUp] [float] NULL,
	[Type] [text] NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_BusinessUnitTypes] PRIMARY KEY CLUSTERED 
(
	[BusinessUnitTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](50) NULL,
	[LastName] [nchar](50) NULL,
	[Email] [nchar](10) NULL,
	[Mobile] [nchar](10) NULL,
	[DiscountID] [int] NULL,
	[GeneralSum] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Size] [smallint] NULL,
	[Condition] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRoles]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRoles](
	[EmployeeRoleID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[BusinessUnitID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Salary] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeRoles_1] PRIMARY KEY CLUSTERED 
(
	[EmployeeRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[BusinessUnitID] [int] NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Phone] [char](17) NULL,
	[Email] [varchar](35) NULL,
	[Salary] [decimal](19, 2) NULL,
	[JobTitles] [varchar](30) NOT NULL,
	[HiredDate] [date] NOT NULL,
	[FiredDate] [date] NULL,
	[EmployeeRoleID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientCategories]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientCategories](
	[IngredientCategoryID] [int] NOT NULL,
	[Name] [nchar](50) NULL,
 CONSTRAINT [PK_IngredientCategories] PRIMARY KEY CLUSTERED 
(
	[IngredientCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[IngredientID] [int] NOT NULL,
	[RecipeID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[IngredientCategoryID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetailes]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetailes](
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[Quantity] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_InvoiceDetailes] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] NOT NULL,
	[InvoiceDate] [date] NOT NULL,
	[VendorID] [int] NOT NULL,
	[TotalCost] [money] NOT NULL,
	[BusinessUnitID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[PostingDate] [date] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Losses]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Losses](
	[LossID] [int] NOT NULL,
	[RerurnID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[BusinessUnitID] [int] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[LossAmount] [money] NOT NULL,
 CONSTRAINT [PK_Losses] PRIMARY KEY CLUSTERED 
(
	[LossID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[ProductQuantity] [smallint] NULL,
	[DocProductNumber] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[TotalCost] [decimal](18, 0) NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[CategorieID] [int] NOT NULL,
	[CategorieName] [nchar](50) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [nchar](50) NOT NULL,
	[VendorID] [int] NOT NULL,
	[SubcategorieID] [int] NOT NULL,
	[MesurementUnit] [nchar](10) NULL,
	[Price] [numeric](12, 2) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Description] [nchar](500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[RecipeID] [int] NOT NULL,
	[RecipeName] [nchar](10) NULL,
	[IsVegeterian] [bit] NULL,
	[TotalPrice] [nchar](10) NULL,
	[Calories] [int] NULL,
 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Returns]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Returns](
	[ReturnID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Cause] [nvarchar](50) NULL,
	[AmountToReturn] [float] NOT NULL,
	[CheckDate] [bit] NULL,
	[Quantity] [float] NOT NULL,
 CONSTRAINT [PK_Returns] PRIMARY KEY CLUSTERED 
(
	[ReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_EmployeeRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ShipmentID] [int] NOT NULL,
	[FromBusinessUnitID] [int] NOT NULL,
	[ToBusinessUnitID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[FromShipmentDate] [date] NOT NULL,
	[ToShipmentDate] [date] NOT NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDetails]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDetails](
	[ShipmentID] [int] NOT NULL,
	[ShipmentLineID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ShipmentDetails] PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[StockID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[BusinessUnitID] [int] NOT NULL,
	[Quantity] [float] NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcategories]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcategories](
	[SubcategorieID] [int] NOT NULL,
	[SubcategorieName] [nchar](50) NOT NULL,
	[CategorieID] [int] NOT NULL,
	[Description] [nchar](200) NULL,
 CONSTRAINT [PK_Subcategories] PRIMARY KEY CLUSTERED 
(
	[SubcategorieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 4/22/2019 7:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorID] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Country] [varchar](255) NOT NULL,
	[State] [varchar](255) NOT NULL,
	[City] [varchar](255) NOT NULL,
	[StreetAddress] [varchar](255) NOT NULL,
	[ContactPerson] [varchar](255) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BusinessUnits]  WITH CHECK ADD  CONSTRAINT [FK_BusinessUnits_BusinessUnitTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[BusinessUnitTypes] ([BusinessUnitTypeID])
GO
ALTER TABLE [dbo].[BusinessUnits] CHECK CONSTRAINT [FK_BusinessUnits_BusinessUnitTypes]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Discount] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([DiscountID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Discount]
GO
ALTER TABLE [dbo].[EmployeeRoles]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeRoles_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeRoles] CHECK CONSTRAINT [FK_EmployeeRoles_Employees]
GO
ALTER TABLE [dbo].[EmployeeRoles]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[EmployeeRoles] CHECK CONSTRAINT [FK_EmployeeRoles_Roles]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_BusinessUnits1] FOREIGN KEY([BusinessUnitID])
REFERENCES [dbo].[BusinessUnits] ([BusinessUnitID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_BusinessUnits1]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_EmployeeRoles] FOREIGN KEY([EmployeeRoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_EmployeeRoles]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_Categories] FOREIGN KEY([IngredientCategoryID])
REFERENCES [dbo].[IngredientCategories] ([IngredientCategoryID])
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_Categories]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_Products]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_Recipes] FOREIGN KEY([RecipeID])
REFERENCES [dbo].[Recipes] ([RecipeID])
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Ingredients_Recipes]
GO
ALTER TABLE [dbo].[InvoiceDetailes]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetailes_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceDetailes] CHECK CONSTRAINT [FK_InvoiceDetailes_Invoices]
GO
ALTER TABLE [dbo].[InvoiceDetailes]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetailes_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[InvoiceDetailes] CHECK CONSTRAINT [FK_InvoiceDetailes_Products]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_BusinessUnits] FOREIGN KEY([BusinessUnitID])
REFERENCES [dbo].[BusinessUnits] ([BusinessUnitID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_BusinessUnits]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Employees]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Vendors]
GO
ALTER TABLE [dbo].[Losses]  WITH CHECK ADD  CONSTRAINT [FK_Losses_Returns] FOREIGN KEY([RerurnID])
REFERENCES [dbo].[Returns] ([ReturnID])
GO
ALTER TABLE [dbo].[Losses] CHECK CONSTRAINT [FK_Losses_Returns]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order1] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order1]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Subcategories] FOREIGN KEY([SubcategorieID])
REFERENCES [dbo].[Subcategories] ([SubcategorieID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Subcategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Vendors]
GO
ALTER TABLE [dbo].[Returns]  WITH CHECK ADD  CONSTRAINT [FK_Returns_Orders1] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Returns] CHECK CONSTRAINT [FK_Returns_Orders1]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_BusinessUnits1] FOREIGN KEY([FromBusinessUnitID])
REFERENCES [dbo].[BusinessUnits] ([BusinessUnitID])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_BusinessUnits1]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_BusinessUnits2] FOREIGN KEY([FromBusinessUnitID])
REFERENCES [dbo].[BusinessUnits] ([BusinessUnitID])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_BusinessUnits2]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_BusinessUnits3] FOREIGN KEY([ToBusinessUnitID])
REFERENCES [dbo].[BusinessUnits] ([BusinessUnitID])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_BusinessUnits3]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_ShipmentDetails] FOREIGN KEY([ShipmentID])
REFERENCES [dbo].[ShipmentDetails] ([ShipmentID])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_ShipmentDetails]
GO
ALTER TABLE [dbo].[ShipmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ShipmentDetails] CHECK CONSTRAINT [FK_ShipmentDetails_Products]
GO
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_BusinessUnits] FOREIGN KEY([BusinessUnitID])
REFERENCES [dbo].[BusinessUnits] ([BusinessUnitID])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_BusinessUnits]
GO
ALTER TABLE [dbo].[Subcategories]  WITH CHECK ADD  CONSTRAINT [FK_Subcategories_Categories] FOREIGN KEY([CategorieID])
REFERENCES [dbo].[ProductCategories] ([CategorieID])
GO
ALTER TABLE [dbo].[Subcategories] CHECK CONSTRAINT [FK_Subcategories_Categories]
GO
USE [master]
GO
ALTER DATABASE [Lv-402.DB.FoodServe] SET  READ_WRITE 
GO
