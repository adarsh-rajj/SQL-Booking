CREATE TABLE Customer (
    CustomerId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Email VARCHAR(50),
    Phone VARCHAR(15),
    DateOfBirth DATE
);

CREATE TABLE Hotel (
    HotelId INT PRIMARY KEY IDENTITY(1,1),
    HotelName VARCHAR(50),
    Location VARCHAR(50),
    Rating INT
);

CREATE TABLE Booking (
    BookingId INT PRIMARY KEY IDENTITY(1,1),
    CustomerId INT FOREIGN KEY REFERENCES Customer(CustomerId),
    HotelId INT FOREIGN KEY REFERENCES Hotel(HotelId),
    BookingDate DATE,
    CheckInDate DATE,
    CheckOutDate DATE,
    TotalAmount DECIMAL(10,2)
);

INSERT INTO Customer (FirstName, LastName, Email, Phone, DateOfBirth) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '1985-05-15'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '1990-08-20'),
('Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012', '1975-02-25'),
('Robert', 'Brown', 'robert.brown@example.com', '456-789-0123', '1982-11-30'),
('Linda', 'Davis', 'linda.davis@example.com', '567-890-1234', '1978-07-13'),
('Michael', 'Wilson', 'michael.wilson@example.com', '678-901-2345', '1985-01-09'),
('Mary', 'Miller', 'mary.miller@example.com', '789-012-3456', '1993-03-19'),
('James', 'Taylor', 'james.taylor@example.com', '890-123-4567', '1988-05-22'),
('Patricia', 'Anderson', 'patricia.anderson@example.com', '901-234-5678', '1980-08-11'),
('David', 'Thomas', 'david.thomas@example.com', '012-345-6789', '1975-09-18'),
('Barbara', 'Jackson', 'barbara.jackson@example.com', '123-456-7891', '1965-04-05'),
('Charles', 'White', 'charles.white@example.com', '234-567-8902', '1992-11-12'),
('Susan', 'Harris', 'susan.harris@example.com', '345-678-9013', '1971-02-14'),
('Joseph', 'Martin', 'joseph.martin@example.com', '456-789-0124', '1989-06-30'),
('Margaret', 'Thompson', 'margaret.thompson@example.com', '567-890-1235', '1974-12-03');

INSERT INTO Hotel (HotelName, Location, Rating) VALUES
('The Grand Hotel', 'New York', 5),
('Sea View Resort', 'Miami', 4),
('Mountain Retreat', 'Denver', 3),
('City Center Hotel', 'Chicago', 4),
('Beachside Inn', 'Los Angeles', 5),
('Riverside Hotel', 'San Francisco', 4),
('Desert Oasis', 'Phoenix', 3),
('Urban Stay', 'Seattle', 4),
('Countryside Lodge', 'Austin', 3),
('Historic Hotel', 'Boston', 4),
('Lakeside Resort', 'Orlando', 5),
('Coastal Hotel', 'San Diego', 4),
('Downtown Suites', 'Dallas', 3),
('Highland Inn', 'Atlanta', 4),
('Metropolitan Hotel', 'Houston', 5);

