--Question 5 Trigger Initialization

--Create Trigger for Simulation
CREATE TRIGGER BuySimulation
ON R_Transaction_SeasonPass_1
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE 
            (CAST(
                (SELECT COUNT(*) 
                 FROM R_Transaction_SeasonPass_1 r
                 WHERE r.carpark_ID = i.carpark_ID)
                AS FLOAT
            ) / 
            (SELECT SUM(number_of_lots)
            FROM ParkingLots
            WHERE ID = i.carpark_ID AND color = 'Red') >= 0.9)
            AND
            ((SELECT b.carpark_id
             FROM Vehicle1 v
             JOIN Owner o ON v.NRIC = o.NRIC
             JOIN BlockAddress b ON o.postal_code = b.postal_code
             WHERE v.VRN = i.VRN) <> i.carpark_ID)
    )
    BEGIN
        RAISERROR ('Purchase denied: 90%% red lots filled and buyer not resident.', 16, 1);
        RETURN;
    END;

    IF EXISTS (
    SELECT 1
    FROM inserted i
    WHERE 
        (CAST(
            (SELECT COUNT(*) 
                FROM R_Transaction_SeasonPass_1 r
                WHERE r.carpark_ID = i.carpark_ID)
            AS FLOAT
        ) / 
        (SELECT SUM(number_of_lots)
        FROM ParkingLots
        WHERE ID = i.carpark_ID AND color = 'Red') >= 1)
     )
    BEGIN
        RAISERROR ('Purchase denied: All pass has been sold', 16, 1);
        RETURN;
    END;

    INSERT INTO R_Transaction_SeasonPass_1 (UTR, date_time, amount_paid, expiry_date, VRN, UID, carpark_ID)
    SELECT UTR, date_time, amount_paid, expiry_date, VRN, UID, carpark_ID
    FROM inserted;
    PRINT 'Purchase Successful!';
END;
