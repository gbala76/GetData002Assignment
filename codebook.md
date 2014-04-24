## =======================================================================================================
## Prerequisites
## =======================================================================================================
## 1) Download the sample data from this location:
##      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## 2) Decompress the zip file, which contains a folder "UCI HAR Dataset", into the same folder with the R script.



## =======================================================================================================
## The script is performing the following transformations.
## Note that the sequence of steps is different from the original course suggested steps. The modification
## is to load only the mean & standard deviation columns into the memory, without loading the entire data set.  
## This improves the data loading performance. 
## =======================================================================================================
## 0) Load the package: reshape2
## 1) Extracts only the measurements on the mean and standard deviation for each measurement.
##     - Note that, within the column names, it's assumed that:
##       a) Mean measurements must contain text "mean" in the column name, despite of capital or small letter
##       b) Standard deviation measurements must contain text "std" in column name, despite of capital or small letter
## 2) Merges the training and the test sets to create one data set.
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive activity names. 
## 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Final) cleaning up; unload the package: reshape2



## =======================================================================================================
## list of the variables used in script
## =======================================================================================================
## 
## Inputs variables loaded from files
##  * activityLabel
##     - This provides the mapping of activity value to descriptions:
##          1 WALKING
##          2 WALKING_UPSTAIRS
##          3 WALKING_DOWNSTAIRS
##          4 SITTING
##          5 STANDING
##          6 LAYING
##  * featureName
##     - There are 561 feature names. For the entire list, please refer to the appendix at the end.
##  * subjectTest
##     - subject testing data
##  * xTest
##     - feature testing data
##  * yTest
##     - activity testing data
##  * subjectTrain
##     - subject training data
##  * xTrain
##     - feature training data
##  * yTrain
##     - activity training data
## 
## Program internal variables
##  * featureNameToExtract
##     - This provides the vector of column classes to extract for read.table() function. 
##     - NA indicates to load by default & NULL indicates to skip a column
##  * subjectAll
##     - This is the row-bind of subjectTest & subjectTrain
##  * xAll
##     - This is the row-bind of xTest & xTrain
##  * yAll
##     - This is the row-bind of yTest & yTrain
##  * finalAll
##     - This is the column-bind of subjectAll, xAll & yAll
## 
## Outputs
##  * resultTidy
##     - This is the summarized tidy data set variable
##  * resultTidy.txt
##     - This is the summarized tidy data set output to a file in working directory. 
##     - The file columns are:
##        * Subject
##        * Activity
##        * Feature
##        * Mean
##     - The file format is:
##        * String values have no quote.
##        * Columns are pipe-delimited, "|"
##        * End-of-line is the Microsoft Windows style: \r\n
##        * Row records do not have index.



## =======================================================================================================
## Appendix
## =======================================================================================================

