﻿USE [master]
GO
/****** Object:  Database [Z36NoteAppDB]    Script Date: 6.12.2022 13:11:36 ******/
CREATE DATABASE [Z36NoteAppDB]
GO
ALTER DATABASE [Z36NoteAppDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Z36NoteAppDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Z36NoteAppDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Z36NoteAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Z36NoteAppDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Z36NoteAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Z36NoteAppDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET RECOVERY FULL 
GO
ALTER DATABASE [Z36NoteAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [Z36NoteAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Z36NoteAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Z36NoteAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Z36NoteAppDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Z36NoteAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Z36NoteAppDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Z36NoteAppDB', N'ON'
GO
ALTER DATABASE [Z36NoteAppDB] SET QUERY_STORE = OFF
GO
USE [Z36NoteAppDB]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 6.12.2022 13:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsDraft] [bit] NOT NULL,
	[UserID] [int] NOT NULL,
	[Picture] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Picture]  DEFAULT (N'default.png') FOR [Picture]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6.12.2022 13:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_Users]
GO
USE [master]
GO
ALTER DATABASE [Z36NoteAppDB] SET  READ_WRITE 
GO
