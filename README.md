# Project3
Get and cleaning data

First I download and unzip the zip with download.file() and unzip()

Then I save the read data in other variables for each txt file in train and and test with read.table()

Next I merge train and test datasets with cbind(), X_test with X_train and y_test with y_train and subject_test with subject_train

Then I read the names of the dataset i want to create, this names are in the files "features" and "activitys", I use read.table()

Then I select the variables that have the words "mean" or "std" so I apply grep()

Next I select only the numbers of the result of grep function in the Xdata variable.

Then i create the "data" variable that is a merge of Xdata, Ydata and subjectdata

Next I put the names in each column of the "data" DF with names()

I use factor() to replace the names in the variable "activity" for the numbers in Ydata

For the final step I use melt() and dcast() to reorganice the data frame and have a DF in order to the subject and activity with the mean of each one.

Finally I write the table in txt format with the name "tidy_dataset"