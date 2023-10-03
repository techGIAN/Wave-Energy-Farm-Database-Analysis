
-- Report anomalies in Y45
-- Define an anomaly in the configuration to be a value whose 3 previous values and 3 posterior values are all the same except itself

SELECT DISTINCT OffsetTable.Y45 AS anomalies
FROM (
    SELECT
        T.w_id,
        T.Y45,
        T.difference,
        LAG(T.difference) OVER w AS Lag1,
        LAG(T.difference, 2) OVER w  AS Lag2,
        LEAD(T.difference) OVER w  AS Lead1,
        LEAD(T.difference, 2) OVER w  AS Lead2,
        LEAD(T.difference, 3) OVER w AS Lead3
    FROM (
        SELECT
            Y45_Table_T1.w_id,
            Y45_Table_T1.Y45,
            ABS(Y45_Table_T1.Y45 - COALESCE(Y45_Table_T2.Y45, Y45_Table_T1.Y45)) AS difference
        FROM (
            SELECT Wave.w_id, Wave.Y45
            FROM Wave
        ) AS Y45_Table_T1
        LEFT JOIN (
            SELECT Wave.w_id, Wave.Y45
            FROM Wave
        ) AS Y45_Table_T2
            ON Y45_Table_T1.w_id = Y45_Table_T2.w_id + 1
        ORDER BY Y45_Table_T1.w_id
    ) AS T
    WINDOW w AS (ORDER BY T.w_id)
) AS OffsetTable
WHERE OffsetTable.Lag1 = 0
    AND OffsetTable.Lag2 = 0
    AND OffsetTable.difference = OffsetTable.Lead1
    AND OffsetTable.Lead2 = 0
    AND OffsetTable.Lead3 = 0;