CREATE DATABASE airline_management;

USE airline_management;

CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    country VARCHAR(50)
);

desc passengers;

INSERT INTO passengers
(passenger_name, gender, age, city, country)
VALUES
('Bareera', 'Female', 24, 'Mumbai', 'India'),
('Ishra', 'Female', 27, 'Delhi', 'India'),
('Warisha', 'Female', 22, 'Lucknow', 'India'),
('Imama', 'Female', 30, 'Pune', 'India'),
('Bushra', 'Female', 25, 'Hyderabad', 'India'),
('Rahul Sharma', 'Male', 32, 'Delhi', 'India'),
('Aman Verma', 'Male', 28, 'Mumbai', 'India'),
('Sara Khan', 'Female', 26, 'Dubai', 'UAE'),
('Arjun Mehta', 'Male', 35, 'Bangalore', 'India'),
('Zoya Ali', 'Female', 29, 'Kolkata', 'India');

select * from passengers;

CREATE TABLE airports (
    airport_id INT PRIMARY KEY AUTO_INCREMENT,
    airport_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

desc airports;
INSERT INTO airports
(airport_name, city, country)
VALUES
('Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India'),
('Indira Gandhi International Airport', 'Delhi', 'India'),
('Chaudhary Charan Singh International Airport', 'Lucknow', 'India'),
('Kempegowda International Airport', 'Bangalore', 'India'),
('Rajiv Gandhi International Airport', 'Hyderabad', 'India'),
('Netaji Subhas Chandra Bose International Airport', 'Kolkata', 'India'),
('Dubai International Airport', 'Dubai', 'UAE'),
('Abu Dhabi International Airport', 'Abu Dhabi', 'UAE'),
('Chennai International Airport', 'Chennai', 'India'),
('Cochin International Airport', 'Kochi', 'India');

select * from airports;


CREATE TABLE flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(20) NOT NULL,
    airline VARCHAR(50) NOT NULL,
    source_airport_id INT NOT NULL,
    destination_airport_id INT NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    flight_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (source_airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (destination_airport_id) REFERENCES airports(airport_id)
);

desc flights;

INSERT INTO flights
(flight_number, airline, source_airport_id, destination_airport_id,
 departure_time, arrival_time, flight_status)
VALUES
('AI101', 'Air India', 1, 2, '2026-10-01 06:30:00', '2026-10-01 08:45:00', 'Scheduled'),

('6E202', 'IndiGo', 2, 1, '2026-10-01 10:00:00', '2026-10-01 12:10:00', 'Scheduled'),

('AI303', 'Air India', 1, 3, '2026-10-02 07:15:00', '2026-10-02 09:00:00', 'Scheduled'),

('6E404', 'IndiGo', 3, 4, '2026-10-02 11:30:00', '2026-10-02 13:45:00', 'Scheduled'),

('UK505', 'Vistara', 4, 5, '2026-10-03 09:00:00', '2026-10-03 11:00:00', 'Completed'),

('AI606', 'Air India', 5, 6, '2026-10-03 14:00:00', '2026-10-03 16:30:00', 'Completed'),

('EK707', 'Emirates', 7, 1, '2026-10-04 02:00:00', '2026-10-04 07:30:00', 'Scheduled'),

('6E808', 'IndiGo', 6, 9, '2026-10-04 08:00:00', '2026-10-04 10:15:00', 'Cancelled'),

('AI909', 'Air India', 9, 10, '2026-10-05 12:00:00', '2026-10-05 13:20:00', 'Completed'),

('6E010', 'IndiGo', 10, 1, '2026-10-05 15:00:00', '2026-10-05 17:30:00', 'Scheduled');

select * from flights;

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT NOT NULL,
    flight_id INT NOT NULL,
    booking_date DATE NOT NULL,
    travel_class VARCHAR(20) NOT NULL,
    seat_number VARCHAR(10),
    ticket_price DECIMAL(10,2) NOT NULL,
    booking_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
);
 
 desc bookings;
 
INSERT INTO bookings
(passenger_id, flight_id, booking_date, travel_class,
 seat_number, ticket_price, booking_status)
VALUES
(1, 1, '2026-09-20', 'Economy', '12A', 5500.00, 'Confirmed'),
(2, 1, '2026-09-21', 'Business', '3B', 12500.00, 'Confirmed'),
(3, 2, '2026-09-21', 'Economy', '18C', 4800.00, 'Confirmed'),
(4, 3, '2026-09-21', 'Economy', '22A', 5200.00, 'Confirmed'),
(5, 4, '2026-09-22', 'Business', '5D', 11000.00, 'Confirmed'),
(6, 5, '2026-09-22', 'Economy', '14B', 6500.00, 'Cancelled'),
(7, 6, '2026-09-22', 'Economy', '19A', 7200.00, 'Confirmed'),
(8, 7, '2026-09-22', 'Business', '2A', 28500.00, 'Confirmed'),
(9, 8, '2026-09-23', 'Economy', '25C', 7500.00, 'Cancelled'),
(10, 9, '2026-09-23', 'Economy', '16D', 4200.00, 'Confirmed'),
(1, 10, '2026-09-23', 'Business', '4A', 9800.00, 'Confirmed'),
(3, 5, '2026-09-23', 'Economy', '21B', 6300.00, 'Confirmed'),
(5, 6, '2026-09-23', 'Economy', '17C', 7100.00, 'Pending'),
(7, 3, '2026-09-23', 'Business', '6A', 11800.00, 'Confirmed'),
(9, 4, '2026-09-23', 'Economy', '20D', 5600.00, 'Confirmed');

