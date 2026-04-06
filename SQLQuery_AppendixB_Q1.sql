--Question 1

WITH Vehicle AS
(SELECT t.vehicle_type, v.VRN
FROM VehicleModel t
JOIN Vehicle1 v
ON t.model = v.model)
SELECT c.ID, v.vehicle_type, COUNT(p.VRN) AS number
FROM MSCP c 
JOIN ParkingRecord p
ON c.ID = p.carpark_ID
AND DATEPART(WEEKDAY, p.entry_datetime) NOT IN (5,6)
AND DATEDIFF (hour, p.exit_datetime, p.entry_datetime) < 1
JOIN Vehicle v
ON v.VRN = p.VRN
GROUP BY c.ID, v.vehicle_type;



