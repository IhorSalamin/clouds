/****** Object:  Database [MyLabDB]    Script Date: 12/2/2023 1:32:04 PM ******/
CREATE DATABASE [MyLabDB]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_Gen5_2', MAXSIZE = 1 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [MyLabDB] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [MyLabDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyLabDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyLabDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyLabDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyLabDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyLabDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyLabDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyLabDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyLabDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyLabDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyLabDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyLabDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyLabDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyLabDB] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [MyLabDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyLabDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MyLabDB] SET  MULTI_USER 
GO
ALTER DATABASE [MyLabDB] SET ENCRYPTION ON
GO
ALTER DATABASE [MyLabDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyLabDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
ALTER DATABASE [MyLabDB] SET  READ_WRITE 
GO









-- Створення таблиці "employees"
CREATE TABLE employees (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    LastName VARCHAR(50),
    PassportSerialNumber VARCHAR(20),
    DateOfBirth DATE,
    StoreID INT,
    FOREIGN KEY (StoreID) REFERENCES drug_store(StoreID)
);

-- Створення таблиці "drug_store"
CREATE TABLE drug_store (
    StoreID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Address VARCHAR(100),
    Street VARCHAR(100)
);

-- Створення таблиці "pills_list"
CREATE TABLE pills_list (
    MinistryCode INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Drug BIT,
    OnlyWithRecipe BIT
);

-- Створення таблиці "pills2store"
CREATE TABLE pills2store (
    StoreID INT,
    MinistryCode INT,
    FOREIGN KEY (StoreID) REFERENCES drug_store(StoreID),
    FOREIGN KEY (MinistryCode) REFERENCES pills_list(MinistryCode),
    PRIMARY KEY (StoreID, MinistryCode)
);





INSERT INTO drug_store (Name, Address, Street) VALUES
('PharmaPlus', '123 Main St', 'Main Street'),
('HealthHub', '456 Oak Rd', 'Oak Road'),
('MediCare', '789 Pine Ave', 'Pine Avenue'),
('WellnessPharm', '101 River Ln', 'River Lane'),
('CureCorner', '202 Lake St', 'Lake Street'),
('AidApothecary', '303 Hill Blvd', 'Hill Boulevard'),
('RemedyRack', '404 Mountain Rd', 'Mountain Road'),
('PotionPlace', '505 Forest Ave', 'Forest Avenue'),
('ElixirEmporium', '606 Spring St', 'Spring Street'),
('CapsuleCastle', '707 Autumn Ln', 'Autumn Lane');


INSERT INTO pills_list (Name, Drug, OnlyWithRecipe) VALUES
('PainAway', TRUE, TRUE),
('FeverFoe', TRUE, FALSE),
('AllergyAid', TRUE, FALSE),
('CoughCease', TRUE, TRUE),
('FluFighter', TRUE, FALSE),
('HeadacheHalte', TRUE, TRUE),
('DigestEase', TRUE, FALSE),
('SleepSoothe', TRUE, TRUE),
('ColdCalm', TRUE, FALSE),
('StressStop', TRUE, TRUE);


INSERT INTO employees (Name, Surname, LastName, PassportSerialNumber, DateOfBirth, StoreID) VALUES
('John', 'Doe', 'Smith', 'PS123456', '1980-01-01', 1),
('Jane', 'Doe', 'Johnson', 'PS123457', '1982-02-02', 2),
('Jim', 'Beam', 'Brown', 'PS123458', '1984-03-03', 3),
('Jill', 'Valley', 'Green', 'PS123459', '1986-04-04', 4),
('Jack', 'Hill', 'White', 'PS123460', '1988-05-05', 5),
('Jessica', 'Lake', 'Black', 'PS123461', '1990-06-06', 6),
('Jeremy', 'River', 'Grey', 'PS123462', '1992-07-07', 7),
('Julia', 'Forest', 'Red', 'PS123463', '1994-08-08', 8),
('Jordan', 'Mountain', 'Blue', 'PS123464', '1996-09-09', 9),
('Jasmine', 'Field', 'Yellow', 'PS123465', '1998-10-10', 10);


INSERT INTO pills2store (StoreID, MinistryCode) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9), (9, 10), (10, 1);