INSERT INTO Booking (CustomerId, HotelId, BookingDate, CheckInDate, CheckOutDate, TotalAmount) VALUES
(1, 1, '2023-07-01', '2023-07-15', '2023-07-20', 1500.00),
(2, 2, '2023-06-10', '2023-06-15', '2023-06-18', 800.00),
(3, 3, '2023-05-05', '2023-05-10', '2023-05-15', 600.00),
(4, 4, '2023-04-01', '2023-04-05', '2023-04-10', 900.00),
(5, 5, '2023-03-10', '2023-03-15', '2023-03-20', 1200.00),
(6, 6, '2023-02-20', '2023-02-25', '2023-03-01', 1100.00),
(7, 7, '2023-01-15', '2023-01-20', '2023-01-25', 700.00),
(8, 8, '2022-12-10', '2022-12-15', '2022-12-20', 1300.00),
(9, 9, '2022-11-05', '2022-11-10', '2022-11-15', 600.00),
(10, 10, '2022-10-01', '2022-10-05', '2022-10-10', 800.00),
(11, 11, '2022-09-10', '2022-09-15', '2022-09-20', 1400.00),
(12, 12, '2022-08-05', '2022-08-10', '2022-08-15', 600.00),
(13, 13, '2022-07-01', '2022-07-05', '2022-07-10', 1000.00),
(14, 14, '2022-06-10', '2022-06-15', '2022-06-18', 900.00),
(15, 15, '2022-05-05', '2022-05-10', '2022-05-15', 1200.00),
(1, 2, '2022-04-01', '2022-04-05', '2022-04-10', 800.00),
(2, 3, '2022-03-10', '2022-03-15', '2022-03-20', 700.00),
(3, 4, '2022-02-20', '2022-02-25', '2022-03-01', 900.00),
(4, 5, '2022-01-15', '2022-01-20', '2022-01-25', 1200.00),
(5, 6, '2021-12-10', '2021-12-15', '2021-12-20', 1100.00),
(6, 7, '2021-11-05', '2021-11-10', '2021-11-15', 1300.00),
(7, 8, '2021-10-01', '2021-10-05', '2021-10-10', 1400.00),
(8, 9, '2021-09-10', '2021-09-15', '2021-09-20', 800.00),
(9, 10, '2021-08-05', '2021-08-10', '2021-08-15', 1000.00),
(10, 11, '2021-07-01', '2021-07-05', '2021-07-10', 600.00);


select * from Customer;
select * from Booking;
select * from Hotel;

--=================================================================================================================================================================================================

-- Question 1. Write a query to show all locations with the number of hotels.
select Location, count(*) as number_of_hotels
from Hotel 
group by Location

--==================================================================================================================================================================================================

-- Question 2. Write a query to list all customers who have booked at 'The Grand Hotel'.
select c.FirstName, c.LastName
from Customer c
join Booking b
on c.CustomerId = b.CustomerId
join Hotel h
on b.HotelId = h.HotelId
where h.HotelName = 'The Grand Hotel';

--==================================================================================================================================================================================================

-- Question 3. Write a query to list the customers who have made the highest total bookings by amount.
select top 1 c.FirstName, c.LastName, sum(b.TotalAmount) as Total_Amount
from Customer c
join Booking b
on c.CustomerId = b.CustomerId
group by c.FirstName, c.LastName
order by Total_Amount desc;

----------------------------------
with cte_Total_Amount as (
    select c.FirstName, c.LastName, sum(b.TotalAmount) as Total_Amount
	from Customer c
	join Booking b
	on c.CustomerId = b.CustomerId
	group by c.FirstName, c.LastName
), cte_Highest as (
	select FirstName, LastName, Total_Amount, DENSE_RANK() over (order by Total_Amount desc) as den_rank
	from cte_Total_Amount
)
select FirstName, LastName, Total_Amount
from cte_Highest
where den_rank = 1;

--==================================================================================================================================================================================================

-- Question 4. Write a query to list customers with the same first name and last name.
select FirstName, LastName 
from Customer
where FirstName = LastName;

INSERT INTO Customer VALUES ('Adarsh', 'Adarsh', 'john.doe@example.com', '123-456-7890', '1985-05-15');

--==================================================================================================================================================================================================

-- Question 5. Write a trigger to add a default rating of 3 when a new hotel is added without a rating.
create trigger AddDefaultRating
on Hotel
after insert
as
begin
    update h
    set Rating = 3
    from Hotel h
    join inserted i on h.HotelId = i.HotelId
    where h.Rating is null
end;

INSERT INTO Hotel (HotelName, Location, Rating) VALUES ('The Grand Start Hotel 1', 'India', 4 );

