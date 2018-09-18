## Make sure to remove this before submitting
setwd("C:/Users/bobri/OneDrive/Coursera/Week_4_Project")

## Merge training and test datasets

mydatatest <- read.table("x_test.txt", header = FALSE)
mydatatrain <- read.table("x_train.txt", header = FALSE)
alldata <- rbind(mydatatest, mydatatrain)
##write.csv(alldata, "all.csv")

## Extract mean and standard deviation measures for each measurement

mean_values <- lapply(alldata, mean)
sd_values <- lapply(alldata, sd)

## Use descriptive activity names to name the activities in the data set
## use  names(alldata) [x] <- "text"

## Appropriately labels the data set with descriptive variable names.


##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.