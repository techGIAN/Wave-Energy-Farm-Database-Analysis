
query = '-- It is also important to be skeptical with the dataset you get and not to believe that it is clean, null-free, and free of errors.\n\
-- Let us filter out data records that are noisy. Display only the results whose Total_Power value is close to the sum of all Power\'s\n\
-- in each configuration. By close, we can set a threshold to have an absolute difference of 5. So only show all configurations whose\n\
-- Total_Power is 5 off the sum of all Power\'s. Display results in any order.\n\n'

query += 'SELECT Wave.w_id, Wave.Total_Power - (Wave.Power1'

for i in range(2, 50):
    query += f' + Wave.Power{i}'

query += ') AS Difference\n'
query += 'FROM Wave\n'
query += 'WHERE Wave.Difference < 5\n'

query += 'LIMIT 10\n'
query += ';'

f = open('queries/q3.sql', 'w')
f.write(query)
f.close()