select * from Hotel;

--==================================================================================================================================================================================================

-- Question 6. Write a query to remove duplicates from a table (Create a new table with some data like - reservations) without using a temporary table.
create table reservations(
	res_id int not null,   
	Name varchar(20),
	Age int not null,
	Email varchar(30),
	ticket_price int
);

insert into reservations values (101, 'adarsh', 21, 'adarsh@gmail.com', 120);
insert into reservations values (102, 'sonu', 23, 'sonu@gmail.com', 200);
insert into reservations values (103, 'adarsh', 23, 'adarsh@gmail.com', 150);
insert into reservations values (104, 'shivam', 21, 'shivam@gmail.com', 220);
insert into reservations values (105, 'sukla', 20, 'sukla@gmail.com', 120);

select * from reservations;

with cte_Remove_duplicates_old_data as (
    select *, row_number() over (partition by Email order by res_id desc) as row_num
    from reservations
)
delete from cte_Remove_duplicates_old_data
where row_num > 1;

--==================================================================================================================================================================================================

-- Question 7. Write a cursor to send an email to each customer with their booking details.
create proc sp_SendEmail
    @CustomerEmail varchar(50),
	@BookingDate date,
    @Message varchar(50) 
as
begin
	print 'Email: ' + @CustomerEmail;
	print 'Booking Date is : ' + cast(@BookingDate as varchar(40));
    print 'Message: ' + @Message;
end;


declare @CustomerEmail varchar(50);
declare @BookingDate date;
declare CustomerCursor cursor for 
select c.Email, b.BookingDate from Customer c
join Booking b
on c.CustomerId = b.CustomerId

open CustomerCursor;
fetch next from CustomerCursor into @CustomerEmail, @BookingDate;

while @@FETCH_STATUS = 0
begin
    exec sp_SendEmail @CustomerEmail, @BookingDate, 'Your Booking are confirmed with all details...!';
    fetch next from CustomerCursor into @CustomerEmail, @BookingDate;
end;

close CustomerCursor;
deallocate CustomerCursor;

--==================================================================================================================================================================================================

-- Question 8. Write a single query to calculate the sum of negative and positive values from the table having values: 2, -1, 3, 2, -5, 9, -3, 18, -8, -11, 46, 12, 23, -14.
create table valueTable(
	value int
);

insert into valueTable (value)
values (2), (-1), (3), (2), (-5), (9), (-3), (18), (-8), (-11), (46), (12), (23), (-14);

select 
max(value) as Maximum_of_positive,
max(case when value < 0 then value end) as maximum_of_negative
from valueTable;

--==================================================================================================================================================================================================

-- Question 9. Write a parameterized stored procedure to insert a booking along with hotel and customer details and display an error message if the email already exists.
create procedure sp_insertBooking
    @FirstName varchar(25) = null,
    @LastName varchar(25) = null,
	@email varchar(25) = null,
    @hotel varchar(25) = null
as
begin
	set nocount on
	begin try
		 -- check if the email already exists
        if exists (select Email from Customer where Email = @email)
        begin
			print 'Email already exists'
            return;
		end
		else
			begin
				insert into Customer(FirstName, LastName, email) values (@FirstName, @LastName, @email)
				insert into Hotel(HotelName) values(@hotel)
			end
			print 'Booking inserted successfully'
	end try

	begin catch
		print 'Email already exists'
	end catch
end

exec sp_insertBooking @email = 'jack.doe@example.com', @hotel = 'hotel taj'

select * from Customer
select * from Hotel

--==================================================================================================================================================================================================

-- Question 10. Write a single query to concatenate all the customer names into the following single semicolon-separated string: John Doe; Jane Smith; Alice Johnson;...
select string_agg(FirstName + ' ' + LastName, '; ') as Concate_Name from Customer;

select concat(FirstName, ' ', LastName, ';') as FullName from Customer;