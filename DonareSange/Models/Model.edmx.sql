
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/23/2018 18:30:55
-- Generated from EDMX file: C:\Users\drago\source\repos\DonareSange\DonareSange\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BloodDonation];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Centre_Address]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Centres] DROP CONSTRAINT [FK_Centre_Address];
GO
IF OBJECT_ID(N'[dbo].[FK_Clinic_Address]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Clinics] DROP CONSTRAINT [FK_Clinic_Address];
GO
IF OBJECT_ID(N'[dbo].[FK_DonorPersonalDetails_Address]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DonorPersonalDetails] DROP CONSTRAINT [FK_DonorPersonalDetails_Address];
GO
IF OBJECT_ID(N'[dbo].[FK_DonorPersonalDetails_Address1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DonorPersonalDetails] DROP CONSTRAINT [FK_DonorPersonalDetails_Address1];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_Donation_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Donations] DROP CONSTRAINT [FK_Donation_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_DonorPersonalDetails_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DonorPersonalDetails] DROP CONSTRAINT [FK_DonorPersonalDetails_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonalDetailsDoctor_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonalDetailsDoctors] DROP CONSTRAINT [FK_PersonalDetailsDoctor_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonalDetailsStaffMembers_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonalDetailsStaffMembers] DROP CONSTRAINT [FK_PersonalDetailsStaffMembers_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_BloodRequest_Centre]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BloodRequests] DROP CONSTRAINT [FK_BloodRequest_Centre];
GO
IF OBJECT_ID(N'[dbo].[FK_BloodRequest_Clinic]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BloodRequests] DROP CONSTRAINT [FK_BloodRequest_Clinic];
GO
IF OBJECT_ID(N'[dbo].[FK_Donation_Centre]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Donations] DROP CONSTRAINT [FK_Donation_Centre];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonalDetailsStaffMembers_Centre]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonalDetailsStaffMembers] DROP CONSTRAINT [FK_PersonalDetailsStaffMembers_Centre];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonalDetailsDoctor_Clinic]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonalDetailsDoctors] DROP CONSTRAINT [FK_PersonalDetailsDoctor_Clinic];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonalDetailsDoctor_Doctor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonalDetailsDoctors] DROP CONSTRAINT [FK_PersonalDetailsDoctor_Doctor];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonalDetailsStaffMembers_Staff]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PersonalDetailsStaffMembers] DROP CONSTRAINT [FK_PersonalDetailsStaffMembers_Staff];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_AspNetUserRoles_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[C__MigrationHistory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[C__MigrationHistory];
GO
IF OBJECT_ID(N'[dbo].[Addresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Addresses];
GO
IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserLogins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserLogins];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[BloodRequests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BloodRequests];
GO
IF OBJECT_ID(N'[dbo].[Centres]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Centres];
GO
IF OBJECT_ID(N'[dbo].[Clinics]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clinics];
GO
IF OBJECT_ID(N'[dbo].[Doctors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Doctors];
GO
IF OBJECT_ID(N'[dbo].[Donations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Donations];
GO
IF OBJECT_ID(N'[dbo].[Donors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Donors];
GO
IF OBJECT_ID(N'[dbo].[DonorPersonalDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DonorPersonalDetails];
GO
IF OBJECT_ID(N'[dbo].[PersonalDetailsDoctors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonalDetailsDoctors];
GO
IF OBJECT_ID(N'[dbo].[PersonalDetailsStaffMembers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PersonalDetailsStaffMembers];
GO
IF OBJECT_ID(N'[dbo].[Staffs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Staffs];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'C__MigrationHistory'
CREATE TABLE [dbo].[C__MigrationHistory] (
    [MigrationId] nvarchar(150)  NOT NULL,
    [ContextKey] nvarchar(300)  NOT NULL,
    [Model] varbinary(max)  NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [AdressId] int IDENTITY(1,1) NOT NULL,
    [EntityId] int  NOT NULL,
    [Country] varchar(120)  NULL,
    [City] varchar(120)  NULL,
    [StreetName] varchar(120)  NULL,
    [StrNumber] int  NULL,
    [latitude] float  NULL,
    [longitude] float  NULL
);
GO

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'AspNetUserLogins'
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider] nvarchar(128)  NOT NULL,
    [ProviderKey] nvarchar(128)  NOT NULL,
    [UserId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [userType] varchar(100)  NULL,
    [UserName] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'BloodRequests'
CREATE TABLE [dbo].[BloodRequests] (
    [BloodRequestId] int IDENTITY(1,1) NOT NULL,
    [ClinicId] int  NOT NULL,
    [CentreId] int  NOT NULL,
    [state] varchar(50)  NOT NULL,
    [trombocite] float  NULL,
    [plasma] float  NULL,
    [globule_rosii] float  NULL,
    [quantity] float  NULL,
    [PacientCNP] int  NOT NULL
);
GO

-- Creating table 'Centres'
CREATE TABLE [dbo].[Centres] (
    [CentreId] int IDENTITY(1,1) NOT NULL,
    [name] varchar(120)  NOT NULL,
    [contact] varchar(120)  NULL,
    [addressId] int  NULL
);
GO

-- Creating table 'Clinics'
CREATE TABLE [dbo].[Clinics] (
    [ClinicId] int IDENTITY(1,1) NOT NULL,
    [name] varchar(120)  NOT NULL,
    [contact] varchar(120)  NOT NULL,
    [addressId] int  NULL
);
GO

-- Creating table 'Doctors'
CREATE TABLE [dbo].[Doctors] (
    [DoctorId] nvarchar(128)  NOT NULL,
    [username] varchar(120)  NOT NULL,
    [password] varchar(120)  NOT NULL
);
GO

-- Creating table 'Donations'
CREATE TABLE [dbo].[Donations] (
    [DonationId] int IDENTITY(1,1) NOT NULL,
    [DonorId] nvarchar(128)  NOT NULL,
    [CentreId] int  NOT NULL,
    [date] datetime  NOT NULL,
    [passedTests] bit  NULL,
    [quantity] float  NULL,
    [trombocite] float  NULL,
    [plasma] float  NULL,
    [globule_rosii] float  NULL
);
GO

-- Creating table 'Donors'
CREATE TABLE [dbo].[Donors] (
    [DonorId] int IDENTITY(1,1) NOT NULL,
    [username] varchar(120)  NOT NULL,
    [password] varchar(120)  NOT NULL
);
GO

-- Creating table 'DonorPersonalDetails'
CREATE TABLE [dbo].[DonorPersonalDetails] (
    [PersonalDetailsId] int IDENTITY(1,1) NOT NULL,
    [email] varchar(120)  NULL,
    [firstname] varchar(120)  NULL,
    [lastname] varchar(120)  NULL,
    [DonorId] nvarchar(128)  NOT NULL,
    [isActive] bit  NULL,
    [DonorCNP] int  NULL,
    [sex] varchar(120)  NOT NULL,
    [addressRegistred] int  NULL,
    [addressCurrent] int  NULL
);
GO

-- Creating table 'PersonalDetailsDoctors'
CREATE TABLE [dbo].[PersonalDetailsDoctors] (
    [PersonalDetailsId] int IDENTITY(1,1) NOT NULL,
    [email] varchar(120)  NULL,
    [firstname] varchar(120)  NULL,
    [lastname] varchar(120)  NULL,
    [DoctorId] nvarchar(128)  NOT NULL,
    [ClinicId] int  NULL
);
GO

-- Creating table 'PersonalDetailsStaffMembers'
CREATE TABLE [dbo].[PersonalDetailsStaffMembers] (
    [PersonalDetailsId] decimal(19,4)  NOT NULL,
    [email] varchar(120)  NULL,
    [firstname] varchar(120)  NULL,
    [lastname] varchar(120)  NULL,
    [StaffId] nvarchar(128)  NOT NULL,
    [CentreId] int  NULL
);
GO

-- Creating table 'Staffs'
CREATE TABLE [dbo].[Staffs] (
    [StaffId] nvarchar(128)  NOT NULL,
    [username] varchar(50)  NOT NULL,
    [password] varchar(50)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MigrationId], [ContextKey] in table 'C__MigrationHistory'
ALTER TABLE [dbo].[C__MigrationHistory]
ADD CONSTRAINT [PK_C__MigrationHistory]
    PRIMARY KEY CLUSTERED ([MigrationId], [ContextKey] ASC);
GO

-- Creating primary key on [AdressId] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([AdressId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [LoginProvider], [ProviderKey], [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [PK_AspNetUserLogins]
    PRIMARY KEY CLUSTERED ([LoginProvider], [ProviderKey], [UserId] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [BloodRequestId] in table 'BloodRequests'
ALTER TABLE [dbo].[BloodRequests]
ADD CONSTRAINT [PK_BloodRequests]
    PRIMARY KEY CLUSTERED ([BloodRequestId] ASC);
GO

-- Creating primary key on [CentreId] in table 'Centres'
ALTER TABLE [dbo].[Centres]
ADD CONSTRAINT [PK_Centres]
    PRIMARY KEY CLUSTERED ([CentreId] ASC);
GO

-- Creating primary key on [ClinicId] in table 'Clinics'
ALTER TABLE [dbo].[Clinics]
ADD CONSTRAINT [PK_Clinics]
    PRIMARY KEY CLUSTERED ([ClinicId] ASC);
GO

-- Creating primary key on [DoctorId] in table 'Doctors'
ALTER TABLE [dbo].[Doctors]
ADD CONSTRAINT [PK_Doctors]
    PRIMARY KEY CLUSTERED ([DoctorId] ASC);
GO

-- Creating primary key on [DonationId] in table 'Donations'
ALTER TABLE [dbo].[Donations]
ADD CONSTRAINT [PK_Donations]
    PRIMARY KEY CLUSTERED ([DonationId] ASC);
GO

-- Creating primary key on [DonorId] in table 'Donors'
ALTER TABLE [dbo].[Donors]
ADD CONSTRAINT [PK_Donors]
    PRIMARY KEY CLUSTERED ([DonorId] ASC);
GO

-- Creating primary key on [PersonalDetailsId] in table 'DonorPersonalDetails'
ALTER TABLE [dbo].[DonorPersonalDetails]
ADD CONSTRAINT [PK_DonorPersonalDetails]
    PRIMARY KEY CLUSTERED ([PersonalDetailsId] ASC);
GO

-- Creating primary key on [PersonalDetailsId] in table 'PersonalDetailsDoctors'
ALTER TABLE [dbo].[PersonalDetailsDoctors]
ADD CONSTRAINT [PK_PersonalDetailsDoctors]
    PRIMARY KEY CLUSTERED ([PersonalDetailsId] ASC);
GO

-- Creating primary key on [PersonalDetailsId] in table 'PersonalDetailsStaffMembers'
ALTER TABLE [dbo].[PersonalDetailsStaffMembers]
ADD CONSTRAINT [PK_PersonalDetailsStaffMembers]
    PRIMARY KEY CLUSTERED ([PersonalDetailsId] ASC);
GO

-- Creating primary key on [StaffId] in table 'Staffs'
ALTER TABLE [dbo].[Staffs]
ADD CONSTRAINT [PK_Staffs]
    PRIMARY KEY CLUSTERED ([StaffId] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [addressId] in table 'Centres'
ALTER TABLE [dbo].[Centres]
ADD CONSTRAINT [FK_Centre_Address]
    FOREIGN KEY ([addressId])
    REFERENCES [dbo].[Addresses]
        ([AdressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Centre_Address'
CREATE INDEX [IX_FK_Centre_Address]
ON [dbo].[Centres]
    ([addressId]);
GO

-- Creating foreign key on [addressId] in table 'Clinics'
ALTER TABLE [dbo].[Clinics]
ADD CONSTRAINT [FK_Clinic_Address]
    FOREIGN KEY ([addressId])
    REFERENCES [dbo].[Addresses]
        ([AdressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Clinic_Address'
CREATE INDEX [IX_FK_Clinic_Address]
ON [dbo].[Clinics]
    ([addressId]);
GO

-- Creating foreign key on [addressRegistred] in table 'DonorPersonalDetails'
ALTER TABLE [dbo].[DonorPersonalDetails]
ADD CONSTRAINT [FK_DonorPersonalDetails_Address]
    FOREIGN KEY ([addressRegistred])
    REFERENCES [dbo].[Addresses]
        ([AdressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DonorPersonalDetails_Address'
CREATE INDEX [IX_FK_DonorPersonalDetails_Address]
ON [dbo].[DonorPersonalDetails]
    ([addressRegistred]);
GO

-- Creating foreign key on [addressCurrent] in table 'DonorPersonalDetails'
ALTER TABLE [dbo].[DonorPersonalDetails]
ADD CONSTRAINT [FK_DonorPersonalDetails_Address1]
    FOREIGN KEY ([addressCurrent])
    REFERENCES [dbo].[Addresses]
        ([AdressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DonorPersonalDetails_Address1'
CREATE INDEX [IX_FK_DonorPersonalDetails_Address1]
ON [dbo].[DonorPersonalDetails]
    ([addressCurrent]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserLogins'
ALTER TABLE [dbo].[AspNetUserLogins]
ADD CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserLogins]
    ([UserId]);
GO

-- Creating foreign key on [DonorId] in table 'Donations'
ALTER TABLE [dbo].[Donations]
ADD CONSTRAINT [FK_Donation_AspNetUsers]
    FOREIGN KEY ([DonorId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Donation_AspNetUsers'
CREATE INDEX [IX_FK_Donation_AspNetUsers]
ON [dbo].[Donations]
    ([DonorId]);
GO

-- Creating foreign key on [DonorId] in table 'DonorPersonalDetails'
ALTER TABLE [dbo].[DonorPersonalDetails]
ADD CONSTRAINT [FK_DonorPersonalDetails_AspNetUsers]
    FOREIGN KEY ([DonorId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DonorPersonalDetails_AspNetUsers'
CREATE INDEX [IX_FK_DonorPersonalDetails_AspNetUsers]
ON [dbo].[DonorPersonalDetails]
    ([DonorId]);
GO

-- Creating foreign key on [DoctorId] in table 'PersonalDetailsDoctors'
ALTER TABLE [dbo].[PersonalDetailsDoctors]
ADD CONSTRAINT [FK_PersonalDetailsDoctor_AspNetUsers]
    FOREIGN KEY ([DoctorId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonalDetailsDoctor_AspNetUsers'
CREATE INDEX [IX_FK_PersonalDetailsDoctor_AspNetUsers]
ON [dbo].[PersonalDetailsDoctors]
    ([DoctorId]);
GO

-- Creating foreign key on [StaffId] in table 'PersonalDetailsStaffMembers'
ALTER TABLE [dbo].[PersonalDetailsStaffMembers]
ADD CONSTRAINT [FK_PersonalDetailsStaffMembers_AspNetUsers]
    FOREIGN KEY ([StaffId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonalDetailsStaffMembers_AspNetUsers'
CREATE INDEX [IX_FK_PersonalDetailsStaffMembers_AspNetUsers]
ON [dbo].[PersonalDetailsStaffMembers]
    ([StaffId]);
GO

-- Creating foreign key on [CentreId] in table 'BloodRequests'
ALTER TABLE [dbo].[BloodRequests]
ADD CONSTRAINT [FK_BloodRequest_Centre]
    FOREIGN KEY ([CentreId])
    REFERENCES [dbo].[Centres]
        ([CentreId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BloodRequest_Centre'
CREATE INDEX [IX_FK_BloodRequest_Centre]
ON [dbo].[BloodRequests]
    ([CentreId]);
GO

-- Creating foreign key on [ClinicId] in table 'BloodRequests'
ALTER TABLE [dbo].[BloodRequests]
ADD CONSTRAINT [FK_BloodRequest_Clinic]
    FOREIGN KEY ([ClinicId])
    REFERENCES [dbo].[Clinics]
        ([ClinicId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BloodRequest_Clinic'
CREATE INDEX [IX_FK_BloodRequest_Clinic]
ON [dbo].[BloodRequests]
    ([ClinicId]);
GO

-- Creating foreign key on [CentreId] in table 'Donations'
ALTER TABLE [dbo].[Donations]
ADD CONSTRAINT [FK_Donation_Centre]
    FOREIGN KEY ([CentreId])
    REFERENCES [dbo].[Centres]
        ([CentreId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Donation_Centre'
CREATE INDEX [IX_FK_Donation_Centre]
ON [dbo].[Donations]
    ([CentreId]);
GO

-- Creating foreign key on [CentreId] in table 'PersonalDetailsStaffMembers'
ALTER TABLE [dbo].[PersonalDetailsStaffMembers]
ADD CONSTRAINT [FK_PersonalDetailsStaffMembers_Centre]
    FOREIGN KEY ([CentreId])
    REFERENCES [dbo].[Centres]
        ([CentreId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonalDetailsStaffMembers_Centre'
CREATE INDEX [IX_FK_PersonalDetailsStaffMembers_Centre]
ON [dbo].[PersonalDetailsStaffMembers]
    ([CentreId]);
GO

-- Creating foreign key on [ClinicId] in table 'PersonalDetailsDoctors'
ALTER TABLE [dbo].[PersonalDetailsDoctors]
ADD CONSTRAINT [FK_PersonalDetailsDoctor_Clinic]
    FOREIGN KEY ([ClinicId])
    REFERENCES [dbo].[Clinics]
        ([ClinicId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonalDetailsDoctor_Clinic'
CREATE INDEX [IX_FK_PersonalDetailsDoctor_Clinic]
ON [dbo].[PersonalDetailsDoctors]
    ([ClinicId]);
GO

-- Creating foreign key on [DoctorId] in table 'PersonalDetailsDoctors'
ALTER TABLE [dbo].[PersonalDetailsDoctors]
ADD CONSTRAINT [FK_PersonalDetailsDoctor_Doctor]
    FOREIGN KEY ([DoctorId])
    REFERENCES [dbo].[Doctors]
        ([DoctorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonalDetailsDoctor_Doctor'
CREATE INDEX [IX_FK_PersonalDetailsDoctor_Doctor]
ON [dbo].[PersonalDetailsDoctors]
    ([DoctorId]);
GO

-- Creating foreign key on [StaffId] in table 'PersonalDetailsStaffMembers'
ALTER TABLE [dbo].[PersonalDetailsStaffMembers]
ADD CONSTRAINT [FK_PersonalDetailsStaffMembers_Staff]
    FOREIGN KEY ([StaffId])
    REFERENCES [dbo].[Staffs]
        ([StaffId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonalDetailsStaffMembers_Staff'
CREATE INDEX [IX_FK_PersonalDetailsStaffMembers_Staff]
ON [dbo].[PersonalDetailsStaffMembers]
    ([StaffId]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------