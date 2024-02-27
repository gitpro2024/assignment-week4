# Codebook for course assignment: Getting and Cleaning Data (Coursera) #
February 2024

## Introduction
This is the codebook for the dataset that describes the variables, the data, and any transformations or work that were performed to clean up the Smartphone data obtained from the UCI Machine Learning Repository,
as part of the final assignment in the course "Getting And Cleaning Data" from Coursera.

## Data
The assignment makes use of the Human Activity Recognition Using Smartphones Dataset, available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 
The Human Activity Recognition database is built from the recordings of 30 volunteers performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
The volunteers, who fall within an age bracket of 19-48 years, each performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II). 

The dataset includes the following files:

-  'features_info.txt': Shows information about the variables used on the feature vector.
-  'features.txt': List of all features.
-  'activity_labels.txt': Links the class labels with their activity name.
-   'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Variables
The following variables can be derived from the raw data:

### subject
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### activity
Activity identifier, string with 6 possible values:
WALKING: subject was walking WALKING_UPSTAIRS: subject was walking upstairs WALKING_DOWNSTAIRS: subject was walking downstairs SITTING: subject was sitting STANDING: subject was standing LAYING: subject was laying Average of measurements
All measurements are floating-point values, normalised and bounded within [-1,1].

### signal
The measurements are classified in two domains:
Time-domain signals (variables prefixed by timeDomain), resulting from the capture of accelerometer and gyroscope raw signals, and frequency-domain signals (variables prefixed by frequencyDomain), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

####  Time-domain signals
Average time-domain body acceleration in the X and Y directions:
-  timeDomainBodyAccelerometerMeanX 
-  timeDomainBodyAccelerometerMeanY 
Standard deviation of the time-domain body acceleration in the X and Y directions:
-  timeDomainBodyAccelerometerStandardDeviationX 
-  timeDomainBodyAccelerometerStandardDeviationY 
Average time-domain gravity acceleration in the X, Y and Z directions:
-  timeDomainGravityAccelerometerMeanX 
-  timeDomainGravityAccelerometerMeanY 
Standard deviation of the time-domain gravity acceleration in the X and Y directions:
-  timeDomainGravityAccelerometerStandardDeviationX 
-  timeDomainGravityAccelerometerStandardDeviationY 
Average time-domain body acceleration jerk (derivation of the acceleration in time) in the X and Y directions:
-  timeDomainBodyAccelerometerJerkMeanX 
-  timeDomainBodyAccelerometerJerkMeanY 
Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X and Y directions:
-  timeDomainBodyAccelerometerJerkStandardDeviationX 
-  timeDomainBodyAccelerometerJerkStandardDeviationY 
Average time-domain body angular velocity in the X, Y and Z directions:
-  timeDomainBodyGyroscopeMeanX 
-  timeDomainBodyGyroscopeMeanY 
Standard deviation of the time-domain body angular velocity in the X and Y directions:
-  timeDomainBodyGyroscopeStandardDeviationX 
-  timeDomainBodyGyroscopeStandardDeviationY 
Average time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X and Y directions:
-  timeDomainBodyGyroscopeJerkMeanX 
-  timeDomainBodyGyroscopeJerkMeanY
Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:
-  timeDomainBodyGyroscopeJerkStandardDeviationX 
-  timeDomainBodyGyroscopeJerkStandardDeviationY 
Average and standard deviation of the time-domain magnitude of body acceleration:
-  timeDomainBodyAccelerometerMagnitudeMean 
-  timeDomainBodyAccelerometerMagnitudeStandardDeviation 
Average and standard deviation of the time-domain magnitude of gravity acceleration:
-  timeDomainGravityAccelerometerMagnitudeMean 
-  timeDomainGravityAccelerometerMagnitudeStandardDeviation 
Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):
-  timeDomainBodyAccelerometerJerkMagnitudeMean 
-  timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation 
Average and standard deviation of the time-domain magnitude of body angular velocity:
-  timeDomainBodyGyroscopeMagnitudeMean 
-  timeDomainBodyGyroscopeMagnitudeStandardDeviation 
Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):
-  timeDomainBodyGyroscopeJerkMagnitudeMean 
-  timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation 
####  Frequency-domain signals
Average frequency-domain body acceleration in the X and Y directions:
-  frequencyDomainBodyAccelerometerMeanX
-  frequencyDomainBodyAccelerometerMeanY
Standard deviation of the frequency-domain body acceleration in the X and Y directions:
-  frequencyDomainBodyAccelerometerStandardDeviationX
-  frequencyDomainBodyAccelerometerStandardDeviationY
Weighted average of the frequency components of the frequency-domain body acceleration in the X and Y directions:
-  frequencyDomainBodyAccelerometerMeanFrequencyX
-  frequencyDomainBodyAccelerometerMeanFrequencyY
Average frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X and Y directions:
-  frequencyDomainBodyAccelerometerJerkMeanX
-  frequencyDomainBodyAccelerometerJerkMeanY

Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X and Y directions:
-  frequencyDomainBodyAccelerometerJerkStandardDeviationX 
-  frequencyDomainBodyAccelerometerJerkStandardDeviationY 
Weighted average of the frequency components of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
-  frequencyDomainBodyAccelerometerJerkMeanFrequencyX 
-  frequencyDomainBodyAccelerometerJerkMeanFrequencyY 
Average frequency-domain body angular velocity in the X and Y directions:
-  frequencyDomainBodyGyroscopeMeanX 
-  frequencyDomainBodyGyroscopeMeanY 
Standard deviation of the frequency-domain body angular velocity in the X and Y directions:
-  frequencyDomainBodyGyroscopeStandardDeviationX 
-  frequencyDomainBodyGyroscopeStandardDeviationY 
Weighted average of the frequency components of the frequency-domain body angular velocity in the X, Y and Z directions:
-  frequencyDomainBodyGyroscopeMeanFrequencyX 
-  frequencyDomainBodyGyroscopeMeanFrequencyY  
Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration:
-  frequencyDomainBodyAccelerometerMagnitudeMean 
-  frequencyDomainBodyAccelerometerMagnitudeStandardDeviation 
-  frequencyDomainBodyAccelerometerMagnitudeMeanFrequency 
Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration jerk (derivation of the acceleration in time):
-  frequencyDomainBodyAccelerometerJerkMagnitudeMean 
-  frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation 
-  frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency 
Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity:
-  frequencyDomainBodyGyroscopeMagnitudeMean 
-  frequencyDomainBodyGyroscopeMagnitudeStandardDeviation 
-  frequencyDomainBodyGyroscopeMagnitudeMeanFrequency 
Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):
-  frequencyDomainBodyGyroscopeJerkMagnitudeMean 
-  frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation 
-  frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency


## Transformations
The following transformations were made to the raw data:

- The training and test sets were merged to create a single tidy data set.
- The measurements on the mean and standard deviation (i.e. signals containing the strings mean and std) were extracted for each measurement, and the others were discarded.
- The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names (see Identifiers section).
- The variable names were replaced with descriptive variable names (e.g. tBodyAcc-mean()-X was expanded to timeDomainBodyAccelerometerMeanX), using the following set of rules: Special characters (i.e. (, ), and -) were removed The initial f and t were expanded to frequencyDomain and timeDomain respectively. Acc, Gyro, Mag, Freq, mean, and std were replaced with Accelerometer, Gyroscope, Magnitude, Frequency, Mean, and StandardDeviation respectively. Replaced (supposedly incorrect as per source's features_info.txt file) BodyBody with Body.
- From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.
- The collection of the source data and the transformations listed above were implemented by the run_analysis.R R script (see README.md file for usage instructions).
