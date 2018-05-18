USE [master]
GO
/****** Object:  Database [BloodDonation]    Script Date: 5/18/2018 9:50:30 PM ******/
CREATE DATABASE [BloodDonation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BloodDonation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BloodDonation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BloodDonation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BloodDonation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BloodDonation] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BloodDonation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BloodDonation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BloodDonation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BloodDonation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BloodDonation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BloodDonation] SET ARITHABORT OFF 
GO
ALTER DATABASE [BloodDonation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BloodDonation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BloodDonation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BloodDonation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BloodDonation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BloodDonation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BloodDonation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BloodDonation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BloodDonation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BloodDonation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BloodDonation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BloodDonation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BloodDonation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BloodDonation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BloodDonation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BloodDonation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BloodDonation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BloodDonation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BloodDonation] SET  MULTI_USER 
GO
ALTER DATABASE [BloodDonation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BloodDonation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BloodDonation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BloodDonation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BloodDonation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BloodDonation] SET QUERY_STORE = OFF
GO
USE [BloodDonation]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BloodDonation]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AdressId] [int] NOT NULL,
	[EntityId] [int] NOT NULL,
	[Country] [varchar](120) NULL,
	[City] [varchar](120) NULL,
	[StreetName] [varchar](120) NULL,
	[StrNumber] [int] NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AdressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BloodRequest]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodRequest](
	[BloodRequestId] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
	[CentreId] [int] NOT NULL,
	[state] [varchar](50) NOT NULL,
	[trombocite] [float] NULL,
	[plasma] [float] NULL,
	[globule_rosii] [float] NULL,
	[quantity] [float] NULL,
	[PacientCNP] [int] NOT NULL,
 CONSTRAINT [PK_BloodRequest] PRIMARY KEY CLUSTERED 
(
	[BloodRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Centre]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centre](
	[CentreId] [int] NOT NULL,
	[name] [varchar](120) NOT NULL,
	[contact] [varchar](120) NULL,
	[addressId] [int] NULL,
 CONSTRAINT [PK_Centru] PRIMARY KEY CLUSTERED 
(
	[CentreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clinic](
	[ClinicId] [int] NOT NULL,
	[name] [varchar](120) NOT NULL,
	[contact] [varchar](120) NOT NULL,
	[addressId] [int] NULL,
 CONSTRAINT [PK_Spital] PRIMARY KEY CLUSTERED 
(
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorId] [int] NOT NULL,
	[username] [varchar](120) NOT NULL,
	[password] [varchar](120) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Doctor] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donation]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation](
	[DonationId] [int] NOT NULL,
	[DonorId] [int] NOT NULL,
	[CentreId] [int] NOT NULL,
	[date] [date] NOT NULL,
	[passedTests] [bit] NULL,
	[quantity] [float] NULL,
	[trombocite] [float] NULL,
	[plasma] [float] NULL,
	[globule_rosii] [float] NULL,
 CONSTRAINT [PK_Donation] PRIMARY KEY CLUSTERED 
(
	[DonationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donor]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donor](
	[DonorId] [int] NOT NULL,
	[username] [varchar](120) NOT NULL,
	[password] [varchar](120) NOT NULL,
 CONSTRAINT [PK_Donor] PRIMARY KEY CLUSTERED 
(
	[DonorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Donor] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonorPersonalDetails]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonorPersonalDetails](
	[PersonalDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](120) NULL,
	[firstname] [varchar](120) NULL,
	[lastname] [varchar](120) NULL,
	[DonorId] [int] NOT NULL,
	[isActive] [bit] NULL,
	[DonorCNP] [int] NULL,
	[sex] [varchar](120) NOT NULL,
	[addressRegistred] [int] NULL,
	[addressCurrent] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacient]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacient](
	[idPacient] [int] NOT NULL,
	[nume] [nchar](30) NOT NULL,
	[prenume] [nchar](30) NOT NULL,
	[idSpital] [int] NOT NULL,
 CONSTRAINT [PK_Pacient] PRIMARY KEY CLUSTERED 
(
	[idPacient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalDetailsDoctor]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalDetailsDoctor](
	[PersonalDetailsId] [int] NOT NULL,
	[email] [varchar](120) NULL,
	[firstname] [varchar](120) NULL,
	[lastname] [varchar](120) NULL,
	[DoctorId] [int] NOT NULL,
	[ClinicId] [int] NULL,
 CONSTRAINT [PK_PersonalDetailsDoctor] PRIMARY KEY CLUSTERED 
(
	[PersonalDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalDetailsStaffMembers]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalDetailsStaffMembers](
	[PersonalDetailsId] [int] NOT NULL,
	[email] [varchar](120) NULL,
	[firstname] [varchar](120) NULL,
	[lastname] [varchar](120) NULL,
	[StaffId] [int] NOT NULL,
	[CentreId] [int] NULL,
 CONSTRAINT [PK_PersonalDetailsStaffMembers] PRIMARY KEY CLUSTERED 
(
	[PersonalDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 5/18/2018 9:50:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StaffMember] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Staff] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BloodRequest]  WITH CHECK ADD  CONSTRAINT [FK_BloodRequest_Centre] FOREIGN KEY([CentreId])
REFERENCES [dbo].[Centre] ([CentreId])
GO
ALTER TABLE [dbo].[BloodRequest] CHECK CONSTRAINT [FK_BloodRequest_Centre]
GO
ALTER TABLE [dbo].[BloodRequest]  WITH CHECK ADD  CONSTRAINT [FK_BloodRequest_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([ClinicId])
GO
ALTER TABLE [dbo].[BloodRequest] CHECK CONSTRAINT [FK_BloodRequest_Clinic]
GO
ALTER TABLE [dbo].[Centre]  WITH CHECK ADD  CONSTRAINT [FK_Centre_Address] FOREIGN KEY([addressId])
REFERENCES [dbo].[Address] ([AdressId])
GO
ALTER TABLE [dbo].[Centre] CHECK CONSTRAINT [FK_Centre_Address]
GO
ALTER TABLE [dbo].[Clinic]  WITH CHECK ADD  CONSTRAINT [FK_Clinic_Address] FOREIGN KEY([addressId])
REFERENCES [dbo].[Address] ([AdressId])
GO
ALTER TABLE [dbo].[Clinic] CHECK CONSTRAINT [FK_Clinic_Address]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Centre] FOREIGN KEY([CentreId])
REFERENCES [dbo].[Centre] ([CentreId])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Centre]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Donor] FOREIGN KEY([DonorId])
REFERENCES [dbo].[Donor] ([DonorId])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Donor]
GO
ALTER TABLE [dbo].[DonorPersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_DonorPersonalDetails_Address] FOREIGN KEY([addressRegistred])
REFERENCES [dbo].[Address] ([AdressId])
GO
ALTER TABLE [dbo].[DonorPersonalDetails] CHECK CONSTRAINT [FK_DonorPersonalDetails_Address]
GO
ALTER TABLE [dbo].[DonorPersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_DonorPersonalDetails_Address1] FOREIGN KEY([addressCurrent])
REFERENCES [dbo].[Address] ([AdressId])
GO
ALTER TABLE [dbo].[DonorPersonalDetails] CHECK CONSTRAINT [FK_DonorPersonalDetails_Address1]
GO
ALTER TABLE [dbo].[DonorPersonalDetails]  WITH CHECK ADD  CONSTRAINT [FK_DonorPersonalDetails_Donor] FOREIGN KEY([DonorId])
REFERENCES [dbo].[Donor] ([DonorId])
GO
ALTER TABLE [dbo].[DonorPersonalDetails] CHECK CONSTRAINT [FK_DonorPersonalDetails_Donor]
GO
ALTER TABLE [dbo].[Pacient]  WITH CHECK ADD  CONSTRAINT [FK_Pacient_Spital] FOREIGN KEY([idSpital])
REFERENCES [dbo].[Clinic] ([ClinicId])
GO
ALTER TABLE [dbo].[Pacient] CHECK CONSTRAINT [FK_Pacient_Spital]
GO
ALTER TABLE [dbo].[PersonalDetailsDoctor]  WITH CHECK ADD  CONSTRAINT [FK_PersonalDetailsDoctor_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([ClinicId])
GO
ALTER TABLE [dbo].[PersonalDetailsDoctor] CHECK CONSTRAINT [FK_PersonalDetailsDoctor_Clinic]
GO
ALTER TABLE [dbo].[PersonalDetailsDoctor]  WITH CHECK ADD  CONSTRAINT [FK_PersonalDetailsDoctor_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([DoctorId])
GO
ALTER TABLE [dbo].[PersonalDetailsDoctor] CHECK CONSTRAINT [FK_PersonalDetailsDoctor_Doctor]
GO
ALTER TABLE [dbo].[PersonalDetailsStaffMembers]  WITH CHECK ADD  CONSTRAINT [FK_PersonalDetailsStaffMembers_Centre] FOREIGN KEY([CentreId])
REFERENCES [dbo].[Centre] ([CentreId])
GO
ALTER TABLE [dbo].[PersonalDetailsStaffMembers] CHECK CONSTRAINT [FK_PersonalDetailsStaffMembers_Centre]
GO
ALTER TABLE [dbo].[PersonalDetailsStaffMembers]  WITH CHECK ADD  CONSTRAINT [FK_PersonalDetailsStaffMembers_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[PersonalDetailsStaffMembers] CHECK CONSTRAINT [FK_PersonalDetailsStaffMembers_Staff]
GO
USE [master]
GO
ALTER DATABASE [BloodDonation] SET  READ_WRITE 
GO
