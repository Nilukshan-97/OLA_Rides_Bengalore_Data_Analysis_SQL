use ola_rides_bengalore;

select * from bengaluru_booking_data;

SHOW COLUMNS FROM bengaluru_booking_data;

SHOW CREATE VIEW Avg_Ride_Distance;
SELECT * FROM Avg_Ride_Distance;

-- #1.Retrieve all successful bookings
Create View Successful_Bookings As
SELECT * FROM bengaluru_booking_data 
WHERE `Booking Status` = 'Success' ;

-- #2.Find the average ride distance for each vehicle type
CREATE VIEW Avg_Ride_Distance As
select `Vehicle Type`, Avg(`Ride Distance`) as Average_Distance
FROM bengaluru_booking_data
group by `Vehicle Type`;

-- #3. Get the total number of cancelled rides by customers
Create view cancelled_rides_by_customers as
select count(*) 
from bengaluru_booking_data
where `Booking Status` = 'Cancelled' ;

-- #4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers_booking as 
select `customer id`, count(`booking id`)
from bengaluru_booking_data 
group by `customer id`
order by 'booking id ' desc limit 5;

-- #5. Get the number of rides cancelled by drivers due to personal and car-related issues
select count(*) 
from bengaluru_booking_data 
where `Reason for cancelling by Driver` = "Personal & car related issues";


-- #6. Find the maximum and minimum driver ratings for Prime Sedan bookings
SELECT MAX(`Driver Ratings`) as max_rating,
MIN(`Driver Ratings`) as min_rating
FROM bengaluru_booking_data WHERE `Vehicle Type` = 'Prime Sedan';


-- #8. Find the average customer rating per vehicle type
select `vehicle type`, avg(`customer rating`)
FROM bengaluru_booking_data
group by `vehicle type`;

-- #9. Calculate the total booking value of rides completed successfully
select sum(`booking value`) 
from bengaluru_booking_data
WHERE `Booking Status` = 'Success' ;

-- #10. List all incomplete rides along with the reason
SELECT `Booking ID`, `Incomplete Rides`,`Incomplete Rides Reason`
FROM bengaluru_booking_data
WHERE `Incomplete Rides` is not null;






















