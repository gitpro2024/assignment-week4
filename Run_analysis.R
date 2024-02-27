#load necessary libraries
library(tidyverse)

# Read in data from UCI HAR dataset & rename columns to aid with merge

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", data.csv, method="curl")
features <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
X_test <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/test/y_test.txt", col.names = c("code"))
activity_labels <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/train/y_train.txt", col.names = c("code"))


#Step 1 : Merging the test and training sets to create one data set
X <- rbind(X_train, X_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

TidyData$code <- activity_labels[TidyData$code, 2]

#Appropriately labels the data set with descriptive variable names.
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))


FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)


str(FinalData)

FinalData

