# Coursera: Getting and cleaning data, assignment-week4
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The tidy data should be prepared such that it can be used for later analysis.
Successful submission includes the following three components: 1) a tidy data set 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work performed to clean up the data called CodeBook.md. 

This README.md contains the scripts used, it explains how all of the scripts work and how they are connected.

# Data
The data is publically available for dowloand here:
>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following code downloads the data and saves it as a csv file.

`download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", data.csv, method="curl`

# Read in data from the Dataset 
This code will read in the data from the UCI HAR Dataset. It transforms the column names to help with the future merge of these information sets.

```
features <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activity_labels <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
X_test <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/test/y_test.txt", col.names = c("code"))
subject_train <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
X_train <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/tej/mysync/Userprofile/Desktop/Datacamp/Coursera 4/UCI HAR Dataset/train/y_train.txt", col.names = c("code"))
```

# Step 1 : Merging the test and training sets to create one data set
The following code facilitates the merge by creating four dataframes from the existing information.
First we can bind rows from the X_train and X_test tables:
`X <- rbind(X_train, X_test)`

Doing the same with the y_train and y_test tables:
`Y <- rbind(y_train, y_test)`

.. and also for the subject tables:
`Subject <- rbind(subject_train, subject_test)`

These newly created dataframes X, Y and Subject can then be merged together using cbind: 
`Merged_Data <- cbind(Subject, Y, X)`

# Step 2 :Extracting only the measurements on the mean and standard deviation for each measurement
Based on our work in step 1, we can now create a tidy data set that consists of the newly merged data. 
Using the following code, we can specify that only the mean and standard deviations for each measurement are included:

`TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))`

# Step 3 :Assigning descriptive activity names
We can then assign the descriptive activity names to the activities in the TidyData set as follows:

`TidyData$code <- activity_labels[TidyData$code, 2]`

# Step 4 :Labelling the data set 
To facilitate the use of the data set, we can add appropriate descriptive labels to the variable names as follows:
```
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
```

# Step 5 :Creating an independent tidy data set
Finally, we can produce an independent tidy data set with the average of each variable for each activity and each subject.
The R code that facilitates this is as follows:

`FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)
str(FinalData)`
