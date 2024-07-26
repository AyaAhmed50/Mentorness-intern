select * from hotel_reservation_dataset;

select count(*) as total_reservation from hotel_reservation_dataset;

select type_of_meal_plan, count(Booking_ID) As Orders from hotel_reservation_dataset 
Group by type_of_meal_plan order by Count(Booking_ID) DEsc limit 1;

select room_type_reserved, (avg_price_per_room) as AveragePrice_with_Childs 
from hotel_reservation_dataset where hotel_reservation_dataset.no_of_children>0
group by room_type_reserved;

select count(*) as reservation_2017 from hotel_reservation_dataset 
where arrival_date Like '%-2017';
SELECT COUNT(*) AS reservation_count
FROM hotel_reservation_dataset
WHERE YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2017;
-- select count(*) as reservation_2017 from hotel_reservation_dataset
-- where arrival_date between '01-01-2017' and '31-12-2017';

select room_type_reserved, Count(Booking_ID) as total_reservation 
from hotel_reservation_dataset
group by room_type_reserved 
order by total_reservation desc limit 1;

select Count(*) as weekend_reservations from hotel_reservation_dataset
where no_of_weekend_nights > 0;

select min(lead_time) as lowest_lead_time, max(lead_time) as highest_lead_time
from hotel_reservation_dataset;

select market_segment_type, Count(*) as reservations from hotel_reservation_dataset
group by market_segment_type
order by reservations desc limit 1;

select count(*) as confirmed_reservations
from hotel_reservation_dataset
where booking_status = 'Not_Canceled';
select booking_status, count(*) as reservations
from hotel_reservation_dataset
group by booking_status;

select sum(no_of_adults) as adults,sum(no_of_children) as children
from hotel_reservation_dataset;

select avg(no_of_weekend_nights) as weekend_with_children from hotel_reservation_dataset
where no_of_children > 0;

SELECT MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS month, COUNT(*) AS reservation_count
FROM hotel_reservation_dataset
WHERE YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2017
GROUP BY MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y'))
ORDER BY month ;

SELECT 
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 1) AS January,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2) AS February,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 3) AS March,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 4) AS April,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 5) AS May,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 6) AS June,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 7) AS July,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 8) AS August,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 9) AS September,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 10) AS October,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 11) AS November,
SUM(MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 12) AS December
FROM hotel_reservation_dataset
WHERE YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2017;

select room_type_reserved, avg(no_of_week_nights) as weekdays, 
avg(no_of_weekend_nights) as weekends
from hotel_reservation_dataset
group by room_type_reserved;

select room_type_reserved, Count(*) as total_reservations , 
avg(avg_price_per_room) as average_price
from hotel_reservation_dataset
group by room_type_reserved
order by total_reservations desc limit 1;

select market_segment_type, max(avg_price_per_room) as avg_room_price 
from hotel_reservation_dataset
group by market_segment_type
order by avg_room_price desc limit 1;

select market_segment_type, max(avg_price_per_room) as avg_room_price  from hotel_reservation_dataset 
where avg_price_per_room = (select max(avg_price_per_room) from hotel_reservation_dataset);
