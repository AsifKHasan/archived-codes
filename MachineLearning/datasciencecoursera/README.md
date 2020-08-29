# Getting and Cleaning Data

## Objective 
Creating one R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps followed towards completion
1. Colleted raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Used **data.table** R library
3. Read the features, activity labels from appropriate dataset files
4. Loaded test and training sets and the activities from appropriate dataset files
5. Removed all columns except the columns with **mean** and **std** in the column name irrespective of case
6. Included (bound) activity and subject column with the modified dataset
7. Merge training and test dataset
8. Joined activity and data to add a column for descriptive activity name
9. Generate tidy data set through write.table. Output set was grouped by subject and activity and column means were taken

## Related files
* ___README.md___ - this file
* ___CodeBook.md___ - codebook for this analysis
* ___run_analysis.R___ - the project script
* ___getdata-projectfiles-UCI HAR Dataset.zip___ - downloaded raw data file archive
* ___tidy-data.txt___ - tidy dataset generated through the run_analysis.R script
