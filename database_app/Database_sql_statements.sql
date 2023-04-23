#SQL STATEMENTS

#1 finds train stations that are not ADA complient
SELECT *
FROM train_station
WHERE train_station.ada = FALSE;

#2 gives the operators information displayed as last, first, gender
SELECT last_name, first_name, gender
FROM operator;

#3 gives operators that operate trains
SELECT DISTINCT operator.*
FROM operator
INNER JOIN train ON operator.operator_id = train.operator_id;

#4 this finds the number of buses that stop at each bus stop
SELECT stop_name, COUNT(*) AS num_buses
FROM bus_stop
JOIN bus ON bus.stop_id = bus_stop.stop_id
GROUP BY stop_name;


#5 gives operators that have been working since before 2012
SELECT *
FROM operator
WHERE hire_date < '1997-01-01';

#6 gives bus number and its route
SELECT bus.bus_id, bus_schedule.route
FROM bus
INNER JOIN bus_schedule ON bus.bus_schedule_id = bus_schedule.bus_schedule_id;

#7 gives trains and their routes
SELECT train.train_id, train_schedule.route
FROM train
INNER JOIN train_schedule ON train.train_schedule_id = train_schedule.train_schedule_id;

#8 gives all the stations that service the red line
SELECT *
FROM train_station ts
INNER JOIN line l ON ts.line_id = l.line_id
WHERE l.red = TRUE;

#9 this finds all buses operated by operators with a last name starting with "S"
SELECT b.*, o.first_name, o.last_name
FROM bus b
JOIN operator o ON b.operator_id = o.operator_id
WHERE o.last_name LIKE 'S%';

#10 this finds all train stations on the green line that are ADA accessible
SELECT *
FROM train_station
WHERE line_id = 1 AND ada = TRUE;

#11 this gives you the tenure of each operator
SELECT operator_id, first_name, last_name, gender,
CASE WHEN hire_date > DATE_SUB(CURRENT_DATE(), INTERVAL 20 YEAR)
THEN 'Less than 20 year'
WHEN hire_date > DATE_SUB(CURRENT_DATE(), INTERVAL 25 YEAR)
THEN '20-25 years' ELSE 'More than 25 years' END AS tenure
FROM operator
ORDER BY tenure;


#12 gives a ranking of train lines with the most trains scheduled for it
SELECT line_color, train_count, RANK() OVER (ORDER BY train_count DESC) AS count_rank
FROM (
SELECT t.line_color, COUNT(t.train_id) AS train_count
FROM train t
GROUP BY t.line_color
) sub;