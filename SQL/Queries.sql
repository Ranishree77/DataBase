-- Query items under a specific category.
-- Querying rooms available based on availability status
SELECT
    r.RoomNum as RoomNumber,
    r.Type as RoomType,
    r.Capacity,
    r.PricePerDay
FROM Rooms r
WHERE r.Status = 'Available';

-- Query managers in the Staff table
SELECT
    StaffID,
    CONCAT(FirstName, '', LastName) as ManagerName,
    Email
FROM Staff
WHERE Designation = 'Manager';

-- Query to get the total number of guests, rooms booked on the specified date
SELECT
    SUM(NumOfGuests) AS TotalGuests,
    COUNT(RoomNum) AS RoomsBooked
FROM Bookings
WHERE CheckInDate = '2023-01-10';

-- Query data between different dates
-- Query Rooms Booked, Guest Details Between CheckIn and CheckOut Dates.
SELECT b.BookingID,
       b.RoomNum,
       CONCAT(g.FirstName, '', g.LastName) as GuestName,
       g.Address,
       g.Phone,
       g.Email,
       b.CheckInDate,
       b.CheckOutDate,
       b.NumOfGuests
FROM bookings b
JOIN Guests g ON g.GuestID = b.GuestID
WHERE b.CheckInDate BETWEEN '2023-01-10' AND '2023-01-20';

-- Query data for a specific item.

-- Query Room Details based on Room Number 101
SELECT * FROM rooms
WHERE RoomNum = 101;

-- Query Booking and Guest Details based on GuestID and RoomNumber
SELECT b.BookingID,
       b.RoomNum,
       CONCAT(g.FirstName, '', g.LastName) as GuestName,
       g.Address,
       g.Phone,
       g.Email,
       b.CheckInDate,
       b.CheckOutDate,
       b.NumOfGuests
FROM bookings b
JOIN Guests g ON g.GuestID = b.GuestID
WHERE g.GuestID = 10 AND b.RoomNum = 103;

-- Query based on room status occupied, get guests details and booking details
SELECT
    G.GuestID,
    G.FirstName,
    G.LastName,
    B.BookingID,
    B.RoomNum,
    B.CheckInDate,
    B.CheckOutDate,
    B.NumOfGuests
FROM Bookings B
JOIN Guests G ON B.GuestID = G.GuestID
JOIN Rooms R ON B.RoomNum = R.RoomNum
WHERE R.Status = 'Occupied';


-- Query services taken by the guest in the specified room
SELECT
    B.RoomNum,
    B.GuestID,
    S.ServiceID,
    S.Note,
    S.Charges
FROM Bookings B
JOIN Services S ON B.BookingID = S.BookingID
WHERE B.RoomNum = 102;

-- Query to get the number of staff members
SELECT
    COUNT(*) AS NumberOfStaff
FROM Staff;

-- Calculate the Total number of items in a period of time.

-- Query total payment by room 301 with services and number of days stayed with room rent
SELECT
    B.BookingID,
    R.RoomNum AS RoomNumber,
    DATEDIFF(B.CheckOutDate, B.CheckInDate) AS NumberOfDaysStayed,
    (R.PricePerDay * DATEDIFF(B.CheckOutDate, B.CheckInDate)) AS RoomRent,
    SUM(S.Charges) AS TotalServiceAmount,
    SUM(S.Charges) + (R.PricePerDay * DATEDIFF(B.CheckOutDate, B.CheckInDate)) AS TotalPayment
FROM Bookings B
JOIN Rooms R ON B.RoomNum = R.RoomNum
LEFT JOIN Services S ON B.BookingID = S.BookingID
WHERE R.RoomNum = 102
GROUP BY B.BookingID, R.RoomNum, R.PricePerDay;

-- Query net rooms available on a particular date
SELECT
    (RoomsAvailable - (NumberOfBookings + NumberOfReservations)) AS NetRoomsAvailable
FROM (
    SELECT COUNT(*) AS NumberOfReservations
    FROM Reservations
    WHERE '2023-04-01' BETWEEN FromDate AND ToDate
) AS ReservationsCount,
( SELECT COUNT(*) AS NumberOfBookings
  FROM Bookings
  WHERE '2023-04-01' BETWEEN CheckInDate AND CheckOutDate
) AS BookingsCount,
( SELECT COUNT(*) AS RoomsAvailable
  FROM Rooms r
  WHERE r.Status = 'Available'
) AS AvailableRoomsCount;