select * from bookings;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

desc payments;

INSERT INTO payments
(booking_id, payment_date, payment_method, amount, payment_status)
VALUES
(1, '2026-09-20', 'UPI', 5500.00, 'Paid'),
(2, '2026-09-21', 'Credit Card', 12500.00, 'Paid'),
(3, '2026-09-21', 'UPI', 4800.00, 'Paid'),
(4, '2026-09-21', 'Debit Card', 5200.00, 'Paid'),
(5, '2026-09-22', 'Credit Card', 11000.00, 'Paid'),
(6, '2026-09-22', 'UPI', 6500.00, 'Refunded'),
(7, '2026-09-22', 'Net Banking', 7200.00, 'Paid'),
(8, '2026-09-22', 'Credit Card', 28500.00, 'Paid'),
(9, '2026-09-23', 'UPI', 7500.00, 'Refunded'),
(10, '2026-09-23', 'Debit Card', 4200.00, 'Paid'),
(11, '2026-09-23', 'UPI', 9800.00, 'Paid'),
(12, '2026-09-23', 'Credit Card', 6300.00, 'Paid'),
(13, '2026-09-23', 'UPI', 7100.00, 'Pending'),
(14, '2026-09-23', 'Debit Card', 11800.00, 'Paid'),
(15, '2026-09-23', 'UPI', 5600.00, 'Paid');

select * from payments;


CREATE TABLE baggage (
    baggage_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    baggage_weight DECIMAL(5,2) NOT NULL,
    baggage_status VARCHAR(20) NOT NULL,

    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
 
 desc baggage;
 
INSERT INTO baggage
(booking_id, baggage_weight, baggage_status)
VALUES
(1, 15.50, 'Checked-In'),
(2, 22.00, 'Checked-In'),
(3, 18.50, 'Checked-In'),
(4, 12.00, 'Checked-In'),
(5, 25.00, 'Checked-In'),
(6, 20.00, 'Cancelled'),
(7, 16.50, 'Checked-In'),
(8, 28.00, 'Checked-In'),
(9, 19.00, 'Cancelled'),
(10, 14.50, 'Checked-In'),
(11, 23.00, 'Checked-In'),
(12, 17.50, 'Checked-In'),
(13, 21.00, 'Pending'),
(14, 24.50, 'Checked-In'),
(15, 13.00, 'Checked-In');

select * from baggage;

show tables;


-- FIND ALL PASSENGER FROM INDIA 
select * from passengers where country='India';

-- FIND PASSENGER WHOSE AGE IS GREATER THAN 25
select * from passengers where age>25;  

-- FIND THE HIGHEST TICKET PRICE
select max(ticket_price) as highest_ticket_price from bookings;

-- FIND THE AVERAGE TICKET PRICE 
select avg(ticket_price) as avg_ticket_price from bookings;

-- FIND THE TOTAL NUMBER OF BOOKINGS
select count(*) as total_booking from bookings;

-- JOINS QUESTION 

-- DISPLAY PASSENGERS NAMESS WITH THEIR BOOKING DEATAILS 
select
p.passenger_name,
b.booking_id,
b.travel_class,
b.ticket_price
from passengers p
join bookings b
on p.passenger_id=b.passenger_id;


-- DISPLAY FLIGHT NUMBER WITH AIRLINE AND TICKET PRICE
select
f.flight_number,
f.airline,
b.ticket_price
from flights f
join bookings b
on f.flight_id=b.flight_id ;

-- DISPLAY PASSENGER NAME WITH FIGHT NUMBER
SELECT
    p.passenger_name,
    f.flight_number,
    f.airline
FROM passengers p
JOIN bookings b
    ON p.passenger_id = b.passenger_id
JOIN flights f
    ON b.flight_id = f.flight_id;    
    

-- DISPLAY FLIGHTS NUMBER WITH SOURCE AND DESTINATION CITY
select 
f.flight_number,
a1.city as source_city,
a2.city as destination_city
from flights f
join airports a1
on f.source_airport_id=a1.airport_id
join airports a2 
on f.destination_airport_id=a2.airport_id;     


-- DISPLAY PASSENGER FLIGHTS AND PAYMENTS INFORMATION
SELECT
    p.passenger_name,
    f.flight_number,
    f.airline,
    pay.payment_method,
    pay.amount,
    pay.payment_status
FROM passengers p
JOIN bookings b
    ON p.passenger_id = b.passenger_id
JOIN flights f
    ON b.flight_id = f.flight_id
JOIN payments pay
    ON b.booking_id = pay.booking_id; 


-- SUB QUERY

-- FIND THE PASSENGER WHOSE AGE IS GREATER THAN THE AVERAGE PASSEGER AGE 
select passenger_name,age from passengers where age>(select avg(age) from passengers);  

-- FIND BOOKING WHOSE TICKET PRICE IS GREATER THAN THE AVERGE TICKET PRICE
select booking_id,ticket_price from bookings where ticket_price>(select avg(ticket_price) from bookings); 

-- FIND BOOKINGS HAVING THE HIGHEST TICKET PRICE
select * from bookings where ticket_price=(select max(ticket_price) from bookings);

select * from passengers;

-- FIND PASSENGERS WHO HAVE MADE AT LEAST ONE BOOKINGS
select passenger_name  from passengers
where passenger_id in(select passenger_id from bookings);

