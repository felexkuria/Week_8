
 CREATE DATABASE ECommerceOrderManagement;
 USE ECommerceOrderManagement; 

-- Drop existing tables if they exist
DROP TABLE IF EXISTS Shipments;
DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- Customers table: Stores customer information
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    NationalRegistrationNumber VARCHAR(20)
);
-- No direct way to add table-level comments in the CREATE TABLE statement in SQLite

-- Products table: Tracks product details
CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY AUTOINCREMENT,
    SellerSKU VARCHAR(50) NOT NULL,
    SKU VARCHAR(50) NOT NULL,
    ItemName VARCHAR(255) NOT NULL,
    Variation VARCHAR(255)
);
-- No direct way to add table-level comments in the CREATE TABLE statement in SQLite

-- Orders table: Manages order headers
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER NOT NULL,
    OrderNumber VARCHAR(50) NOT NULL UNIQUE,
    CreatedAt DATETIME NOT NULL,
    UpdatedAt DATETIME NOT NULL,
    Prepayment TEXT NOT NULL CHECK (Prepayment IN ('Yes', 'No')),
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- No direct way to add table-level comments in the CREATE TABLE statement in SQLite

-- OrderItems table: Handles individual items in orders
CREATE TABLE OrderItems (
    OrderItemID INTEGER PRIMARY KEY AUTOINCREMENT,
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    Quantity INTEGER DEFAULT 1,
    PaidPrice REAL NOT NULL,
    UnitPrice REAL NOT NULL,
    ShippingFee REAL NOT NULL,
    WalletCredits REAL DEFAULT 0.00,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- No direct way to add table-level comments in the CREATE TABLE statement in SQLite

-- Shipments table: Manages shipping details
CREATE TABLE Shipments (
    ShipmentID INTEGER PRIMARY KEY AUTOINCREMENT,
    OrderID INTEGER UNIQUE NOT NULL,
    ShipmentProvider VARCHAR(100),
    ShipmentType VARCHAR(50),
    TrackingCode VARCHAR(100),
    TrackingURL VARCHAR(255),
    ShippingAddress TEXT NOT NULL,
    ShippingCity VARCHAR(100),
    ShippingPostalCode VARCHAR(20),
    ShippingCountry VARCHAR(50) NOT NULL,
    PackageGrossWeight REAL,
    PackageVolumetricWeight REAL,
    Premium TEXT DEFAULT 'No' CHECK (Premium IN ('Yes', 'No')),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- No direct way to add table-level comments in the CREATE TABLE statement in SQLite