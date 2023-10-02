-- It is also important to be skeptical with the dataset you get and not to believe that it is clean, null-free, and free of errors.
-- Let us filter out data records that are noisy. Display only the results whose Total_Power value is close to the sum of all Power's
-- in each configuration. By close, we can set a threshold to have an absolute difference of 5. So only show all configurations whose
-- Total_Power is 5 off the sum of all Power's. Display results in any order.

SELECT WaveTable.w_id, WaveTable.Difference
FROM (SELECT Wave.w_id, Wave.Total_Power - (Wave.Power1 + Wave.Power2 + Wave.Power3 + Wave.Power4 + Wave.Power5 + Wave.Power6 + Wave.Power7 + Wave.Power8 + Wave.Power9 + Wave.Power10 + Wave.Power11 + Wave.Power12 + Wave.Power13 + Wave.Power14 + Wave.Power15 + Wave.Power16 + Wave.Power17 + Wave.Power18 + Wave.Power19 + Wave.Power20 + Wave.Power21 + Wave.Power22 + Wave.Power23 + Wave.Power24 + Wave.Power25 + Wave.Power26 + Wave.Power27 + Wave.Power28 + Wave.Power29 + Wave.Power30 + Wave.Power31 + Wave.Power32 + Wave.Power33 + Wave.Power34 + Wave.Power35 + Wave.Power36 + Wave.Power37 + Wave.Power38 + Wave.Power39 + Wave.Power40 + Wave.Power41 + Wave.Power42 + Wave.Power43 + Wave.Power44 + Wave.Power45 + Wave.Power46 + Wave.Power47 + Wave.Power48 + Wave.Power49) AS Difference
FROM Wave
) AS WaveTable
WHERE ABS(WaveTable.Difference) < 5
LIMIT 10
;