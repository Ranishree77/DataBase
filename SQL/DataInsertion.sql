-- Insert into the Rooms Table
INSERT INTO Rooms (RoomNum, Type, Capacity, PricePerDay, Status)
VALUES 
(101, 'Standard', 2, 100.00, 'Occupied'),
(201, 'Deluxe', 3, 150.00, 'Occupied'),
(102, 'Suite', 4, 200.00, 'Occupied'),
(202, 'Standard', 2, 120.00, 'Occupied'),
(103, 'Ocean View', 2, 180.00, 'Occupied'),
(104, 'Mountain View', 3, 160.00, 'Occupied'),
(105, 'Executive', 2, 220.00, 'Occupied'),
(301, 'Deluxe', 3, 170.00, 'Occupied'),
(403, 'Standard', 2, 110.00, 'Occupied'),
(106, 'Suite', 4, 210.00, 'Occupied'),
(107, 'Standard', 2, 130.00, 'Available'),
(203, 'Ocean View', 2, 190.00, 'Available'),
(204, 'Mountain View', 3, 180.00, 'Available'),
(108, 'Executive', 2, 230.00, 'Available'),
(205, 'Standard', 2, 110.00, 'Available'),
(109, 'Deluxe', 3, 160.00, 'Available'),
(206, 'Suite', 4, 220.00, 'Available'),
(207, 'Standard', 2, 130.00, 'Available'),
(110, 'Ocean View', 2, 190.00, 'Available'),
(111, 'Mountain View', 3, 180.00, 'Available'),
(208, 'Executive', 2, 230.00, 'Available'),
(209, 'Deluxe', 3, 170.00, 'Available'),
(112, 'Standard', 2, 110.00, 'Available'),
(113, 'Suite', 4, 210.00, 'Available');

-- Insert data into Guests table
INSERT INTO Guests (GuestID, FirstName, LastName, Address, Phone, Email)
VALUES 
(1, 'Alice', 'Smith', '456 Oak St', '987-654-3210', 'alice.smith@example.com'),
(2, 'David', 'Jones', '789 Pine Ave', '111-222-3333', 'david.jones@citycenter.com'),
(3, 'Eva', 'Brown', '555 Seaside Dr', '444-555-6666', 'eva.brown@seasideresort.com'),
(4, 'George', 'Miller', '321 Mountain Rd', '777-888-9999', 'george.miller@mountainretreat.com'),
(5, 'Isabella', 'Davis', '999 Center St', '222-333-4444', 'isabella.davis@downtownsuites.com'),
(6, 'Kevin', 'Wilson', '777 River View', '666-777-8888', 'kevin.wilson@riversidelodge.com'),
(7, 'Olivia', 'Johnson', '111 Opulence Blvd', '333-444-5555', 'olivia.johnson@luxurypalace.com'),
(8, 'Michael', 'White', '222 Hillside Ln', '555-666-7777', 'michael.white@example.com'),
(9, 'Sophia', 'Anderson', '777 Skyline Ave', '888-999-0000', 'sophia.anderson@skylineresorts.com'),
(10, 'Liam', 'Taylor', '123 Maple St', '123-456-7890', 'liam.taylor@maplelodging.com'),
(11, 'Emma', 'Brown', '456 Sunset Blvd', '987-654-3210', 'emma.brown@sunsetretreat.com'),
(12, 'Noah', 'Wilson', '888 Lakeside Dr', '222-333-4444', 'noah.wilson@lakesideresorts.com'),
(13, 'Ava', 'Martin', '333 Riverside Ave', '555-777-9999', 'ava.martin@riversideinn.com'),
(14, 'Mason', 'Moore', '555 Forest Rd', '111-222-3333', 'mason.moore@foresthaven.com'),
(15, 'Harper', 'Jackson', '777 Mountain View', '444-555-6666', 'harper.jackson@mountainescape.com');

-- Insert data into Staff table
INSERT INTO Staff (StaffID, FirstName, LastName, Designation, Email)
VALUES 
(1, 'John', 'Doe', 'Manager', 'john.doe@examplehotel.com'),
(2, 'Jane', 'Smith', 'Receptionist', 'jane.smith@citycenter.com'),
(3, 'Robert', 'Johnson', 'Receptionist', 'robert.johnson@seasideresort.com'),
(4, 'Emily', 'Davis', 'Housekeeping', 'emily.davis@mountainretreat.com'),
(5, 'Michael', 'Brown', 'Manager', 'michael.brown@downtownsuites.com'),
(6, 'Sophia', 'Wilson', 'Receptionist', 'sophia.wilson@riversidelodge.com'),
(7, 'Daniel', 'Miller', 'Housekeeping', 'daniel.miller@luxurypalace.com');

-- Insert data into the Reservations table
INSERT INTO Reservations (ReservationID, GuestID, FromDate, ToDate, NoOfRooms)
VALUES 
(1, 2, '2023-01-10', '2023-01-20', 2),
(2, 4, '2023-02-10', '2023-02-15', 1),
(3, 5, '2023-03-05', '2023-03-10', 1),
(4, 6, '2023-04-01', '2023-04-05', 2),
(5, 7, '2023-05-12', '2023-05-18', 1),
(6, 9, '2023-06-20', '2023-06-25', 1);

-- Insert data into the Bookings table
INSERT INTO Bookings (BookingID, GuestID, RoomNum, StaffID, CheckInDate, CheckOutDate, NumOfGuests)
VALUES 
(1, 1, 101, 2, '2023-01-10', NULL, 2),
(2, 3, 201, 3, '2023-01-10', NULL, 2),
(3, 5, 102, 6, '2023-03-05', '2023-03-10', 1),
(4, 10, 103, 3, '2023-03-01', '2023-03-05', 1),
(5, 11, 104, 3, '2023-05-12', NULL, 1),
(6, 12, 105, 2, '2023-05-20', NULL, 2),
(7, 13, 301, 6, '2023-04-02', NULL, 2),
(8, 14, 403, 2, '2023-07-15', NULL, 2),
(9, 15, 106, 6, '2023-09-02', NULL, 2);

-- Insert data into Services table
INSERT INTO Services (ServiceID, BookingID, Note, Charges)
VALUES 
(1, 1, 'Room Service', 20.00),
(2, 2, 'Laundry', 15.00),
(3, 3, 'Room Service', 10.00),
(4, 4, 'Mini Bar', 30.00),
(5, 5, 'Airport Transfer', 40.00),
(6, 6, 'Spa Treatment', 50.00),
(7, 7, 'Room Service', 15.00),
(8, 8, 'Car Rental', 60.00),
(9, 9, 'Airport Transfer', 5.00),
(10, 9, 'Laundry', 20.00),
(11, 4, 'Room Service', 25.00),
(12, 1, 'Spa Treatment', 20.00),
(13, 2, 'Mini Bar', 15.00),
(14, 3, 'Laundry', 30.00);

-- Insert data into Payment table
INSERT INTO Billing (BillingID, BookingID, PaymentDate, TotalAmount, Status)
VALUES 
(1, 3, '2023-03-10', 1040.00, 'Paid'),
(2, 4, '2023-03-05', 955.00, 'Pending');
