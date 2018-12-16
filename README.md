---
title: "Readme file"
author: "Robert Richardson"
date: "December 15, 2018"
---


## Final project for Getting and Cleaning Data class

For this project data from the Human Activity Recognition Using Smartphones Dataset. The purpose of the project was to obtain data and create a tidy data set with a subset of the original data for processing.

The steps followed for this project included:

- Reading in the original training and test data sets

- Merging the datasets into a single dataset called Merged_Data

- Using the Merged_Data file use the select command to extract the mean and standard deviation measures to create a new file called SD_M_Data

- A new file was created from the SD_M_Data file using the group_by and summarise_all functions to find the average of each variable for each activity and each subject

- A file called FinalData.txt was written to disk using the write.table function
