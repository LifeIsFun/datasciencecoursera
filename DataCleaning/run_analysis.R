# Class 4 Coursera Data cleaning project

# Project submission
# 1. The submitted data set is tidy.
# 2. The Github repo contains the required scripts.
# 3. GitHub contains a code book that modifies and updates the 
    # available codebooks with the data to indicate all the variables 
    # and summaries calculated, along with units, 
    # and any other relevant information.
# 4. The README that explains the analysis files is clear and understandable.

# This script run_analysis.R does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Set Working Directory

# source of data
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# set working directory
setwd("~/Desktop/RRef/DataScienceCoursera/DataCleaningProject")

## Read Data
# subject, 1 col, identifies the subject who performed the activity
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# test data, 561 col, no header, each column is described by feature in features.txt
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")

# activity, 1 col, range: 1:6, key given in activity_labels.txt
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# feature list = X column description
# activity labels = activity key for y datasets
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  



# 1. Merges the training and the test sets to create one data set.

# combine test and train data
outcomes <- rbind(X_train,X_test)
names(outcomes) <- features[ ,2]

activityID <- rbind(y_train,y_test)
names(activityID) = 'activityID'

subject <- rbind(subject_train,subject_test)
names(subject) <- 'subject'

# combine all data into one set
data <- cbind(subject, activityID, outcomes)
View(data)
dim(data)                # 10299 x 563



# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean.std <- grep("mean|std|activityID|subject", names(data))
data <- data[ ,mean.std]
dim(data)               # 10299 x 81



# 3. Appropriately labels the data set with descriptive activity names.
# create new column that assigns activity name to activity value
activity <- factor(data$activityID, labels = activity_labels[ ,2])

# place activity column next to activity ID
data <- cbind(data[ ,1:2], activity, data[, -(1:2)])
names(data)[1:5]

# 4. Appropriately labels the data set with descriptive variable names.

# done in step one, when column names were attached to data.

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# check if reshape2 package is installed
if (!"reshape2" %in% installed.packages()) {
	install.packages("reshape2")
}
library("reshape2")

# melt data to tall skinny data and cast means. 
dataMelt <- melt(data, id=c("subject","activity"))
tidy <- dcast(dataMelt, subject+activity ~ variable, mean)
dim(tidy)     # 180 x 82

# write the tidy data set to a file
write.csv(tidy, "tidy.csv", row.names=FALSE)

View(tidy)
