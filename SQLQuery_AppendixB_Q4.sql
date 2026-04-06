--Question 4

SELECT w.name,x.VRN,count(*) AS offence_count, SUM(z.action_fine) as total_fine
FROM Vehicle1 x, Offence y, Rules z, Owner w, BlockAddress k 
WHERE x.VRN = y.VRN 
AND y.rule_no = z.rule_no
AND w.NRIC = x.NRIC 
AND w.postal_code = k.postal_code 
AND y.carpark_identification_number <> k.carpark_id 
GROUP BY w.name, x.VRN;
