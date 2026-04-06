--Question 5 Simulation

--Initial status of R_Transaction_SeasonPass_1
SELECT *
FROM R_Transaction_SeasonPass_1;

--Begin Simulation
--Non-resident trying to buy limited season pass at HDB010
INSERT INTO R_Transaction_SeasonPass_1 
(UTR, date_time, amount_paid, expiry_date, VRN, UID, carpark_ID)
VALUES 
('UTR505','2025-05-01',100.00,'2025-06-01','VRN008','UID1505','HDB010');

--Resident trying to buy limited season pass
INSERT INTO R_Transaction_SeasonPass_1 
(UTR, date_time, amount_paid, expiry_date, VRN, UID, carpark_ID)
VALUES 
('UTR506','2025-05-01',100.00,'2025-06-01','VRN023','UID1506','HDB010');

--Non-resident trying to buy normal season pass (non-limited) at HDB005
INSERT INTO R_Transaction_SeasonPass_1 
(UTR, date_time, amount_paid, expiry_date, VRN, UID, carpark_ID)
VALUES 
('UTR507','2025-05-01',100.00,'2025-06-01','VRN008','UID1507','HDB005');

--Resident trying to buy pass when there is none left
INSERT INTO R_Transaction_SeasonPass_1 
(UTR, date_time, amount_paid, expiry_date, VRN, UID, carpark_ID)
VALUES 
('UTR508','2025-05-01',100.00,'2025-06-01','VRN025','UID1508','HDB010');

--Confirm status of R_Transaction_SeasonPass_1
SELECT *
FROM R_Transaction_SeasonPass_1;