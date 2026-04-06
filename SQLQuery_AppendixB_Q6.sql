--Question 6

/*
1. We first identify the household address ( residential unit here) that purchase more than 3 times in same month, make it a temporary view table, R2. 
2. After that, we filter out the tuple that fulfill this condition, which mean the selected tuple in R2 .
3. Then we only select the VRN and owner names attributes.
( Output will be : VRN004 JACK, VRN007 JACK. 2 TUPLE)
*/

WITH R2 AS  
(SELECT O.postal_code, O.unit_number, FORMAT(T.date_time, 'yyyy-MM') as month_key
FROM R_Transaction_SeasonPass_1 T 
JOIN Vehicle1 V ON T.VRN = V.VRN 
JOIN Owner O ON O.NRIC = V.NRIC 
GROUP BY O.postal_code, O.unit_number, FORMAT(T.date_time, 'yyyy-MM') 
HAVING COUNT(*) > 3 )  
SELECT DISTINCT O.name, T.VRN, O.postal_code, B.hdb_block_number,B.street_name, O.unit_number 
FROM R_Transaction_SeasonPass_1 T 
JOIN Vehicle1 V ON T.VRN = V.VRN 
JOIN Owner O ON O.NRIC = V.NRIC 
JOIN BlockAddress B ON B.postal_code = O.postal_code 
JOIN R2 
    ON R2.postal_code = O.postal_code 
    AND R2.unit_number = O.unit_number
    AND R2.month_key = FORMAT(T.date_time, 'yyyy-MM');

-- This will print the full adress of the person, if adress no need print out, just delete the relevant selected attributes and no need join the hdb adress.