## Below is a list of the x measurement's feature names:
## 
## Column 1) tBodyAcc-mean()-X
## Column 2) tBodyAcc-mean()-Y
## Column 3) tBodyAcc-mean()-Z
## Column 4) tBodyAcc-std()-X
## Column 5) tBodyAcc-std()-Y
## Column 6) tBodyAcc-std()-Z
## Column 7) tBodyAcc-mad()-X
## Column 8) tBodyAcc-mad()-Y
## Column 9) tBodyAcc-mad()-Z
## Column 10) tBodyAcc-max()-X
## Column 11) tBodyAcc-max()-Y
## Column 12) tBodyAcc-max()-Z
## Column 13) tBodyAcc-min()-X
## Column 14) tBodyAcc-min()-Y
## Column 15) tBodyAcc-min()-Z
## Column 16) tBodyAcc-sma()
## Column 17) tBodyAcc-energy()-X
## Column 18) tBodyAcc-energy()-Y
## Column 19) tBodyAcc-energy()-Z
## Column 20) tBodyAcc-iqr()-X
## Column 21) tBodyAcc-iqr()-Y
## Column 22) tBodyAcc-iqr()-Z
## Column 23) tBodyAcc-entropy()-X
## Column 24) tBodyAcc-entropy()-Y
## Column 25) tBodyAcc-entropy()-Z
## Column 26) tBodyAcc-arCoeff()-X,1
## Column 27) tBodyAcc-arCoeff()-X,2
## Column 28) tBodyAcc-arCoeff()-X,3
## Column 29) tBodyAcc-arCoeff()-X,4
## Column 30) tBodyAcc-arCoeff()-Y,1
## Column 31) tBodyAcc-arCoeff()-Y,2
## Column 32) tBodyAcc-arCoeff()-Y,3
## Column 33) tBodyAcc-arCoeff()-Y,4
## Column 34) tBodyAcc-arCoeff()-Z,1
## Column 35) tBodyAcc-arCoeff()-Z,2
## Column 36) tBodyAcc-arCoeff()-Z,3
## Column 37) tBodyAcc-arCoeff()-Z,4
## Column 38) tBodyAcc-correlation()-X,Y
## Column 39) tBodyAcc-correlation()-X,Z
## Column 40) tBodyAcc-correlation()-Y,Z
## Column 41) tGravityAcc-mean()-X
## Column 42) tGravityAcc-mean()-Y
## Column 43) tGravityAcc-mean()-Z
## Column 44) tGravityAcc-std()-X
## Column 45) tGravityAcc-std()-Y
## Column 46) tGravityAcc-std()-Z
## Column 47) tGravityAcc-mad()-X
## Column 48) tGravityAcc-mad()-Y
## Column 49) tGravityAcc-mad()-Z
## Column 50) tGravityAcc-max()-X
## Column 51) tGravityAcc-max()-Y
## Column 52) tGravityAcc-max()-Z
## Column 53) tGravityAcc-min()-X
## Column 54) tGravityAcc-min()-Y
## Column 55) tGravityAcc-min()-Z
## Column 56) tGravityAcc-sma()
## Column 57) tGravityAcc-energy()-X
## Column 58) tGravityAcc-energy()-Y
## Column 59) tGravityAcc-energy()-Z
## Column 60) tGravityAcc-iqr()-X
## Column 61) tGravityAcc-iqr()-Y
## Column 62) tGravityAcc-iqr()-Z
## Column 63) tGravityAcc-entropy()-X
## Column 64) tGravityAcc-entropy()-Y
## Column 65) tGravityAcc-entropy()-Z
## Column 66) tGravityAcc-arCoeff()-X,1
## Column 67) tGravityAcc-arCoeff()-X,2
## Column 68) tGravityAcc-arCoeff()-X,3
## Column 69) tGravityAcc-arCoeff()-X,4
## Column 70) tGravityAcc-arCoeff()-Y,1
## Column 71) tGravityAcc-arCoeff()-Y,2
## Column 72) tGravityAcc-arCoeff()-Y,3
## Column 73) tGravityAcc-arCoeff()-Y,4
## Column 74) tGravityAcc-arCoeff()-Z,1
## Column 75) tGravityAcc-arCoeff()-Z,2
## Column 76) tGravityAcc-arCoeff()-Z,3
## Column 77) tGravityAcc-arCoeff()-Z,4
## Column 78) tGravityAcc-correlation()-X,Y
## Column 79) tGravityAcc-correlation()-X,Z
## Column 80) tGravityAcc-correlation()-Y,Z
## Column 81) tBodyAccJerk-mean()-X
## Column 82) tBodyAccJerk-mean()-Y
## Column 83) tBodyAccJerk-mean()-Z
## Column 84) tBodyAccJerk-std()-X
## Column 85) tBodyAccJerk-std()-Y
## Column 86) tBodyAccJerk-std()-Z
## Column 87) tBodyAccJerk-mad()-X
## Column 88) tBodyAccJerk-mad()-Y
## Column 89) tBodyAccJerk-mad()-Z
## Column 90) tBodyAccJerk-max()-X
## Column 91) tBodyAccJerk-max()-Y
## Column 92) tBodyAccJerk-max()-Z
## Column 93) tBodyAccJerk-min()-X
## Column 94) tBodyAccJerk-min()-Y
## Column 95) tBodyAccJerk-min()-Z
## Column 96) tBodyAccJerk-sma()
## Column 97) tBodyAccJerk-energy()-X
## Column 98) tBodyAccJerk-energy()-Y
## Column 99) tBodyAccJerk-energy()-Z
## Column 100) tBodyAccJerk-iqr()-X
## Column 101) tBodyAccJerk-iqr()-Y
## Column 102) tBodyAccJerk-iqr()-Z
## Column 103) tBodyAccJerk-entropy()-X
## Column 104) tBodyAccJerk-entropy()-Y
## Column 105) tBodyAccJerk-entropy()-Z
## Column 106) tBodyAccJerk-arCoeff()-X,1
## Column 107) tBodyAccJerk-arCoeff()-X,2
## Column 108) tBodyAccJerk-arCoeff()-X,3
## Column 109) tBodyAccJerk-arCoeff()-X,4
## Column 110) tBodyAccJerk-arCoeff()-Y,1
## Column 111) tBodyAccJerk-arCoeff()-Y,2
## Column 112) tBodyAccJerk-arCoeff()-Y,3
## Column 113) tBodyAccJerk-arCoeff()-Y,4
## Column 114) tBodyAccJerk-arCoeff()-Z,1
## Column 115) tBodyAccJerk-arCoeff()-Z,2
## Column 116) tBodyAccJerk-arCoeff()-Z,3
## Column 117) tBodyAccJerk-arCoeff()-Z,4
## Column 118) tBodyAccJerk-correlation()-X,Y
## Column 119) tBodyAccJerk-correlation()-X,Z
## Column 120) tBodyAccJerk-correlation()-Y,Z
## Column 121) tBodyGyro-mean()-X
## Column 122) tBodyGyro-mean()-Y
## Column 123) tBodyGyro-mean()-Z
## Column 124) tBodyGyro-std()-X
## Column 125) tBodyGyro-std()-Y
## Column 126) tBodyGyro-std()-Z
## Column 127) tBodyGyro-mad()-X
## Column 128) tBodyGyro-mad()-Y
## Column 129) tBodyGyro-mad()-Z
## Column 130) tBodyGyro-max()-X
## Column 131) tBodyGyro-max()-Y
## Column 132) tBodyGyro-max()-Z
## Column 133) tBodyGyro-min()-X
## Column 134) tBodyGyro-min()-Y
## Column 135) tBodyGyro-min()-Z
## Column 136) tBodyGyro-sma()
## Column 137) tBodyGyro-energy()-X
## Column 138) tBodyGyro-energy()-Y
## Column 139) tBodyGyro-energy()-Z
## Column 140) tBodyGyro-iqr()-X
## Column 141) tBodyGyro-iqr()-Y
## Column 142) tBodyGyro-iqr()-Z
## Column 143) tBodyGyro-entropy()-X
## Column 144) tBodyGyro-entropy()-Y
## Column 145) tBodyGyro-entropy()-Z
## Column 146) tBodyGyro-arCoeff()-X,1
## Column 147) tBodyGyro-arCoeff()-X,2
## Column 148) tBodyGyro-arCoeff()-X,3
## Column 149) tBodyGyro-arCoeff()-X,4
## Column 150) tBodyGyro-arCoeff()-Y,1
## Column 151) tBodyGyro-arCoeff()-Y,2
## Column 152) tBodyGyro-arCoeff()-Y,3
## Column 153) tBodyGyro-arCoeff()-Y,4
## Column 154) tBodyGyro-arCoeff()-Z,1
## Column 155) tBodyGyro-arCoeff()-Z,2
## Column 156) tBodyGyro-arCoeff()-Z,3
## Column 157) tBodyGyro-arCoeff()-Z,4
## Column 158) tBodyGyro-correlation()-X,Y
## Column 159) tBodyGyro-correlation()-X,Z
## Column 160) tBodyGyro-correlation()-Y,Z
## Column 161) tBodyGyroJerk-mean()-X
## Column 162) tBodyGyroJerk-mean()-Y
## Column 163) tBodyGyroJerk-mean()-Z
## Column 164) tBodyGyroJerk-std()-X
## Column 165) tBodyGyroJerk-std()-Y
## Column 166) tBodyGyroJerk-std()-Z
## Column 167) tBodyGyroJerk-mad()-X
## Column 168) tBodyGyroJerk-mad()-Y
## Column 169) tBodyGyroJerk-mad()-Z
## Column 170) tBodyGyroJerk-max()-X
## Column 171) tBodyGyroJerk-max()-Y
## Column 172) tBodyGyroJerk-max()-Z
## Column 173) tBodyGyroJerk-min()-X
## Column 174) tBodyGyroJerk-min()-Y
## Column 175) tBodyGyroJerk-min()-Z
## Column 176) tBodyGyroJerk-sma()
## Column 177) tBodyGyroJerk-energy()-X
## Column 178) tBodyGyroJerk-energy()-Y
## Column 179) tBodyGyroJerk-energy()-Z
## Column 180) tBodyGyroJerk-iqr()-X
## Column 181) tBodyGyroJerk-iqr()-Y
## Column 182) tBodyGyroJerk-iqr()-Z
## Column 183) tBodyGyroJerk-entropy()-X
## Column 184) tBodyGyroJerk-entropy()-Y
## Column 185) tBodyGyroJerk-entropy()-Z
## Column 186) tBodyGyroJerk-arCoeff()-X,1
## Column 187) tBodyGyroJerk-arCoeff()-X,2
## Column 188) tBodyGyroJerk-arCoeff()-X,3
## Column 189) tBodyGyroJerk-arCoeff()-X,4
## Column 190) tBodyGyroJerk-arCoeff()-Y,1
## Column 191) tBodyGyroJerk-arCoeff()-Y,2
## Column 192) tBodyGyroJerk-arCoeff()-Y,3
## Column 193) tBodyGyroJerk-arCoeff()-Y,4
## Column 194) tBodyGyroJerk-arCoeff()-Z,1
## Column 195) tBodyGyroJerk-arCoeff()-Z,2
## Column 196) tBodyGyroJerk-arCoeff()-Z,3
## Column 197) tBodyGyroJerk-arCoeff()-Z,4
## Column 198) tBodyGyroJerk-correlation()-X,Y
## Column 199) tBodyGyroJerk-correlation()-X,Z
## Column 200) tBodyGyroJerk-correlation()-Y,Z
## Column 201) tBodyAccMag-mean()
## Column 202) tBodyAccMag-std()
## Column 203) tBodyAccMag-mad()
## Column 204) tBodyAccMag-max()
## Column 205) tBodyAccMag-min()
## Column 206) tBodyAccMag-sma()
## Column 207) tBodyAccMag-energy()
## Column 208) tBodyAccMag-iqr()
## Column 209) tBodyAccMag-entropy()
## Column 210) tBodyAccMag-arCoeff()1
## Column 211) tBodyAccMag-arCoeff()2
## Column 212) tBodyAccMag-arCoeff()3
## Column 213) tBodyAccMag-arCoeff()4
## Column 214) tGravityAccMag-mean()
## Column 215) tGravityAccMag-std()
## Column 216) tGravityAccMag-mad()
## Column 217) tGravityAccMag-max()
## Column 218) tGravityAccMag-min()
## Column 219) tGravityAccMag-sma()
## Column 220) tGravityAccMag-energy()
## Column 221) tGravityAccMag-iqr()
## Column 222) tGravityAccMag-entropy()
## Column 223) tGravityAccMag-arCoeff()1
## Column 224) tGravityAccMag-arCoeff()2
## Column 225) tGravityAccMag-arCoeff()3
## Column 226) tGravityAccMag-arCoeff()4
## Column 227) tBodyAccJerkMag-mean()
## Column 228) tBodyAccJerkMag-std()
## Column 229) tBodyAccJerkMag-mad()
## Column 230) tBodyAccJerkMag-max()
## Column 231) tBodyAccJerkMag-min()
## Column 232) tBodyAccJerkMag-sma()
## Column 233) tBodyAccJerkMag-energy()
## Column 234) tBodyAccJerkMag-iqr()
## Column 235) tBodyAccJerkMag-entropy()
## Column 236) tBodyAccJerkMag-arCoeff()1
## Column 237) tBodyAccJerkMag-arCoeff()2
## Column 238) tBodyAccJerkMag-arCoeff()3
## Column 239) tBodyAccJerkMag-arCoeff()4
## Column 240) tBodyGyroMag-mean()
## Column 241) tBodyGyroMag-std()
## Column 242) tBodyGyroMag-mad()
## Column 243) tBodyGyroMag-max()
## Column 244) tBodyGyroMag-min()
## Column 245) tBodyGyroMag-sma()
## Column 246) tBodyGyroMag-energy()
## Column 247) tBodyGyroMag-iqr()
## Column 248) tBodyGyroMag-entropy()
## Column 249) tBodyGyroMag-arCoeff()1
## Column 250) tBodyGyroMag-arCoeff()2
## Column 251) tBodyGyroMag-arCoeff()3
## Column 252) tBodyGyroMag-arCoeff()4
## Column 253) tBodyGyroJerkMag-mean()
## Column 254) tBodyGyroJerkMag-std()
## Column 255) tBodyGyroJerkMag-mad()
## Column 256) tBodyGyroJerkMag-max()
## Column 257) tBodyGyroJerkMag-min()
## Column 258) tBodyGyroJerkMag-sma()
## Column 259) tBodyGyroJerkMag-energy()
## Column 260) tBodyGyroJerkMag-iqr()
## Column 261) tBodyGyroJerkMag-entropy()
## Column 262) tBodyGyroJerkMag-arCoeff()1
## Column 263) tBodyGyroJerkMag-arCoeff()2
## Column 264) tBodyGyroJerkMag-arCoeff()3
## Column 265) tBodyGyroJerkMag-arCoeff()4
## Column 266) fBodyAcc-mean()-X
## Column 267) fBodyAcc-mean()-Y
## Column 268) fBodyAcc-mean()-Z
## Column 269) fBodyAcc-std()-X
## Column 270) fBodyAcc-std()-Y
## Column 271) fBodyAcc-std()-Z
## Column 272) fBodyAcc-mad()-X
## Column 273) fBodyAcc-mad()-Y
## Column 274) fBodyAcc-mad()-Z
## Column 275) fBodyAcc-max()-X
## Column 276) fBodyAcc-max()-Y
## Column 277) fBodyAcc-max()-Z
## Column 278) fBodyAcc-min()-X
## Column 279) fBodyAcc-min()-Y
## Column 280) fBodyAcc-min()-Z
## Column 281) fBodyAcc-sma()
## Column 282) fBodyAcc-energy()-X
## Column 283) fBodyAcc-energy()-Y
## Column 284) fBodyAcc-energy()-Z
## Column 285) fBodyAcc-iqr()-X
## Column 286) fBodyAcc-iqr()-Y
## Column 287) fBodyAcc-iqr()-Z
## Column 288) fBodyAcc-entropy()-X
## Column 289) fBodyAcc-entropy()-Y
## Column 290) fBodyAcc-entropy()-Z
## Column 291) fBodyAcc-maxInds-X
## Column 292) fBodyAcc-maxInds-Y
## Column 293) fBodyAcc-maxInds-Z
## Column 294) fBodyAcc-meanFreq()-X
## Column 295) fBodyAcc-meanFreq()-Y
## Column 296) fBodyAcc-meanFreq()-Z
## Column 297) fBodyAcc-skewness()-X
## Column 298) fBodyAcc-kurtosis()-X
## Column 299) fBodyAcc-skewness()-Y
## Column 300) fBodyAcc-kurtosis()-Y
## Column 301) fBodyAcc-skewness()-Z
## Column 302) fBodyAcc-kurtosis()-Z
## Column 303) fBodyAcc-bandsEnergy()-1,8
## Column 304) fBodyAcc-bandsEnergy()-9,16
## Column 305) fBodyAcc-bandsEnergy()-17,24
## Column 306) fBodyAcc-bandsEnergy()-25,32
## Column 307) fBodyAcc-bandsEnergy()-33,40
## Column 308) fBodyAcc-bandsEnergy()-41,48
## Column 309) fBodyAcc-bandsEnergy()-49,56
## Column 310) fBodyAcc-bandsEnergy()-57,64
## Column 311) fBodyAcc-bandsEnergy()-1,16
## Column 312) fBodyAcc-bandsEnergy()-17,32
## Column 313) fBodyAcc-bandsEnergy()-33,48
## Column 314) fBodyAcc-bandsEnergy()-49,64
## Column 315) fBodyAcc-bandsEnergy()-1,24
## Column 316) fBodyAcc-bandsEnergy()-25,48
## Column 317) fBodyAcc-bandsEnergy()-1,8
## Column 318) fBodyAcc-bandsEnergy()-9,16
## Column 319) fBodyAcc-bandsEnergy()-17,24
## Column 320) fBodyAcc-bandsEnergy()-25,32
## Column 321) fBodyAcc-bandsEnergy()-33,40
## Column 322) fBodyAcc-bandsEnergy()-41,48
## Column 323) fBodyAcc-bandsEnergy()-49,56
## Column 324) fBodyAcc-bandsEnergy()-57,64
## Column 325) fBodyAcc-bandsEnergy()-1,16
## Column 326) fBodyAcc-bandsEnergy()-17,32
## Column 327) fBodyAcc-bandsEnergy()-33,48
## Column 328) fBodyAcc-bandsEnergy()-49,64
## Column 329) fBodyAcc-bandsEnergy()-1,24
## Column 330) fBodyAcc-bandsEnergy()-25,48
## Column 331) fBodyAcc-bandsEnergy()-1,8
## Column 332) fBodyAcc-bandsEnergy()-9,16
## Column 333) fBodyAcc-bandsEnergy()-17,24
## Column 334) fBodyAcc-bandsEnergy()-25,32
## Column 335) fBodyAcc-bandsEnergy()-33,40
## Column 336) fBodyAcc-bandsEnergy()-41,48
## Column 337) fBodyAcc-bandsEnergy()-49,56
## Column 338) fBodyAcc-bandsEnergy()-57,64
## Column 339) fBodyAcc-bandsEnergy()-1,16
## Column 340) fBodyAcc-bandsEnergy()-17,32
## Column 341) fBodyAcc-bandsEnergy()-33,48
## Column 342) fBodyAcc-bandsEnergy()-49,64
## Column 343) fBodyAcc-bandsEnergy()-1,24
## Column 344) fBodyAcc-bandsEnergy()-25,48
## Column 345) fBodyAccJerk-mean()-X
## Column 346) fBodyAccJerk-mean()-Y
## Column 347) fBodyAccJerk-mean()-Z
## Column 348) fBodyAccJerk-std()-X
## Column 349) fBodyAccJerk-std()-Y
## Column 350) fBodyAccJerk-std()-Z
## Column 351) fBodyAccJerk-mad()-X
## Column 352) fBodyAccJerk-mad()-Y
## Column 353) fBodyAccJerk-mad()-Z
## Column 354) fBodyAccJerk-max()-X
## Column 355) fBodyAccJerk-max()-Y
## Column 356) fBodyAccJerk-max()-Z
## Column 357) fBodyAccJerk-min()-X
## Column 358) fBodyAccJerk-min()-Y
## Column 359) fBodyAccJerk-min()-Z
## Column 360) fBodyAccJerk-sma()
## Column 361) fBodyAccJerk-energy()-X
## Column 362) fBodyAccJerk-energy()-Y
## Column 363) fBodyAccJerk-energy()-Z
## Column 364) fBodyAccJerk-iqr()-X
## Column 365) fBodyAccJerk-iqr()-Y
## Column 366) fBodyAccJerk-iqr()-Z
## Column 367) fBodyAccJerk-entropy()-X
## Column 368) fBodyAccJerk-entropy()-Y
## Column 369) fBodyAccJerk-entropy()-Z
## Column 370) fBodyAccJerk-maxInds-X
## Column 371) fBodyAccJerk-maxInds-Y
## Column 372) fBodyAccJerk-maxInds-Z
## Column 373) fBodyAccJerk-meanFreq()-X
## Column 374) fBodyAccJerk-meanFreq()-Y
## Column 375) fBodyAccJerk-meanFreq()-Z
## Column 376) fBodyAccJerk-skewness()-X
## Column 377) fBodyAccJerk-kurtosis()-X
## Column 378) fBodyAccJerk-skewness()-Y
## Column 379) fBodyAccJerk-kurtosis()-Y
## Column 380) fBodyAccJerk-skewness()-Z
## Column 381) fBodyAccJerk-kurtosis()-Z
## Column 382) fBodyAccJerk-bandsEnergy()-1,8
## Column 383) fBodyAccJerk-bandsEnergy()-9,16
## Column 384) fBodyAccJerk-bandsEnergy()-17,24
## Column 385) fBodyAccJerk-bandsEnergy()-25,32
## Column 386) fBodyAccJerk-bandsEnergy()-33,40
## Column 387) fBodyAccJerk-bandsEnergy()-41,48
## Column 388) fBodyAccJerk-bandsEnergy()-49,56
## Column 389) fBodyAccJerk-bandsEnergy()-57,64
## Column 390) fBodyAccJerk-bandsEnergy()-1,16
## Column 391) fBodyAccJerk-bandsEnergy()-17,32
## Column 392) fBodyAccJerk-bandsEnergy()-33,48
## Column 393) fBodyAccJerk-bandsEnergy()-49,64
## Column 394) fBodyAccJerk-bandsEnergy()-1,24
## Column 395) fBodyAccJerk-bandsEnergy()-25,48
## Column 396) fBodyAccJerk-bandsEnergy()-1,8
## Column 397) fBodyAccJerk-bandsEnergy()-9,16
## Column 398) fBodyAccJerk-bandsEnergy()-17,24
## Column 399) fBodyAccJerk-bandsEnergy()-25,32
## Column 400) fBodyAccJerk-bandsEnergy()-33,40
## Column 401) fBodyAccJerk-bandsEnergy()-41,48
## Column 402) fBodyAccJerk-bandsEnergy()-49,56
## Column 403) fBodyAccJerk-bandsEnergy()-57,64
## Column 404) fBodyAccJerk-bandsEnergy()-1,16
## Column 405) fBodyAccJerk-bandsEnergy()-17,32
## Column 406) fBodyAccJerk-bandsEnergy()-33,48
## Column 407) fBodyAccJerk-bandsEnergy()-49,64
## Column 408) fBodyAccJerk-bandsEnergy()-1,24
## Column 409) fBodyAccJerk-bandsEnergy()-25,48
## Column 410) fBodyAccJerk-bandsEnergy()-1,8
## Column 411) fBodyAccJerk-bandsEnergy()-9,16
## Column 412) fBodyAccJerk-bandsEnergy()-17,24
## Column 413) fBodyAccJerk-bandsEnergy()-25,32
## Column 414) fBodyAccJerk-bandsEnergy()-33,40
## Column 415) fBodyAccJerk-bandsEnergy()-41,48
## Column 416) fBodyAccJerk-bandsEnergy()-49,56
## Column 417) fBodyAccJerk-bandsEnergy()-57,64
## Column 418) fBodyAccJerk-bandsEnergy()-1,16
## Column 419) fBodyAccJerk-bandsEnergy()-17,32
## Column 420) fBodyAccJerk-bandsEnergy()-33,48
## Column 421) fBodyAccJerk-bandsEnergy()-49,64
## Column 422) fBodyAccJerk-bandsEnergy()-1,24
## Column 423) fBodyAccJerk-bandsEnergy()-25,48
## Column 424) fBodyGyro-mean()-X
## Column 425) fBodyGyro-mean()-Y
## Column 426) fBodyGyro-mean()-Z
## Column 427) fBodyGyro-std()-X
## Column 428) fBodyGyro-std()-Y
## Column 429) fBodyGyro-std()-Z
## Column 430) fBodyGyro-mad()-X
## Column 431) fBodyGyro-mad()-Y
## Column 432) fBodyGyro-mad()-Z
## Column 433) fBodyGyro-max()-X
## Column 434) fBodyGyro-max()-Y
## Column 435) fBodyGyro-max()-Z
## Column 436) fBodyGyro-min()-X
## Column 437) fBodyGyro-min()-Y
## Column 438) fBodyGyro-min()-Z
## Column 439) fBodyGyro-sma()
## Column 440) fBodyGyro-energy()-X
## Column 441) fBodyGyro-energy()-Y
## Column 442) fBodyGyro-energy()-Z
## Column 443) fBodyGyro-iqr()-X
## Column 444) fBodyGyro-iqr()-Y
## Column 445) fBodyGyro-iqr()-Z
## Column 446) fBodyGyro-entropy()-X
## Column 447) fBodyGyro-entropy()-Y
## Column 448) fBodyGyro-entropy()-Z
## Column 449) fBodyGyro-maxInds-X
## Column 450) fBodyGyro-maxInds-Y
## Column 451) fBodyGyro-maxInds-Z
## Column 452) fBodyGyro-meanFreq()-X
## Column 453) fBodyGyro-meanFreq()-Y
## Column 454) fBodyGyro-meanFreq()-Z
## Column 455) fBodyGyro-skewness()-X
## Column 456) fBodyGyro-kurtosis()-X
## Column 457) fBodyGyro-skewness()-Y
## Column 458) fBodyGyro-kurtosis()-Y
## Column 459) fBodyGyro-skewness()-Z
## Column 460) fBodyGyro-kurtosis()-Z
## Column 461) fBodyGyro-bandsEnergy()-1,8
## Column 462) fBodyGyro-bandsEnergy()-9,16
## Column 463) fBodyGyro-bandsEnergy()-17,24
## Column 464) fBodyGyro-bandsEnergy()-25,32
## Column 465) fBodyGyro-bandsEnergy()-33,40
## Column 466) fBodyGyro-bandsEnergy()-41,48
## Column 467) fBodyGyro-bandsEnergy()-49,56
## Column 468) fBodyGyro-bandsEnergy()-57,64
## Column 469) fBodyGyro-bandsEnergy()-1,16
## Column 470) fBodyGyro-bandsEnergy()-17,32
## Column 471) fBodyGyro-bandsEnergy()-33,48
## Column 472) fBodyGyro-bandsEnergy()-49,64
## Column 473) fBodyGyro-bandsEnergy()-1,24
## Column 474) fBodyGyro-bandsEnergy()-25,48
## Column 475) fBodyGyro-bandsEnergy()-1,8
## Column 476) fBodyGyro-bandsEnergy()-9,16
## Column 477) fBodyGyro-bandsEnergy()-17,24
## Column 478) fBodyGyro-bandsEnergy()-25,32
## Column 479) fBodyGyro-bandsEnergy()-33,40
## Column 480) fBodyGyro-bandsEnergy()-41,48
## Column 481) fBodyGyro-bandsEnergy()-49,56
## Column 482) fBodyGyro-bandsEnergy()-57,64
## Column 483) fBodyGyro-bandsEnergy()-1,16
## Column 484) fBodyGyro-bandsEnergy()-17,32
## Column 485) fBodyGyro-bandsEnergy()-33,48
## Column 486) fBodyGyro-bandsEnergy()-49,64
## Column 487) fBodyGyro-bandsEnergy()-1,24
## Column 488) fBodyGyro-bandsEnergy()-25,48
## Column 489) fBodyGyro-bandsEnergy()-1,8
## Column 490) fBodyGyro-bandsEnergy()-9,16
## Column 491) fBodyGyro-bandsEnergy()-17,24
## Column 492) fBodyGyro-bandsEnergy()-25,32
## Column 493) fBodyGyro-bandsEnergy()-33,40
## Column 494) fBodyGyro-bandsEnergy()-41,48
## Column 495) fBodyGyro-bandsEnergy()-49,56
## Column 496) fBodyGyro-bandsEnergy()-57,64
## Column 497) fBodyGyro-bandsEnergy()-1,16
## Column 498) fBodyGyro-bandsEnergy()-17,32
## Column 499) fBodyGyro-bandsEnergy()-33,48
## Column 500) fBodyGyro-bandsEnergy()-49,64
## Column 501) fBodyGyro-bandsEnergy()-1,24
## Column 502) fBodyGyro-bandsEnergy()-25,48
## Column 503) fBodyAccMag-mean()
## Column 504) fBodyAccMag-std()
## Column 505) fBodyAccMag-mad()
## Column 506) fBodyAccMag-max()
## Column 507) fBodyAccMag-min()
## Column 508) fBodyAccMag-sma()
## Column 509) fBodyAccMag-energy()
## Column 510) fBodyAccMag-iqr()
## Column 511) fBodyAccMag-entropy()
## Column 512) fBodyAccMag-maxInds
## Column 513) fBodyAccMag-meanFreq()
## Column 514) fBodyAccMag-skewness()
## Column 515) fBodyAccMag-kurtosis()
## Column 516) fBodyBodyAccJerkMag-mean()
## Column 517) fBodyBodyAccJerkMag-std()
## Column 518) fBodyBodyAccJerkMag-mad()
## Column 519) fBodyBodyAccJerkMag-max()
## Column 520) fBodyBodyAccJerkMag-min()
## Column 521) fBodyBodyAccJerkMag-sma()
## Column 522) fBodyBodyAccJerkMag-energy()
## Column 523) fBodyBodyAccJerkMag-iqr()
## Column 524) fBodyBodyAccJerkMag-entropy()
## Column 525) fBodyBodyAccJerkMag-maxInds
## Column 526) fBodyBodyAccJerkMag-meanFreq()
## Column 527) fBodyBodyAccJerkMag-skewness()
## Column 528) fBodyBodyAccJerkMag-kurtosis()
## Column 529) fBodyBodyGyroMag-mean()
## Column 530) fBodyBodyGyroMag-std()
## Column 531) fBodyBodyGyroMag-mad()
## Column 532) fBodyBodyGyroMag-max()
## Column 533) fBodyBodyGyroMag-min()
## Column 534) fBodyBodyGyroMag-sma()
## Column 535) fBodyBodyGyroMag-energy()
## Column 536) fBodyBodyGyroMag-iqr()
## Column 537) fBodyBodyGyroMag-entropy()
## Column 538) fBodyBodyGyroMag-maxInds
## Column 539) fBodyBodyGyroMag-meanFreq()
## Column 540) fBodyBodyGyroMag-skewness()
## Column 541) fBodyBodyGyroMag-kurtosis()
## Column 542) fBodyBodyGyroJerkMag-mean()
## Column 543) fBodyBodyGyroJerkMag-std()
## Column 544) fBodyBodyGyroJerkMag-mad()
## Column 545) fBodyBodyGyroJerkMag-max()
## Column 546) fBodyBodyGyroJerkMag-min()
## Column 547) fBodyBodyGyroJerkMag-sma()
## Column 548) fBodyBodyGyroJerkMag-energy()
## Column 549) fBodyBodyGyroJerkMag-iqr()
## Column 550) fBodyBodyGyroJerkMag-entropy()
## Column 551) fBodyBodyGyroJerkMag-maxInds
## Column 552) fBodyBodyGyroJerkMag-meanFreq()
## Column 553) fBodyBodyGyroJerkMag-skewness()
## Column 554) fBodyBodyGyroJerkMag-kurtosis()
## Column 555) angle(tBodyAccMean,gravity)
## Column 556) angle(tBodyAccJerkMean),gravityMean)
## Column 557) angle(tBodyGyroMean,gravityMean)
## Column 558) angle(tBodyGyroJerkMean,gravityMean)
## Column 559) angle(X,gravityMean)
## Column 560) angle(Y,gravityMean)
## Column 561) angle(Z,gravityMean)










