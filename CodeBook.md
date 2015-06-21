# Code Book
This code books describes data, variables, transforms, units and other relevant information related to the analysis.

## Raw Data

A full description is available at the site where the data was obtained: [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Record Labels
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Raw Files
* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

## Tidy Data
Tidy data is created on execution of run_analysis.R code file. Tidy data is obtained by merging training and test sets and extracing only mean and standard deviation values from the merged dataset. Eventually create another dataset with the average of each variable for each activity and subject.

# Variables

The tidy data set contains :

* Subject identifier ranging from 1 to 30.
* an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* mean and standard dev of measurement collected from the accelerometer and gyroscope 3-axial raw signal (numeric value) e.g. tGravityAcc-mean()-X tGravityAcc-mean()-Y tGravityAcc-mean()-Z tGravityAcc-std()-X tGravityAcc-std()-Y tGravityAcc-std()-Z

Names of these variables are same as in features.txt but the values are averages of each variable for each activity and each subject.

Data is written in the file: "finaldata.txt"
