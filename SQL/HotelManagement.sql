DROP SCHEMA if exists hotelmanagementsystem;
CREATE SCHEMA hotelmanagementsystem;
USE hotelmanagementsystem;

-- Rooms Table
CREATE TABLE Rooms (
    RoomNum INT PRIMARY KEY,
    Type VARCHAR(50),
    Capacity INT,
    PricePerDay DECIMAL(10, 2),
    Status VARCHAR(20)
);

-- Guests Table
CREATE TABLE Guests (
    GuestID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Designation VARCHAR(50),
    Email VARCHAR(40)
);

-- Reservations Table
CREATE TABLE Reservations (
       ReservationID INT Primary Key,
       GuestID INT,
       FromDate Date,
       ToDate Date,
       NoOfRooms INT,
       Foreign key (GuestID) REFERENCES Guests(GuestID)
);

-- Booking Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    GuestID INT,
    RoomNum INT,
    StaffID INT,
    CheckInDate DATE,
    CheckOutDate DATE DEFAULT NULL,
    NumOfGuests INT,
    Foreign key (GuestID) REFERENCES Guests(GuestID),
    FOREIGN KEY (RoomNum) REFERENCES Rooms(RoomNum),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Services Table
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    BookingID INT,
    Note VARCHAR(100),
    Charges DECIMAL(10, 2),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Payment Table
CREATE TABLE Billing (
    BillingID INT PRIMARY KEY,
    BookingID INT,
    PaymentDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
