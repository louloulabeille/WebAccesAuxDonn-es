USE [master]
GO
/****** Object:  Database [UserSave]    Script Date: 11/01/2021 22:22:38 ******/
CREATE DATABASE [UserSave]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserSave', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UserSave.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UserSave_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UserSave_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UserSave] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserSave].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserSave] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserSave] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserSave] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserSave] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserSave] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserSave] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserSave] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserSave] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserSave] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserSave] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserSave] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserSave] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserSave] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserSave] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserSave] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserSave] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserSave] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserSave] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserSave] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserSave] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserSave] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserSave] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserSave] SET RECOVERY FULL 
GO
ALTER DATABASE [UserSave] SET  MULTI_USER 
GO
ALTER DATABASE [UserSave] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserSave] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserSave] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserSave] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UserSave] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UserSave', N'ON'
GO
ALTER DATABASE [UserSave] SET QUERY_STORE = OFF
GO
USE [UserSave]
GO
/****** Object:  Table [dbo].[CentreInteret]    Script Date: 11/01/2021 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentreInteret](
	[IdCentreInteret] [nchar](3) NOT NULL,
	[DesignationInteret] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CentreInteret] PRIMARY KEY CLUSTERED 
(
	[IdCentreInteret] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 11/01/2021 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pays](
	[idPays2] [char](2) NOT NULL,
	[idPays3] [char](3) NOT NULL,
	[idPaysNum] [int] NOT NULL,
	[LibellePays] [nvarchar](155) NOT NULL,
 CONSTRAINT [PK_Pays] PRIMARY KEY CLUSTERED 
(
	[idPays2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 11/01/2021 22:22:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
	[Prenom] [nvarchar](50) NOT NULL,
	[Genre] [tinyint] NOT NULL,
	[Adress] [nvarchar](255) NOT NULL,
	[Cp] [nvarchar](50) NOT NULL,
	[Tel] [varchar](50) NOT NULL,
	[Ville] [nchar](30) NOT NULL,
	[idPays2] [char](2) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Interets] [nvarchar](1055) NOT NULL,
	[img] [nvarchar](255) NULL,
 CONSTRAINT [PK_UserInfo_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CentreInteret] ([IdCentreInteret], [DesignationInteret]) VALUES (N'INF', N'Informatique')
INSERT [dbo].[CentreInteret] ([IdCentreInteret], [DesignationInteret]) VALUES (N'JRD', N'Jardinage')
INSERT [dbo].[CentreInteret] ([IdCentreInteret], [DesignationInteret]) VALUES (N'LCT', N'Lecture')
INSERT [dbo].[CentreInteret] ([IdCentreInteret], [DesignationInteret]) VALUES (N'RDN', N'Randonnée')
INSERT [dbo].[CentreInteret] ([IdCentreInteret], [DesignationInteret]) VALUES (N'SPT', N'Sport')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AD', N'AND', 20, N'ANDORRE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AE', N'ARE', 784, N'EMIRATS ARABES UNIS ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AF', N'AFG', 4, N'AFGHANISTAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AG', N'ATG', 28, N'ANTIGUA-ET-BARBUDA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AI', N'AIA', 660, N'ANGUILLA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AL', N'ALB', 8, N'ALBANIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AM', N'ARM', 51, N'ARMENIE ARMÉNIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AN', N'ANT', 530, N'ANTILLES NEERLANDAISES ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AO', N'AGO', 24, N'ANGOLA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AQ', N'ATA', 10, N'ANTARCTIQUE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AR', N'ARG', 32, N'ARGENTINE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AS', N'ASM', 16, N'SAMOA AMERICAINES ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AT', N'AUT', 40, N'AUTRICHE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AU', N'AUS', 36, N'AUSTRALIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AW', N'ABW', 533, N'ARUBA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AX', N'ALA', 248, N'ALAND, ILES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'AZ', N'AZE', 31, N'AZERBAIDJAN ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BA', N'BIH', 70, N'BOSNIE-HERZÉGOVINE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BB', N'BRB', 52, N'BARBADE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BD', N'BGD', 50, N'BANGLADESH')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BE', N'BEL', 56, N'BELGIQUE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BF', N'BFA', 854, N'BURKINA FASO')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BG', N'BGR', 100, N'BULGARIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BH', N'BHR', 48, N'BAHREIN BAHREÏN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BI', N'BDI', 108, N'BURUNDI')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BJ', N'BEN', 204, N'BENIN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BL', N'BLM', 652, N'SAINT-BARTHELEMY ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BM', N'BMU', 60, N'BERMUDES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BN', N'BRN', 96, N'BRUNEI DARUSSALAM ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BO', N'BOL', 68, N'BOLIVIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BR', N'BRA', 76, N'BRESIL ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BS', N'BHS', 44, N'BAHAMAS')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BT', N'BTN', 64, N'BHOUTAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BW', N'BWA', 72, N'BOTSWANA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BY', N'BLR', 112, N'BELARUS')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'BZ', N'BLZ', 84, N'BELIZE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CA', N'CAN', 124, N'CANADA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CC', N'CCK', 166, N'COCOS (KEELING), ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CD', N'COD', 180, N'CONGO, LA REPUBLIQUE DEMOCRATIQUE DU CONGO')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CF', N'CAF', 140, N'CENTRAFRICAINE, REPUBLIQUE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CG', N'COG', 178, N'CONGO')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CH', N'CHE', 756, N'SUISSE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CI', N'CIV', 384, N'COTE D''IVOIRE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CK', N'COK', 184, N'COOK, ILES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CL', N'CHL', 152, N'CHILI')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CM', N'CMR', 120, N'CAMEROUN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CN', N'CHN', 156, N'CHINE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CO', N'COL', 170, N'COLOMBIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CR', N'CRI', 188, N'COSTA RICA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CU', N'CUB', 192, N'CUBA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CV', N'CPV', 132, N'CAP-VERT')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CX', N'CXR', 162, N'CHRISTMAS, ILE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CY', N'CYP', 196, N'CHYPRE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'CZ', N'CZE', 203, N'TCHEQUE, REPUBLIQUE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'DE', N'DEU', 276, N'ALLEMAGNE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'DJ', N'DJI', 262, N'DJIBOUTI')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'DK', N'DNK', 208, N'DANEMARK')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'DO', N'DOM', 212, N'DOMINICAINE, REPUBLIQUE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'DZ', N'DZA', 12, N'ALGERIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'EC', N'ECU', 218, N'EQUATEUR ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'EE', N'EST', 233, N'ESTONIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'EG', N'EGY', 818, N'EGYPTE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'EH', N'ESH', 732, N'SAHARA OCCIDENTAL')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ER', N'ERI', 232, N'ERYTHREE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ES', N'ESP', 724, N'ESPAGNE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ET', N'ETH', 231, N'ETHIOPIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'FI', N'FIN', 246, N'FINLANDE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'FJ', N'FJI', 242, N'FIDJI')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'FM', N'FSM', 583, N'MICRONESIE, ETATS FEDERES DE MICRONÉSIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'FO', N'FRO', 234, N'FEROE, ILES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'FR', N'FRA', 250, N'FRANCE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GA', N'GAB', 266, N'GABON')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GB', N'GBR', 826, N'ROYAUME-UNI')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GD', N'GRD', 308, N'GRENADE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GE', N'GEO', 268, N'GEORGIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GF', N'GUF', 254, N'GUYANE FRANCAISE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GG', N'GGY', 831, N'GUERNESEY')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GH', N'GHA', 288, N'GHANA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GI', N'GIB', 292, N'GIBRALTAR')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GL', N'GRL', 304, N'GROENLAND')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GM', N'GMB', 270, N'GAMBIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GN', N'GIN', 624, N'GUINEE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GP', N'GLP', 312, N'GUADELOUPE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GQ', N'GNQ', 226, N'GUINEE EQUATORIALE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GR', N'GRC', 300, N'GRECE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GT', N'GTM', 320, N'GUATEMALA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GU', N'GUM', 316, N'GUAM')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GW', N'GNB', 324, N'GUINEE BISSAU ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'GY', N'GUY', 328, N'GUYANE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'HK', N'HKG', 344, N'HONG KONG')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'HM', N'HMD', 334, N'HEARD, ILE ET MCDONALD, ILES ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'HN', N'HND', 340, N'HONDURAS')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'HR', N'HRV', 191, N'CROATIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'HT', N'HTI', 332, N'HAITI ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'HU', N'HUN', 348, N'HONGRIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ID', N'IDN', 360, N'INDONESIE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'IE', N'IRL', 372, N'IRLANDE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'IL', N'ISR', 376, N'ISRAEL')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'IN', N'IND', 356, N'INDE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'IQ', N'IRQ', 368, N'IRAQ')
GO
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'IR', N'IRN', 364, N'IRAN, REPUBLIQUE ISLAMIQUE D'' IRAN, ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'IS', N'ISL', 352, N'ISLANDE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'IT', N'ITA', 380, N'ITALIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'JE', N'JEY', 832, N'JERSEY')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'JM', N'JAM', 388, N'JAMAIQUE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'JO', N'JOR', 400, N'JORDANIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'JP', N'JPN', 392, N'JAPON')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KE', N'KEN', 404, N'KENYA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KG', N'KGZ', 417, N'KIRGHIZISTAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KH', N'KHM', 116, N'CAMBODGE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KI', N'KIR', 296, N'KIRIBATI')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KM', N'COM', 174, N'COMORES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KN', N'KNA', 659, N'SAINT-KITTS-ET-NEVIS')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KP', N'PRK', 410, N'COREE, REPUBLIQUE POPULAIRE DEMOCRATIQUE DE CORÉE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KR', N'KOR', 408, N'COREE, REPUBLIQUE DE CORÉE, ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KW', N'KWT', 414, N'KOWEIT')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KY', N'CYM', 136, N'CAIMANES, ILES ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'KZ', N'KAZ', 398, N'KAZAKHSTAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LA', N'LAO', 418, N'LAOS, REPUBLIQUE DEMOCRATIQUE POPULAIRE LAO')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LB', N'LBN', 422, N'LIBAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LC', N'LCA', 662, N'SAINTE-LUCIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LI', N'LIE', 438, N'LIECHTENSTEIN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LK', N'LKA', 144, N'SRI LANKA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LR', N'LBR', 430, N'LIBERIA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LS', N'LSO', 426, N'LESOTHO')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LT', N'LTU', 440, N'LITUANIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LU', N'LUX', 442, N'LUXEMBOURG')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LV', N'LVA', 428, N'LETTONIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'LY', N'LBY', 434, N'LIBYENNE, JAMAHIRIYA ARABE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MA', N'MAR', 504, N'MAROC')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MC', N'MCO', 492, N'MONACO')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MD', N'MDA', 498, N'MOLDOVA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ME', N'MNE', 499, N'MONTENEGRO ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MF', N'MAF', 663, N'SAINT-MARTIN (PARTIE FRANCAISE) ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MG', N'MDG', 450, N'MADAGASCAR')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MH', N'MHL', 584, N'MARSHALL, ILES ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MK', N'MKD', 807, N'MACEDOINE, L''EX-REPUBLIQUE YOUGOSLAVE DE MACÉDOINE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ML', N'MLI', 466, N'MALI')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MN', N'MNG', 496, N'MONGOLIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MO', N'MAC', 446, N'MACAO')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MP', N'MNP', 580, N'MARIANNES DU NORD, ILES MARIANNES DU NORD')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MQ', N'MTQ', 474, N'MARTINIQUE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MR', N'MRT', 478, N'MAURITANIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MS', N'MSR', 500, N'MONTSERRAT')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MT', N'MLT', 470, N'MALTE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MU', N'MUS', 480, N'MAURICE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MV', N'MDV', 462, N'MALDIVES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MW', N'MWI', 454, N'MALAWI')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MX', N'MEX', 484, N'MEXIQUE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MY', N'MYS', 458, N'MALAISIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'MZ', N'MOZ', 508, N'MOZAMBIQUE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NA', N'NAM', 516, N'NAMIBIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NC', N'NCL', 540, N'NOUVELLE-CALEDONIE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NE', N'NER', 562, N'NIGER')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NF', N'NFK', 574, N'NORFOLK, ILE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NG', N'NGA', 566, N'NIGERIA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NI', N'NIC', 558, N'NICARAGUA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NL', N'NLD', 528, N'PAYS-BAS')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NO', N'NOR', 578, N'NORVEGE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NP', N'NPL', 524, N'NEPAL')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NR', N'NRU', 520, N'NAURU')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NU', N'NIU', 570, N'NIUE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'NZ', N'NZL', 554, N'NOUVELLE-ZELANDE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'OM', N'OMN', 512, N'OMAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PA', N'PAN', 591, N'PANAMA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PE', N'PER', 604, N'PEROU')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PF', N'PYF', 258, N'POLYNESIE FRANCAISE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PG', N'PNG', 598, N'PAPOUASIE-NOUVELLE-GUINEE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PH', N'PHL', 608, N'PHILIPPINES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PK', N'PAK', 586, N'PAKISTAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PL', N'POL', 616, N'POLOGNE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PM', N'SPM', 666, N'SAINT-PIERRE-ET-MIQUELON')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PN', N'PCN', 612, N'PITCAIRN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PR', N'PRI', 630, N'PORTO RICO')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PT', N'PRT', 620, N'PORTUGAL')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PW', N'PLW', 585, N'PALAOS')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'PY', N'PRY', 600, N'PARAGUAY')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'QA', N'QAT', 634, N'QATAR')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'RE', N'REU', 638, N'REUNION')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'RO', N'ROU', 642, N'ROUMANIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'RS', N'SRB', 688, N'SERBIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'RU', N'RUS', 643, N'RUSSIE, FEDERATION DE RUSSIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'RW', N'RWA', 646, N'RWANDA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SA', N'SAU', 682, N'ARABIE SAOUDITE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SB', N'SLB', 90, N'SALOMON, ILES ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SC', N'SYC', 690, N'SEYCHELLES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SD', N'SDN', 736, N'SOUDAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SE', N'SWE', 752, N'SUEDE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SG', N'SGP', 702, N'SINGAPOUR')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SH', N'SHN', 654, N'SAINTE-HÉLÈNE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SI', N'SVN', 705, N'SLOVENIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SJ', N'SJM', 744, N'SVALBARD ET ILE JAN MAYEN ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SK', N'SVK', 703, N'SLOVAQUIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SL', N'SLE', 694, N'SIERRA LEONE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SM', N'SMR', 674, N'SAINT-MARIN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SN', N'SEN', 686, N'SENEGAL')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SO', N'SOM', 706, N'SOMALIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SR', N'SUR', 740, N'SURINAME')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ST', N'STP', 678, N'SAO TOME-ET-PRINCIPE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SY', N'SYR', 760, N'SYRIENNE, REPUBLIQUE ARABE ')
GO
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'SZ', N'SWZ', 748, N'SWAZILAND')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TC', N'TCA', 796, N'TURKS ET CAIQUES, ILES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TD', N'TCD', 148, N'TCHAD')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TF', N'ATF', 260, N'TERRES AUSTRALES FRANCAISES ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TG', N'TGO', 768, N'TOGO')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TH', N'THA', 764, N'THAILANDE ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TJ', N'TJK', 762, N'TADJIKISTAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TK', N'TKL', 772, N'TOKELAU')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TL', N'TLS', 626, N'TIMOR-LESTE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TM', N'TKM', 795, N'TURKMENISTAN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TN', N'TUN', 788, N'TUNISIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TO', N'TON', 776, N'TONGA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TR', N'TUR', 792, N'TURQUIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TT', N'TTO', 780, N'TRINITE-ET-TOBAGO ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TV', N'TUV', 798, N'TUVALU')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TW', N'TWN', 158, N'TAÏWAN, PROVINCE DE CHINE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'TZ', N'TZA', 834, N'TANZANIE, REPUBLIQUE UNIE DE TANZANIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'UA', N'UKR', 804, N'UKRAINE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'UG', N'UGA', 800, N'OUGANDA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'UM', N'UMI', 581, N'ILES MINEURES ELOIGNEES DES Etats-Unis')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'US', N'USA', 840, N'Etats-Unis')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'UY', N'URY', 858, N'URUGUAY')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'UZ', N'UZB', 860, N'OUZBEKISTAN ')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'VC', N'VCT', 670, N'SAINT-VINCENT-ET-LES GRENADINES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'VE', N'VEN', 862, N'VENEZUELA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'VG', N'VGB', 92, N'ILES VIERGES BRITANNIQUES')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'VI', N'VIR', 850, N'ILES VIERGES DES Etats-Unis')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'VN', N'VNM', 704, N'VIET NAM')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'VU', N'VUT', 548, N'VANUATU')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'WF', N'WLF', 876, N'WALLIS-ET-FUTUNA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'WS', N'WSM', 882, N'SAMOA')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'YE', N'YEM', 887, N'YEMEN')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'YT', N'MYT', 175, N'MAYOTTE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ZA', N'ZAF', 710, N'AFRIQUE DU SUD')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ZM', N'ZMB', 894, N'ZAMBIE')
INSERT [dbo].[Pays] ([idPays2], [idPays3], [idPaysNum], [LibellePays]) VALUES (N'ZW', N'ZWE', 716, N'ZIMBABWE')
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([id], [Nom], [Prenom], [Genre], [Adress], [Cp], [Tel], [Ville], [idPays2], [Email], [Interets], [img]) VALUES (1, N'Bost', N'Vincent', 1, N'2, Route de la Maurie Haut', N'19270', N'06 40 75 27 78', N'Sainte Féréole                ', N'Fr', N'vincent.bost@afpa.fr', N'[{''IdCentreInteret'': ''INF'', ''DesignationCentreInteret'':''Informatique''},{''IdCentreInteret'': ''LCT'', ''DesignationCentreInteret'':''Lecture''}]', N'')
INSERT [dbo].[UserInfo] ([id], [Nom], [Prenom], [Genre], [Adress], [Cp], [Tel], [Ville], [idPays2], [Email], [Interets], [img]) VALUES (2, N'Bost', N'Vincent', 1, N'2, Route de la Maurie Haut', N'19270', N'06 40 75 27 78', N'Sainte Féréole                ', N'Fr', N'vincent.bost@afpa.fr', N'[{''IdCentreInteret'': ''INF'', ''DesignationCentreInteret'':''Informatique''},{''IdCentreInteret'': ''LCT'', ''DesignationCentreInteret'':''Lecture''}]', N'')
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_UserInfo_Pays] FOREIGN KEY([idPays2])
REFERENCES [dbo].[Pays] ([idPays2])
GO
ALTER TABLE [dbo].[UserInfo] CHECK CONSTRAINT [FK_UserInfo_Pays]
GO
/****** Object:  StoredProcedure [dbo].[CentreInteret_Delete]    Script Date: 11/01/2021 22:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: lundi 11 janvier 2021
-- Description:	Procédure stockée de l'opération Suppresion sur la table dbo.CentreInteret
-- =============================================

CREATE procedure [dbo].[CentreInteret_Delete]
(
@IdCentreInteret AS nchar(3)
)
AS

BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
DELETE FROM [dbo].[CentreInteret]
WHERE
IdCentreInteret=@IdCentreInteret
END
GO
/****** Object:  StoredProcedure [dbo].[CentreInteret_Insert]    Script Date: 11/01/2021 22:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: lundi 11 janvier 2021
-- Description:	Procédure stockée de l'opération Insertion sur la table dbo.CentreInteret
-- =============================================

CREATE procedure [dbo].[CentreInteret_Insert]
(
@IdCentreInteret AS nchar(3),
@DesignationInteret AS nvarchar(50)
)
AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
INSERT INTO [dbo].[CentreInteret]
(
IdCentreInteret,
DesignationInteret
)
VALUES
(
@IdCentreInteret,
@DesignationInteret	
)

SELECT @IdCentreInteret = IdCentreInteret,
@DesignationInteret = DesignationInteret FROM [dbo].[CentreInteret]
Where @IdCentreInteret = IdCentreInteret
END
GO
/****** Object:  StoredProcedure [dbo].[CentreInteret_Update]    Script Date: 11/01/2021 22:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: lundi 11 janvier 2021
-- Description:	Procédure stockée de l'opération Modification sur la table dbo.CentreInteret
-- =============================================
CREATE procedure [dbo].[CentreInteret_Update]
(
@IdCentreInteret AS nchar(3),
@DesignationInteret AS nvarchar(50)
)
AS

BEGIN  
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
UPDATE [dbo].[CentreInteret]
SET
DesignationInteret=@DesignationInteret
WHERE
IdCentreInteret=@IdCentreInteret
END
GO
/****** Object:  StoredProcedure [dbo].[Pays_Delete]    Script Date: 11/01/2021 22:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: lundi 11 janvier 2021
-- Description:	Procédure stockée de l'opération Suppresion sur la table dbo.Pays
-- =============================================

CREATE procedure [dbo].[Pays_Delete]
(
@idPays2 AS char(2)
)
AS

BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
DELETE FROM [dbo].[Pays]
WHERE
idPays2=@idPays2
END
GO
/****** Object:  StoredProcedure [dbo].[Pays_Insert]    Script Date: 11/01/2021 22:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: lundi 11 janvier 2021
-- Description:	Procédure stockée de l'opération Insertion sur la table dbo.Pays
-- =============================================

CREATE procedure [dbo].[Pays_Insert]
(
@idPays2 AS char(2),
@idPays3 AS char(3),
@idPaysNum AS int,
@LibellePays AS nvarchar(155)
)
AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
INSERT INTO [dbo].[Pays]
(
idPays2,
idPays3,
idPaysNum,
LibellePays
)
VALUES
(
@idPays2,
@idPays3,
@idPaysNum,
@LibellePays	
)

SELECT @idPays2 = idPays2,
@idPays3 = idPays3,
@idPaysNum = idPaysNum,
@LibellePays = LibellePays FROM [dbo].[Pays]
Where @idPays2 = idPays2
END
GO
/****** Object:  StoredProcedure [dbo].[Pays_Update]    Script Date: 11/01/2021 22:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: lundi 11 janvier 2021
-- Description:	Procédure stockée de l'opération Modification sur la table dbo.Pays
-- =============================================
CREATE procedure [dbo].[Pays_Update]
(
@idPays2 AS char(2),
@idPays3 AS char(3),
@idPaysNum AS int,
@LibellePays AS nvarchar(155)
)
AS

BEGIN  
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
UPDATE [dbo].[Pays]
SET
idPays3=@idPays3,
idPaysNum=@idPaysNum,
LibellePays=@LibellePays
WHERE
idPays2=@idPays2
END
GO
/****** Object:  StoredProcedure [dbo].[UserInfo_Delete]    Script Date: 11/01/2021 22:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: lundi 11 janvier 2021
-- Description:	Procédure stockée de l'opération Suppresion sur la table dbo.UserInfo
-- =============================================

CREATE procedure [dbo].[UserInfo_Delete]
(
@id AS int
)
AS

BEGIN 
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
DELETE FROM [dbo].[UserInfo]
WHERE
id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[UserInfo_Insert]    Script Date: 11/01/2021 22:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: lundi 11 janvier 2021
-- Description:	Procédure stockée de l'opération Insertion sur la table dbo.UserInfo
-- =============================================

CREATE procedure [dbo].[UserInfo_Insert]
(
@id AS int OUT,
@Nom AS nvarchar(50),
@Prenom AS nvarchar(50),
@Genre AS tinyint,
@Adress AS nvarchar(255),
@Cp AS nvarchar(50),
@Tel AS varchar(50),
@Ville AS nchar(30),
@idPays2 AS char(2),
@Email AS nvarchar(255),
@Interets AS nvarchar(1055),
@img AS nvarchar(255)=null
)
AS

BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
INSERT INTO [dbo].[UserInfo]
(
Nom,
Prenom,
Genre,
Adress,
Cp,
Tel,
Ville,
idPays2,
Email,
Interets,
img
)
VALUES
(
@Nom,
@Prenom,
@Genre,
@Adress,
@Cp,
@Tel,
@Ville,
@idPays2,
@Email,
@Interets,
@img	
)
SET @id = SCOPE_IDENTITY() 

SELECT @id = id,
@Nom = Nom,
@Prenom = Prenom,
@Genre = Genre,
@Adress = Adress,
@Cp = Cp,
@Tel = Tel,
@Ville = Ville,
@idPays2 = idPays2,
@Email = Email,
@Interets = Interets,
@img = img FROM [dbo].[UserInfo]
Where @id = id
END
GO
/****** Object:  StoredProcedure [dbo].[UserInfo_Update]    Script Date: 11/01/2021 22:22:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Bost
-- Create date: lundi 11 janvier 2021
-- Description:	Procédure stockée de l'opération Modification sur la table dbo.UserInfo
-- =============================================
CREATE procedure [dbo].[UserInfo_Update]
(
@id AS int,
@Nom AS nvarchar(50),
@Prenom AS nvarchar(50),
@Genre AS tinyint,
@Adress AS nvarchar(255),
@Cp AS nvarchar(50),
@Tel AS varchar(50),
@Ville AS nchar(30),
@idPays2 AS char(2),
@Email AS nvarchar(255),
@Interets AS nvarchar(1055),
@img AS nvarchar(255)=null
)
AS

BEGIN  
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
-- SET NOCOUNT ON;
UPDATE [dbo].[UserInfo]
SET
Nom=@Nom,
Prenom=@Prenom,
Genre=@Genre,
Adress=@Adress,
Cp=@Cp,
Tel=@Tel,
Ville=@Ville,
idPays2=@idPays2,
Email=@Email,
Interets=@Interets,
img=@img
WHERE
id=@id
END
GO
USE [master]
GO
ALTER DATABASE [UserSave] SET  READ_WRITE 
GO
