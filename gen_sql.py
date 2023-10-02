# Generate SQL queries for X1 to X49 and Y1 to Y49

query = '-- Data preprocessing is an important step. We want to know how many of the configurations have duplicates. Unique pairs (X_i, Y_i)  \n' 
query += '-- for i are not considered duplicates and should not be included in the output. The count here does not refer to the number of instances \n'
query += '-- of each pair (X_i, Y_i) for i but rather the number of additional instances of such. Report the results in any order. \n\n' 

query += 'SELECT Waves.X, Waves.Y\n'
query += 'FROM (\n'
query += f'\tSELECT Wave.X1 AS X, Wave.Y1 AS Y, COUNT(*)-1 AS count\n'
query += '\tFROM Wave\n'
query += f'\tGROUP BY Wave.X1, Wave.Y1\n\n'

for i in range(2, 50):

    query += '\tUNION ALL\n\n'
    query += f'\tSELECT Wave.X{i} AS X, Wave.Y{i} AS Y, COUNT(*)-1 AS count\n'
    query += '\tFROM Wave\n'
    query += f'\tGROUP BY Wave.X{i}, Wave.Y{i}\n\n'
    
query += ') AS Waves\n'
query += 'WHERE Waves.count > 0\n'
query += '\nLIMIT 10\n'
query += ';'

f = open('queries/q2.sql', 'w')
f.write(query)
f.close()