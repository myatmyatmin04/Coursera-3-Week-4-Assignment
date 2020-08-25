# The Source Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the download file:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# R Script
Install packages
Load libraries
Download zip
Unzip download file
Read train data
Read test data
Read features description
Read activity labels
Merge train and test data
Mean and standard deviation for each measurement
Name columns
Merge final data
Turn activity & subject into factor
create a summary independent tidy dataset from final dataset 
with the average of each variable for each activity and each subject. 
Export summary dataset
Read tidy dataset

The code assumes all the data is present in the same folder, un-compressed and without names altered.
