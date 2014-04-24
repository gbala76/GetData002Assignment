## =======================================================================================================
## Prerequisites
## =======================================================================================================
## 1) Download the sample data from this location:
##      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## 2) Decompress the zip file, which contains a folder "UCI HAR Dataset", into the same folder with the R script.



## =======================================================================================================
## The script is performing:
## =======================================================================================================
## 1) Extracts only the measurements on the mean and standard deviation for each measurement.
## 2) Merges the training and the test sets to create one data set.
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive activity names. 
## 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## =======================================================================================================
## list of the variables used in script
## =======================================================================================================
## 
## Inputs variables loaded from files
##  * activityLabel
##  * featureName
##  * subjectTest
##  * xTest
##  * yTest
##  * subjectTrain
##  * xTrain
##  * yTrain
## 
## Program internal variables
##  * featureNameToExtract
##     - This provides the vector of column classes to extract for read.table() function. 
##     - NA indicates to load by default & NULL indicates to skip a column
##  * subjectAll
##     - This is the row-merge of subjectTest & subjectTrain
##  * xAll
##     - This is the row-merge of xTest & xTrain
##  * yAll
##     - This is the row-merge of yTest & yTrain
## 
## Output variables






