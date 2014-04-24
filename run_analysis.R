cat("\n\n")
cat("## =======================================================================================================\n")
cat("## 1) Extracts only the measurements on the mean and standard deviation for each measurement.\n")
cat("## =======================================================================================================\n")

## Load activity label and feature names
cat("Loading activity label and feature names: activity_labels.txt , features.txt\n")
activityLabel <- read.table("./UCI HAR Dataset/activity_labels.txt")
featureName <- as.vector(read.table("./UCI HAR Dataset/features.txt")[,2])

## Figure out what feature columns to extract for mean and standard deviation
featureNameToExtract <- rep("NULL", length(featureName))
featureNameToExtract[grep("mean|std", featureName, ignore.case=TRUE)] <- NA
MeanStdName <- featureName[grep("mean|std", featureName, ignore.case=TRUE)]

## Load test data
cat("Loading data: subject_test.txt , X_test.txt , y_test.txt\n")
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses=featureNameToExtract)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")

## Load training data
cat("Loading data: subject_train.txt , X_train.txt , y_train.txt\n")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses=featureNameToExtract)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")



cat("\n\n")
cat("## =======================================================================================================\n")
cat("## 2) Merges the training and the test sets to create one data set.\n")
cat("## =======================================================================================================\n")

## Combine test and training data
cat("Combining test and training data into: subjectAll, xAll, yAll\n")
subjectAll <- rbind(subjectTest, subjectTrain)
xAll <- rbind(xTest, xTrain)
yAll <- rbind(yTest, yTrain)



cat("\n\n")
cat("## =======================================================================================================\n")
cat("## 3) Uses descriptive activity names to name the activities in the data set.\n")
cat("## =======================================================================================================\n")



cat("\n\n")
cat("## =======================================================================================================\n")
cat("## 4) Appropriately labels the data set with descriptive activity names.\n")
cat("## =======================================================================================================\n")



cat("\n\n")
cat("## =======================================================================================================\n")
cat("## 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.\n")
cat("## =======================================================================================================\n")












