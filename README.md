# Wave-Energy-Farm-Database-Analysis
An SQL analysis of Wave Energy Farm data for statistical analyses, data preprocessing, and anomaly detection

## Dataset Information
This will be filled out soon, but the dataset can be obtained from https://archive.ics.uci.edu/dataset/882/large-scale+wave+energy+farm. Here, we focus only on Sydney dataset with 49 wave energy converters. It is still possible to conduct the analysis on the other datasets (e.g., Perth data, 100 WECs, etc.). The Perth data contains twice as much more or less row instances than Sydney's (too much for my local database), but the 100 WEC dataset seems to have way too little. So that's why I used the Sydney dataset with 49 WEC, with about 17,964 records.

Each record (or row instance) is a *configuration*. And there are a total of 149 variables. Each pair of ```(X_i, Y_i)``` is an independent variable to the ```Power_i``` dependent variable. The dataset is mostly used for regression task (predicting the ```Power``` and ```Total_Power```). But we can still use it for analysis on the following analytical tasks:
* Statistical analysis
* Data preprocessing
* Anomaly or outlier detection

The ```Total_Power``` is believed to be the sum of all predicted ```Power```'s, but it may not necessarily be true; so we have to analyze the dataset carefully and we can use ```SQL``` to do so (here, I use ```MySQL```). There is also a ```q```-factor or ```qW``` and is also believed to be one of the predictors for the ```Total_Power```.

## Queries
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

4. It is also important to be skeptical with the dataset you get and not to believe that it is clean, null-free, and free of errors. Let us filter out data records that are *noisy*. Display only the results whose ```Total_Power``` value is *close* to the sum of all ```Power```'s in each configuration. By *close*, we can set a threshold to have an absolute difference of ```5```. So only show all configurations whose ```Total_Power``` is ```5``` off the sum of all ```Power```'s. Display results in any order.
```
id, Diff
```

5. Conduct an anomaly detection experiment. Report all anomalies in the dataset. Use the ```(WEC, anomaly)``` schema to report all anomalies found. Consider an anomaly to be a value whose last three (at least) values prior to it in the WEC variable and first three values (at least) after to it in the WEC variable to be all the same except for itself (note that the WEC are the ```X_i```'s and ```Y_i```'s) which has significant difference according to some threshold. For simplicity, assume that any type of difference is considered *anomalous*. For example, consider the configuration at 589 (e.g., 589th row). In the ```Y45```, the value is ```700``` and this is anomalous by this definition. The prior and posterior values (e.g., 586th to 588th, 590th to 592nd row instances) on the ```Y45``` have all ```800``` value. Return the anomly result data in any order.
```
WEC, anomaly
```

