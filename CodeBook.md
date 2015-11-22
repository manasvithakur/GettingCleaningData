——————————Variables———————————

x_test: contents for table X_test.txt
x_train: contents for table X_train.txt
x_test_train: rowbinds x_test and x_train

y_test = contents for table y_test.txt
y_train = contents for table y_train.txt
y_test_train = row binds the data in y_test and y_train

subject_test = contents for table subject_test.txt
subject_train = contents for table subject_train.txt
subject_test_train = row binds the data in subject_test and subject_train

total = column binds all the tables i.e. x_test_train,y_test_train and subject_test_train to achieve a complete data set.


features = contents of table features.txt
x = character vector of items in column two "V2" of the features data set.

mean_stdev = table that contains only measurements of mean and standard dev of each measurement.

activity_names = contents of the table activity_labels.txt
column names for this data frame are changes to "Activity" and "Name"

Total1 = this data frame contains an additional column where activity numbers are replaced by activity names. Total columns on this data frame are 564

Tidyset = this data frame has data in Total1 grouped by Activity and Subject


——————————Stepwise description———————————

1. Dataframe "total" is achieved by column binding data frames "x_test_train", "y_test_train" & "subject_test_train". Total columns in "total" dataframe are 563.

2.we read the table features.txt and assign it to a dataframe named "features"
-column 2 -"V2" of "features" dataframe is used to assign the column names 1:561 for dataframe "total".

- Also, for dataframe "total", column 562 is named "Activity" and column 563 is named "Subject"

- Using the grep() function, we extract the columns  by column names that have "mean()" and "std()"
- this dataframe is named "mean_stdev"

3. Dataframe "activity_names" is created using file activity_names.txt

- the column names for this dataframe are defined as "Activity" and "Name" respectively.

- A new dataframe is created named "Total1". This df has an additional column "Name" where activity numbers are replaced by activity names using merge() function.

4. Using the sub() function, the variable names were changed. "^t" was replaced by "time_" and "^f" was replaced by "frequency_".

5.Installed the package called dplyr for this problem.
- new df was called "tidyset" where the data in df "total" was grouped by "Activity" and "Subject"
- finally, the output was achieved by calculating average for each variable in df "tidyset". the function summarise_each() was used to perform this operation.


  
