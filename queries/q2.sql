-- Data preprocessing is an important step. We want to know how many of the configurations have duplicates. Unique pairs (X_i, Y_i)  
-- for i are not considered duplicates and should not be included in the output. The count here does not refer to the number of instances 
-- of each pair (X_i, Y_i) for i but rather the number of additional instances of such. Report the results in any order. 

SELECT Waves.X, Waves.Y
FROM (
	SELECT Wave.X1 AS X, Wave.Y1 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X1, Wave.Y1

	UNION ALL

	SELECT Wave.X2 AS X, Wave.Y2 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X2, Wave.Y2

	UNION ALL

	SELECT Wave.X3 AS X, Wave.Y3 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X3, Wave.Y3

	UNION ALL

	SELECT Wave.X4 AS X, Wave.Y4 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X4, Wave.Y4

	UNION ALL

	SELECT Wave.X5 AS X, Wave.Y5 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X5, Wave.Y5

	UNION ALL

	SELECT Wave.X6 AS X, Wave.Y6 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X6, Wave.Y6

	UNION ALL

	SELECT Wave.X7 AS X, Wave.Y7 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X7, Wave.Y7

	UNION ALL

	SELECT Wave.X8 AS X, Wave.Y8 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X8, Wave.Y8

	UNION ALL

	SELECT Wave.X9 AS X, Wave.Y9 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X9, Wave.Y9

	UNION ALL

	SELECT Wave.X10 AS X, Wave.Y10 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X10, Wave.Y10

	UNION ALL

	SELECT Wave.X11 AS X, Wave.Y11 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X11, Wave.Y11

	UNION ALL

	SELECT Wave.X12 AS X, Wave.Y12 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X12, Wave.Y12

	UNION ALL

	SELECT Wave.X13 AS X, Wave.Y13 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X13, Wave.Y13

	UNION ALL

	SELECT Wave.X14 AS X, Wave.Y14 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X14, Wave.Y14

	UNION ALL

	SELECT Wave.X15 AS X, Wave.Y15 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X15, Wave.Y15

	UNION ALL

	SELECT Wave.X16 AS X, Wave.Y16 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X16, Wave.Y16

	UNION ALL

	SELECT Wave.X17 AS X, Wave.Y17 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X17, Wave.Y17

	UNION ALL

	SELECT Wave.X18 AS X, Wave.Y18 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X18, Wave.Y18

	UNION ALL

	SELECT Wave.X19 AS X, Wave.Y19 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X19, Wave.Y19

	UNION ALL

	SELECT Wave.X20 AS X, Wave.Y20 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X20, Wave.Y20

	UNION ALL

	SELECT Wave.X21 AS X, Wave.Y21 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X21, Wave.Y21

	UNION ALL

	SELECT Wave.X22 AS X, Wave.Y22 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X22, Wave.Y22

	UNION ALL

	SELECT Wave.X23 AS X, Wave.Y23 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X23, Wave.Y23

	UNION ALL

	SELECT Wave.X24 AS X, Wave.Y24 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X24, Wave.Y24

	UNION ALL

	SELECT Wave.X25 AS X, Wave.Y25 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X25, Wave.Y25

	UNION ALL

	SELECT Wave.X26 AS X, Wave.Y26 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X26, Wave.Y26

	UNION ALL

	SELECT Wave.X27 AS X, Wave.Y27 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X27, Wave.Y27

	UNION ALL

	SELECT Wave.X28 AS X, Wave.Y28 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X28, Wave.Y28

	UNION ALL

	SELECT Wave.X29 AS X, Wave.Y29 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X29, Wave.Y29

	UNION ALL

	SELECT Wave.X30 AS X, Wave.Y30 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X30, Wave.Y30

	UNION ALL

	SELECT Wave.X31 AS X, Wave.Y31 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X31, Wave.Y31

	UNION ALL

	SELECT Wave.X32 AS X, Wave.Y32 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X32, Wave.Y32

	UNION ALL

	SELECT Wave.X33 AS X, Wave.Y33 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X33, Wave.Y33

	UNION ALL

	SELECT Wave.X34 AS X, Wave.Y34 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X34, Wave.Y34

	UNION ALL

	SELECT Wave.X35 AS X, Wave.Y35 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X35, Wave.Y35

	UNION ALL

	SELECT Wave.X36 AS X, Wave.Y36 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X36, Wave.Y36

	UNION ALL

	SELECT Wave.X37 AS X, Wave.Y37 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X37, Wave.Y37

	UNION ALL

	SELECT Wave.X38 AS X, Wave.Y38 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X38, Wave.Y38

	UNION ALL

	SELECT Wave.X39 AS X, Wave.Y39 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X39, Wave.Y39

	UNION ALL

	SELECT Wave.X40 AS X, Wave.Y40 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X40, Wave.Y40

	UNION ALL

	SELECT Wave.X41 AS X, Wave.Y41 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X41, Wave.Y41

	UNION ALL

	SELECT Wave.X42 AS X, Wave.Y42 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X42, Wave.Y42

	UNION ALL

	SELECT Wave.X43 AS X, Wave.Y43 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X43, Wave.Y43

	UNION ALL

	SELECT Wave.X44 AS X, Wave.Y44 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X44, Wave.Y44

	UNION ALL

	SELECT Wave.X45 AS X, Wave.Y45 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X45, Wave.Y45

	UNION ALL

	SELECT Wave.X46 AS X, Wave.Y46 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X46, Wave.Y46

	UNION ALL

	SELECT Wave.X47 AS X, Wave.Y47 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X47, Wave.Y47

	UNION ALL

	SELECT Wave.X48 AS X, Wave.Y48 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X48, Wave.Y48

	UNION ALL

	SELECT Wave.X49 AS X, Wave.Y49 AS Y, COUNT(*)-1 AS count
	FROM Wave
	GROUP BY Wave.X49, Wave.Y49

) AS Waves
WHERE Waves.count > 0

LIMIT 10
;