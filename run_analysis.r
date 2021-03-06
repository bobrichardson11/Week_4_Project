## Make sure to remove this before submitting
setwd("C:/Users/bobri/OneDrive/Coursera/Week_4_Project/")
library(dplyr)
filename <- "Coursera_DS3_Final.zip"



##Read in all the data
features <- read.table("data/features.txt", col.names = c("n","functions"))
activities <- read.table("data/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("data/test/subject_test.txt", col.names = "subject")
x_test <- read.table("data/test/X_test.txt", col.names = features$functions)
y_test <- read.table("data/test/y_test.txt", col.names = "code")
subject_train <- read.table("data/train/subject_train.txt", col.names = "subject")
x_train <- read.table("data/train/X_train.txt", col.names = features$functions)
y_train <- read.table("data/train/y_train.txt", col.names = "code")

## Merge the training and test datasets
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

## Extract mean and standard deviation measures for each measurement and
## use descriptive activity names to name the activities in the data set

SD_M_Data <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))
SD_M_Data$code <- activities[SD_M_Data$code, 2]

names(SD_M_Data)[2] = "activity"
names(SD_M_Data)<-gsub("Acc", "Accelerometer", names(SD_M_Data))
names(SD_M_Data)<-gsub("Gyro", "Gyroscope", names(SD_M_Data))
names(SD_M_Data)<-gsub("BodyBody", "Body", names(SD_M_Data))
names(SD_M_Data)<-gsub("Mag", "Magnitude", names(SD_M_Data))
names(SD_M_Data)<-gsub("^t", "Time", names(SD_M_Data))
names(SD_M_Data)<-gsub("^f", "Frequency", names(SD_M_Data))
names(SD_M_Data)<-gsub("tBody", "TimeBody", names(SD_M_Data))
names(SD_M_Data)<-gsub("-mean()", "Mean", names(SD_M_Data), ignore.case = TRUE)
names(SD_M_Data)<-gsub("-std()", "STD", names(SD_M_Data), ignore.case = TRUE)
names(SD_M_Data)<-gsub("-freq()", "Frequency", names(SD_M_Data), ignore.case = TRUE)
names(SD_M_Data)<-gsub("angle", "Angle", names(SD_M_Data))
names(SD_M_Data)<-gsub("gravity", "Gravity", names(SD_M_Data))


## From the data set in step 4, creates a second, independent tidy data 
## set with the average of each variable for each activity and each subject.

FinalData <- SD_M_Data %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)



