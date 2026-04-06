--Question 2

--Season Parking
SELECT carpark_ID, sum(amount_paid) as total_season_paid 
FROM r_transaction_seasonpass_1 
GROUP BY carpark_ID;
--Short term parking 
SELECT n.carpark_ID, round(sum(t.total_amount_paid),2) as short_term_total
FROM parkingrecord as n
JOIN tx_shorttermparking as t
ON n.UID = t.UID 
GROUP BY n.carpark_ID;
--Display both revenues in one result table
WITH season AS (
    SELECT carpark_ID, SUM(amount_paid) AS total_season_paid
    FROM r_transaction_seasonpass_1
    GROUP BY carpark_ID
),
short_term AS (
    SELECT n.carpark_ID, ROUND(SUM(t.total_amount_paid), 2) AS short_term_total
    FROM parkingrecord AS n
    JOIN tx_shorttermparking AS t ON n.UID = t.UID
    GROUP BY n.carpark_ID
)
SELECT 
    N.ID,
    COALESCE(s.total_season_paid, 0) AS total_season_paid,
    COALESCE(st.short_term_total, 0) AS short_term_total
FROM NormalCarpark AS N
LEFT OUTER JOIN season AS s ON N.ID = s.carpark_ID
LEFT OUTER JOIN short_term AS st ON N.ID = st.carpark_ID;


