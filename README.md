# Wave-Energy-Farm-Database-Analysis
An SQL analysis of large-scale wave energy farm data for statistical analyses, data preprocessing, and anomaly detection

## Dataset Description

(*Data source and description are taken from:* [https://archive.ics.uci.edu/dataset/882/large-scale+wave+energy+farm](https://archive.ics.uci.edu/dataset/882/large-scale+wave+energy+farm))

Wave energy is a rapidly advancing and promising renewable energy source that holds great potential for addressing the challenges of global warming and climate change. However, optimizing energy output in large wave farms presents a complex problem due to the expensive calculations required to account for hydrodynamic interactions between wave energy converters (WECs). Developing a fast and accurate surrogate model is crucial to overcome these challenges. In light of this, we have compiled an extensive WEC dataset that includes ```54,000``` and ```9,600``` configurations involving ```49``` and ```100``` ```WEC```s, ```coordination```, ```power```, ```q-factor```, and ```total_farm_power_output```. The dataset was derived from a study published at the GECCO conference and received the prestigious Best Paper award. We want to acknowledge the support of the University of Adelaide Phoenix HPC service in conducting this research. For more details, please refer to the following link: [https://dl.acm.org/doi/abs/10.1145/3377930.3390235](https://dl.acm.org/doi/abs/10.1145/3377930.3390235).

Each record (or row instance) is a *configuration*. And there are a total of 149 variables. Each pair of ```(X_i, Y_i)``` is an independent variable to the ```Power_i``` dependent variable. The dataset is mostly used for regression task (predicting the ```Power``` and ```Total_Power```). 

The ```Total_Power``` is believed to be the sum of all predicted ```Power```'s, but it may not necessarily be true; so we have to analyze the dataset carefully and we can use ```SQL``` to do so (here, I use ```MySQL```). There is also a ```q```-factor or ```qW``` and is also believed to be one of the predictors for the ```Total_Power```.

## Problem

Here we attempt to conduct some analyses and experiments based on the datasets. Here, we focus only on the ```Sydney``` dataset with ```49``` wave energy converters. It is still possible to conduct the analysis on the other datasets (e.g., ```Perth``` data, ```100 WECs```, etc.). The ```Perth``` data contains twice as much more or less row instances than ```Sydney```'s (too much for my local database), but the ```100 WEC``` dataset seems to have way too little. So that's why I used the ```Sydney``` dataset with ```49 WEC```, with about ```17,964``` records.

While the dataset is primarily used for regression-based downstream tasks, we can still use it for analysis on the following analytical tasks and we will use SQL for it:
* Statistical analysis
* Data preprocessing
* Anomaly or outlier detection

## Usage

Note that there are ```.py``` files within this repository but are mainly used for ease in typing ```MySQL``` scripts. First run the following command to data preprocess the dataset. Note that this is only simple data_preprocess (adding ```w_id``` the wave id's), and we do the heavy lifting within ```MySQL```:
```
python data_preprocess.py
```

Next launch ```MySQL``` server and input your login credentials. 
```
/usr/local/mysql/bin/mysql -u root -p --local-infile -s --table
```
where ```-u``` refers to the username, ```-p``` for password, ```--local-infile``` allows for reading files locally, ```-s``` is for silencing messages such as ```Query ok, X rows affected (0.00 sec)```, and ```--table``` allows to display query results pretty-printed as a table. Note that the last flag is important as ```-s``` will disable pretty-printing, so it is important that we combine it with ```--table``` to retain table display while suppressing the unnecessary messages.

Now run the schema. This step can be skipped if you have already loaded the ```.csv``` data onto the database:
```
source schema.sql
```

Now only run this command if you skipped the above step; otherwise, you can skip this step:
```
USE database_name; 
```

Now run the queries:
```
source queries/q1.sql
source queries/q2.sql
source queries/q3.sql
source queries/q4.sql
```

## Queries
Here are the queries we run to perform our analyses. I also display the first 10 rows of the result.

1. Perform a statistical analysis on ```qW```. Query the following statstics for the variable as follows:
```
+-----------+-------+
| statistic | value |
+-----------+-------+
| mean      | 0.78  |
| min       | 0.78  |
| max       | 0.78  |
| mode      | 0.79  |
| median    | 0.78  |
+-----------+-------+
```
2. Data preprocessing is an important step. We want to know how many of the configurations have duplicates. Unique pairs ```(X_i, Y_i)``` for ```i``` are not considered *duplicates* and should not be included in the output. The ```count``` here does not refer to the number of instances of each pair ```(X_i, Y_i)``` for ```i``` but rather the number of additional instances of such. Report the results in any order. Here are the first 10 results:
```
+------+------+
| X    | Y    |
+------+------+
|    1 |  400 |
|  598 |  400 |
|  198 |  400 |
|  598 |  600 |
|  198 |  200 |
|  198 |  401 |
|    1 |  300 |
|  398 |  600 |
|    1 |  601 |
|  198 |  600 |
+------+------+
```

3. It is also important to be skeptical with the dataset you get and not to believe that it is clean, null-free, and free of errors. Let us filter out data records that are *noisy*. Display only the results whose ```Total_Power``` value is *close* to the sum of all ```Power```'s in each configuration. By *close*, we can set a threshold to have an absolute difference of ```5```. So only show all configurations whose ```Total_Power``` is ```5``` off the sum of all ```Power```'s. Display results in any order.
```
+------+-------------+
| w_id | Difference  |
+------+-------------+
|    1 |  -0.1484375 |
|    2 |           0 |
|    3 |  0.07421875 |
|    4 |           0 |
|   10 |  0.09765625 |
|   12 |     -0.0625 |
|   13 | -0.03515625 |
|   14 |   0.1484375 |
|   16 |      0.0625 |
|   17 |    -0.09375 |
+------+-------------+
```

4. Conduct an anomaly detection experiment. Report all anomalies in the specific ```Y45``` of the dataset.  Consider an anomaly to be a value whose last three (at least) values prior to it in the WEC variable and first three values (at least) after to it in the WEC variable to be all the same except for itself which has significant difference according to some threshold. For simplicity, assume that any type of difference is considered *anomalous*. For example, consider the configuration at 589 (e.g., 589th row). The value is ```700``` and this is anomalous by this definition. The prior and posterior values (e.g., 586th to 588th, 590th to 592nd row instances) on the ```Y45``` have all ```800``` value. Return the anomly result data in any order. This can be applied to any kind of column in the dataset.
```
+-----------+
| anomalies |
+-----------+
|      1000 |
|    945.84 |
|     947.9 |
|    938.98 |
|       950 |
|    938.79 |
|    946.64 |
|    947.49 |
|    946.17 |
|       800 |
+-----------+
```

## Citations
> Neshat, Mehdi, Bradley Alexander, Nataliia Y. Sergiienko, and Markus Wagner. "Optimisation of large wave farms using a multi-strategy evolutionary framework." In Proceedings of the 2020 Genetic and Evolutionary Computation Conference, pp. 1150-1158. 2020. [https://dl.acm.org/doi/abs/10.1145/3377930.3390235](https://dl.acm.org/doi/abs/10.1145/3377930.3390235).

