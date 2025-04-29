-- Creating Farms table
CREATE TABLE Farms (
    FarmID INT PRIMARY KEY,
    Name VARCHAR2(100),
    Location VARCHAR2(255),
    Size_Acres INT
);

-- Creating Farmers table
CREATE TABLE Farmers (
    FarmerID INT PRIMARY KEY,
    Name VARCHAR2(100),
    Age INT,
    FarmID INT,
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating Crops table
CREATE TABLE Crops (
    CropID INT PRIMARY KEY,
    Name VARCHAR2(100),
    FarmID INT,
    Season VARCHAR2(50),
    Yield_Tons DECIMAL(10,2),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating Livestock table
CREATE TABLE Livestock (
    LivestockID INT PRIMARY KEY,
    Type VARCHAR2(100),
    FarmID INT,
    Count INT,
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating SoilQuality table
CREATE TABLE SoilQuality (
    SoilID INT PRIMARY KEY,
    FarmID INT,
    pH_Level DECIMAL(5,2),
    OrganicMatter_Percent DECIMAL(5,2),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating WeatherData table
CREATE TABLE WeatherData (
    WeatherID INT PRIMARY KEY,
    Location VARCHAR2(255),
    Temperature_C DECIMAL(5,2),
    Rainfall_mm DECIMAL(10,2),
    Condition VARCHAR2(50)
);

-- Creating Irrigation table
CREATE TABLE Irrigation (
    IrrigationID INT PRIMARY KEY,
    FarmID INT,
    WaterSource VARCHAR2(100),
    LitersUsed DECIMAL(10,2),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating Pesticides table
CREATE TABLE Pesticides (
    PesticideID INT PRIMARY KEY,
    FarmID INT,
    Type VARCHAR2(100),
    Usage_Liters DECIMAL(10,2),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating Fertilizers table
CREATE TABLE Fertilizers (
    FertilizerID INT PRIMARY KEY,
    FarmID INT,
    Type VARCHAR2(100),
    Usage_Kg DECIMAL(10,2),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating FarmEquipment table
CREATE TABLE FarmEquipment (
    EquipmentID INT PRIMARY KEY,
    FarmID INT,
    Type VARCHAR2(100),
    LastMaintenance DATE,
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating Harvest table
CREATE TABLE Harvest (
    HarvestID INT PRIMARY KEY,
    CropID INT,
    FarmID INT,
    Quantity_Tons DECIMAL(10,2),
    HarvestDate DATE,
    FOREIGN KEY (CropID) REFERENCES Crops(CropID),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating MarketPrices table
CREATE TABLE MarketPrices (
    MarketID INT PRIMARY KEY,
    CropName VARCHAR2(100),
    PricePerTon DECIMAL(10,2),
    MarketDate DATE
);

-- Creating Storage table
CREATE TABLE Storage (
    StorageID INT PRIMARY KEY,
    FarmID INT,
    CropName VARCHAR2(100),
    Quantity_Tons DECIMAL(10,2),
    StorageType VARCHAR2(50),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating SupplyChain table
CREATE TABLE SupplyChain (
    SupplyID INT PRIMARY KEY,
    FarmID INT,
    Destination VARCHAR2(255),
    TransportMode VARCHAR2(50),
    Quantity_Tons DECIMAL(10,2),
    FOREIGN KEY (FarmID) REFERENCES Farms(FarmID)
);

-- Creating GovernmentSubsidies table
CREATE TABLE GovernmentSubsidies (
    SubsidyID INT PRIMARY KEY,
    FarmerID INT,
    Amount DECIMAL(10,2),
    IssuedDate DATE,
    FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);