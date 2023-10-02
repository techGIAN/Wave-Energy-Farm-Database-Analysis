-- Perform a statistical analysis on qW. Query the following statstics for the variable as follows:
-- Return a 2-column table with the first being "statistic" and the next being "value" (fomat to two decimals)
-- Report the mean, median, mode, min and max of qW

SELECT statistic, FORMAT(value, 2) AS 'value'
FROM (
    SELECT 'mean' AS statistic, MeanTable.mean AS 'value'
    FROM (
        SELECT AVG(Wave.qW) AS mean, MIN(Wave.qW) AS min, MAX(Wave.qW) AS max
        FROM Wave
    ) AS MeanTable
    UNION ALL
    SELECT 'min' AS statistic, MinTable.mean AS 'value'
    FROM (
        SELECT AVG(Wave.qW) AS mean, MIN(Wave.qW) AS min, MAX(Wave.qW) AS max
        FROM Wave
    ) AS MinTable
    UNION ALL
    SELECT 'max' AS statistic, MaxTable.mean AS 'value'
    FROM (
        SELECT AVG(Wave.qW) AS mean, MIN(Wave.qW) AS min, MAX(Wave.qW) AS max
        FROM Wave
    ) AS MaxTable
    UNION ALL
    SELECT 'mode' AS statistic, ModeTable.qW AS 'value'
    FROM (
        SELECT CountTable.qW, CountTable.count
        FROM (
            SELECT Wave.qW, COUNT(Wave.qW) AS count
            FROM Wave
            GROUP BY Wave.qW
        ) AS CountTable
        INNER JOIN (
            SELECT MAX(ModeTable.count) AS max
            FROM (
                SELECT Wave.qW, COUNT(Wave.qW) AS count
                FROM Wave
                GROUP BY Wave.qW
            ) AS ModeTable
        ) AS MaxTable
        ON CountTable.count = MaxTable.max
    ) AS ModeTable
    UNION ALL
    SELECT 'median' AS statistic, median AS 'value'
    FROM (
        SELECT AVG(dd.qW) as median
        FROM (
        SELECT Wave.qW, @rownum:=@rownum+1 as `row_number`, @total_rows:=@rownum
        FROM Wave, (SELECT @rownum:=0) r
        WHERE Wave.qW is NOT NULL
        ORDER BY Wave.qW
        ) as dd
        WHERE dd.row_number IN ( FLOOR((@total_rows+1)/2), FLOOR((@total_rows+2)/2) )
    ) AS MedianTable
) AS T;