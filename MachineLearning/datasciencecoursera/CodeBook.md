---
title: "Code Book for Analysis on UCI HAR Dataset"
author: "Asif Hasan"
date: "July 24, 2015"
output: html_document
---

This Code Book is for describing the analysis doen on UCI HAR Dataset as part of the project submission requirement for Getting and Cleaning Data course from Coursera.

# Study Design
The data was collected from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following R code was used to download and unzip the data under a *UCI HAR Dataset* subdirectory under working directory.

```{r}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "getdata-projectfiles-UCI HAR Dataset.zip""
download.file(fileUrl, destfile = destfile, method = "curl")
unzip(destfile)
```

## Data layout
Data in the dataset is described by a few files and divided into two main subsets. The following files describe the data

- ___README.txt___ - overall description
- ___features\_info.txt___ - information about the variables used on the feature vector.
- ___features.txt___ - list of all features
- ___activity_labels.txt___ - links the class labels with their activity name.

Furthermore data is divided into two subsets - **train** and **test** for training dataset and test dataset. Each set contains three files

- ___X_CCC.txt___ - observation set
- ___y_CCC.txt___ - labels
- ___subject_CCC.txt___ -  each row identifies the subject/person performing the activity for each window sample. Its range is from 1 to 30. 

Each subset (**train** and **test**) also contains another inner directory names **Inertial Signals** which contains a few more files with additional data

* ___total_acc_x_CCC.txt___ - acceleration signal from the smartphone accelerometer X axis in standard gravity units **g**. Every row shows a 128 element vector. The same description applies for the ___total_acc_x_CCC.txt___ and ___total_acc_z_CCC.txt___ files for the Y and Z axis.

* ___body_acc_x_CCC.txt___ - body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* ___body_gyro_x_CCC.txt___ - angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


# Code book
Original description of the source data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is a summary of variables pertinent to this analysis.

* subjectID - numeric, the subject, range 1-30. used as factor
* activity - text, descriptive activity name, used as factor
* activityID - numeric, activity numeric ID, range 1-6
* tBodyAcc-mean()-X : numeric (double), 
* tBodyAcc-mean()-Y : numeric (double), 
* tBodyAcc-mean()-Z : numeric (double), 
* tBodyAcc-std()-X : numeric (double), 
* tBodyAcc-std()-Y : numeric (double), 
* tBodyAcc-std()-Z : numeric (double), 
* tGravityAcc-mean()-X : numeric (double), 
* tGravityAcc-mean()-Y : numeric (double), 
* tGravityAcc-mean()-Z : numeric (double), 
* tGravityAcc-std()-X : numeric (double), 
* tGravityAcc-std()-Y : numeric (double), 
* tGravityAcc-std()-Z : numeric (double), 
* tBodyAccJerk-mean()-X : numeric (double), 
* tBodyAccJerk-mean()-Y : numeric (double), 
* tBodyAccJerk-mean()-Z : numeric (double), 
* tBodyAccJerk-std()-X : numeric (double), 
* tBodyAccJerk-std()-Y : numeric (double), 
* tBodyAccJerk-std()-Z : numeric (double), 
* tBodyGyro-mean()-X : numeric (double), 
* tBodyGyro-mean()-Y : numeric (double), 
* tBodyGyro-mean()-Z : numeric (double), 
* tBodyGyro-std()-X : numeric (double), 
* tBodyGyro-std()-Y : numeric (double), 
* tBodyGyro-std()-Z : numeric (double), 
* tBodyGyroJerk-mean()-X : numeric (double), 
* tBodyGyroJerk-mean()-Y : numeric (double), 
* tBodyGyroJerk-mean()-Z : numeric (double), 
* tBodyGyroJerk-std()-X : numeric (double), 
* tBodyGyroJerk-std()-Y : numeric (double), 
* tBodyGyroJerk-std()-Z : numeric (double), 
* tBodyAccMag-mean() : numeric (double), 
* tBodyAccMag-std() : numeric (double), 
* tGravityAccMag-mean() : numeric (double), 
* tGravityAccMag-std() : numeric (double), 
* tBodyAccJerkMag-mean() : numeric (double), 
* tBodyAccJerkMag-std() : numeric (double), 
* tBodyGyroMag-mean() : numeric (double), 
* tBodyGyroMag-std() : numeric (double), 
* tBodyGyroJerkMag-mean() : numeric (double), 
* tBodyGyroJerkMag-std() : numeric (double), 
* fBodyAcc-mean()-X : numeric (double), 
* fBodyAcc-mean()-Y : numeric (double), 
* fBodyAcc-mean()-Z : numeric (double), 
* fBodyAcc-std()-X : numeric (double), 
* fBodyAcc-std()-Y : numeric (double), 
* fBodyAcc-std()-Z : numeric (double), 
* fBodyAcc-meanFreq()-X : numeric (double), 
* fBodyAcc-meanFreq()-Y : numeric (double), 
* fBodyAcc-meanFreq()-Z : numeric (double), 
* fBodyAccJerk-mean()-X : numeric (double), 
* fBodyAccJerk-mean()-Y : numeric (double), 
* fBodyAccJerk-mean()-Z : numeric (double), 
* fBodyAccJerk-std()-X : numeric (double), 
* fBodyAccJerk-std()-Y : numeric (double), 
* fBodyAccJerk-std()-Z : numeric (double), 
* fBodyAccJerk-meanFreq()-X : numeric (double), 
* fBodyAccJerk-meanFreq()-Y : numeric (double), 
* fBodyAccJerk-meanFreq()-Z : numeric (double), 
* fBodyGyro-mean()-X : numeric (double), 
* fBodyGyro-mean()-Y : numeric (double), 
* fBodyGyro-mean()-Z : numeric (double), 
* fBodyGyro-std()-X : numeric (double), 
* fBodyGyro-std()-Y : numeric (double), 
* fBodyGyro-std()-Z : numeric (double), 
* fBodyGyro-meanFreq()-X : numeric (double), 
* fBodyGyro-meanFreq()-Y : numeric (double), 
* fBodyGyro-meanFreq()-Z : numeric (double), 
* fBodyAccMag-mean() : numeric (double), 
* fBodyAccMag-std() : numeric (double), 
* fBodyAccMag-meanFreq() : numeric (double), 
* fBodyBodyAccJerkMag-mean() : numeric (double), 
* fBodyBodyAccJerkMag-std() : numeric (double), 
* fBodyBodyAccJerkMag-meanFreq() : numeric (double), 
* fBodyBodyGyroMag-mean() : numeric (double), 
* fBodyBodyGyroMag-std() : numeric (double), 
* fBodyBodyGyroMag-meanFreq() : numeric (double), 
* fBodyBodyGyroJerkMag-mean() : numeric (double), 
* fBodyBodyGyroJerkMag-std() : numeric (double), 
* fBodyBodyGyroJerkMag-meanFreq() : numeric (double), 
* angle(tBodyAccMean,gravity) : numeric (double), 
* angle(tBodyAccJerkMean),gravityMean) : numeric (double), 
* angle(tBodyGyroMean,gravityMean) : numeric (double), 
* angle(tBodyGyroJerkMean,gravityMean) : numeric (double), 
* angle(X,gravityMean) : numeric (double), 
* angle(Y,gravityMean) : numeric (double), 
* angle(Z,gravityMean) : numeric (double), 

