# define file name vars
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "samsung.zip"
zipDir <- "UCI HAR Dataset"

# download raw data file if doesn't already exist
if(!file.exists(zipFile)){
  download.file(fileUrl
                , destfile = zipFile
                , method = "curl")
}

# unzip the downloaded zip file
unzip(zipFile, overwrite = TRUE,
      , exdir = ".", unzip = "internal")

curDir<-getwd()   # location of current directory
setwd(zipDir)


features<-read.table("features.txt")["V2"]
activity_labels<-read.table("activity_labels.txt")["V2"]

# find mean and std data 
mean_std<-grep("mean|std",features$V2) 

X_train<-read.table("train/X_train.txt")
names(X_train)<-features$V2

y_train<-read.table("train/y_train.txt")
names(y_train)<-names(y_train)<-"labels"

subject_train<-read.table("train/subject_train.txt")
names(subject_train)<-"subjects"

X_test<-read.table("test/X_test.txt")
names(X_test)<-features$V2

y_test<-read.table("test/y_test.txt")
names(y_test)<-"labels"

subject_test<-read.table("test/subject_test.txt")
names(subject_test)<-"subjects"

setwd(curDir)

# Extract only the measurements on the mean and standard deviation for each measurement
mean_std_col<-colnames(X_test)[mean_std]
X_test_mean_std<-cbind(subject_test,y_test,subset(X_test,select=mean_std_col))
X_train_mean_std<-cbind(subject_train,y_train,subset(X_train,select=mean_std_col))

# Merges the training and the test sets to create one data set.
merge_set<-rbind(X_test_mean_std, X_train_mean_std)


# Create a second, independent tidy data set with the average of each variable for each activity and each subject
avg_set<-aggregate(merge_set[,3:ncol(merge_set)],list(Subject=merge_set$subjects, Activity=merge_set$labels), mean)
avg_set<-avg_set[order(avg_set$Subject),]

# Use descriptive activity names to name the activities in the data set
avg_set$Activity<-activity_labels[avg_set$Activity,]

write.table(avg_set, file="./finaldata.txt", sep="\t", row.names=FALSE)