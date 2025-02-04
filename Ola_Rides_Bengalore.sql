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

-- #7. Find the highest-rated driver
SELECT `Driver Ratings`, COUNT(*) AS Rating_Count
FROM Bengaluru_Booking_Data
WHERE `Driver Ratings` IS NOT NULL
GROUP BY `Driver Ratings`
ORDER BY `Driver Ratings` DESC
LIMIT 10;


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


-- #11. To find the day with the most rides
SELECT Date, COUNT(*) AS Ride_Count
FROM Bengaluru_Booking_Data
GROUP BY Date
ORDER BY Ride_Count DESC
LIMIT 10;

-- #12.Find the most popular pickup location
SELECT `Pickup Location`, COUNT(*) AS Ride_Count
FROM Bengaluru_Booking_Data
GROUP BY `Pickup Location`
ORDER BY Ride_Count DESC
LIMIT 10;

-- #13.Find the most common drop location
SELECT `Drop Location`, COUNT(*) AS Ride_Count
FROM Bengaluru_Booking_Data
GROUP BY `Drop Location`
ORDER BY Ride_Count DESC
LIMIT 10;

-- #14.Find the most frequently booked vehicle type
SELECT `Vehicle Type`, COUNT(*) AS Ride_Count
FROM Bengaluru_Booking_Data
GROUP BY `Vehicle Type`
ORDER BY Ride_Count DESC
LIMIT 10;

-- #15.Find the busiest hour of the day for bookings
SELECT `Time` AS `Booking Hour`, COUNT(*) AS Ride_Count
FROM Bengaluru_Booking_Data
GROUP BY `Booking Hour`
ORDER BY Ride_Count DESC
LIMIT 10;

-- #16.Find the average driver and customer ratings for successful rides
SELECT 
    AVG(`Driver Ratings`) AS Avg_Driver_Rating, 
    AVG(`Customer Rating`) AS Avg_Customer_Rating
FROM Bengaluru_Booking_Data
WHERE `Booking Status` = 'Success';









