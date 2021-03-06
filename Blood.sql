USE [master]
GO
/****** Object:  Database [CaptainBlood]    Script Date: 28-Apr-19 11:34:51 PM ******/
CREATE DATABASE [CaptainBlood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CaptainBlood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CaptainBlood.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CaptainBlood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\CaptainBlood_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CaptainBlood] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CaptainBlood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CaptainBlood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CaptainBlood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CaptainBlood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CaptainBlood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CaptainBlood] SET ARITHABORT OFF 
GO
ALTER DATABASE [CaptainBlood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CaptainBlood] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CaptainBlood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CaptainBlood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CaptainBlood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CaptainBlood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CaptainBlood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CaptainBlood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CaptainBlood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CaptainBlood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CaptainBlood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CaptainBlood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CaptainBlood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CaptainBlood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CaptainBlood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CaptainBlood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CaptainBlood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CaptainBlood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CaptainBlood] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CaptainBlood] SET  MULTI_USER 
GO
ALTER DATABASE [CaptainBlood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CaptainBlood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CaptainBlood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CaptainBlood] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CaptainBlood]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllDonor]    Script Date: 28-Apr-19 11:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllDonor] @City nvarchar(30),@BloodGroup nvarchar(30)
AS
SELECT Name,Age,BloodGroup,Status,Mobile
FROM UserDetails
INNER JOIN Users
ON UserDetails.Id = Users.Id
 WHERE City = @City AND BloodGroup=@BloodGroup AND Status!='Not Available'
;
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 28-Apr-19 11:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[Id] [int] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Status] [varchar](100) NOT NULL,
	[DonateDate] [varchar](50) NULL,
	[BloodGroup] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28-Apr-19 11:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[UserDetails] ([Id], [Gender], [Age], [City], [Mobile], [Status], [DonateDate], [BloodGroup]) VALUES (1014, N'Male', 25, N'Chittagong', N'01681650101', N'Available After 22/8/2019', NULL, N'A+')
INSERT [dbo].[UserDetails] ([Id], [Gender], [Age], [City], [Mobile], [Status], [DonateDate], [BloodGroup]) VALUES (1015, N'Male', 20, N'Dhaka', N'01681650106', N'Not Available', NULL, N'B-')
INSERT [dbo].[UserDetails] ([Id], [Gender], [Age], [City], [Mobile], [Status], [DonateDate], [BloodGroup]) VALUES (1016, N'Male', 20, N'Chittagong', N'0193', N'Available', NULL, N'A+')
INSERT [dbo].[UserDetails] ([Id], [Gender], [Age], [City], [Mobile], [Status], [DonateDate], [BloodGroup]) VALUES (2014, N'Male', 20, N'Chittagong', N'01681650169', N'Available After 17/8/2019', NULL, N'A+')
INSERT [dbo].[UserDetails] ([Id], [Gender], [Age], [City], [Mobile], [Status], [DonateDate], [BloodGroup]) VALUES (3014, N'Male', 45, N'Chittagong', N'018', N'Available', NULL, N'A+')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (1014, N'Mr. Tasbir', N'tas@yahoo.com', N'123456')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (1015, N'Shovon', N'shovon@yahoo.com', N'123456')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (1016, N'Ishmam', N'ish@gmail.com', N'123456')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (2014, N'Tayef', N'tayef@gmail.com', N'123456')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (2015, N'Hasan', N'hasan@gmaill.com', N'123456')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password]) VALUES (3014, N'Masum', N'ma@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [CaptainBlood] SET  READ_WRITE 
GO
