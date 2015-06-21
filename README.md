# Getting and Cleaning Data Course Project

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Objectives

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How does run_analysis.R work

1. Downloads the data from provided website link if not already downloaded.
2. Unzips the file.
3. Reads the features and activity labels from the unzipped file.
4. Read features list and extract a column list of terms with means or standard deviation only.
5. Reads data from training and test sets.
6. Creates a subset of training and test sets to extract only mean and standard deviation values.
7. Merge training and test sets.
8. Create another dataset with the average of each variable for each activity and each subject.
9. Assign descriptive names to activities in dataset.
10. Creates a tab seperated file from dataset.
