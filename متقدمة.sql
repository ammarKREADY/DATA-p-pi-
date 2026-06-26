CREATE TABLE Dim_Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    ContactFirstName VARCHAR(50),
    ContactLastName VARCHAR(50),
    AddressLine1 VARCHAR(255),
    AddressLine2 VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

CREATE TABLE Dim_Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductCode VARCHAR(50) NOT NULL,
    ProductLine VARCHAR(100),
    MSRP DECIMAL(10, 2),
    PriceEach DECIMAL(10, 2)
);

CREATE TABLE Dim_Time (
    TimeID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE NOT NULL,
    Month_ID INT,
    QTR_ID INT,
    Year_ID INT
);

CREATE TABLE Fact_Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    OrderNumber INT NOT NULL,
    QuantityOrdered INT NOT NULL,
    PriceEach DECIMAL(10, 2),
    Sales DECIMAL(10, 2),
    CustomerID INT,
    ProductID INT,
    TimeID INT,
    DealSize VARCHAR(50),

    FOREIGN KEY (CustomerID) REFERENCES Dim_Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Dim_Products(ProductID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TimeID) REFERENCES Dim_Time(TimeID) ON DELETE CASCADE ON UPDATE CASCADE
);
