# Description
**************
This CodeBook describes the tidy data set that is produced after running the `run_analysis.R` script on the raw data available in the UCI HAR Dataset.

From the raw data made available, various features were measured and estimated. From the 561 features that were evaluated in the raw data, only those features that involved the mean or the standard deviation were filtered out and used for further analysis in generating the tidy dataset.

The tidy data, produced in wide form has 180 rows and 68 columns. The data shows the summarized raw data by evaluating the average of the filtered features that have been grouped by activity and then by subject. There are 6 activities, 30 subjects and 66 features.

## Variables Description

- **activity**:
  - Describes the activity from which the data was collected.
  - Contains 6 levels: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
  - Each activity has 30 different observations.
  
- **subject**:
  - Describes the integer label of the person from whom the data was collected.
  - Contains 30 levels: 1, 2, 3, ... , 30
  - Each subject has 6 different observations
  
- **tBodyAcc.mean.X, tBodyAcc.mean.Y, tBodyAcc.mean.Z**:
  - Shows the grouped average of the mean of the time-domain body acceleration values in the three dimensions X,Y,Z.
  
- **tBodyAcc.std.X, tBodyAcc.std.Y, tBodyAcc.std.Z**:
  - Shows the grouped average of the standard deviation of the time-domain body acceleration values in the three dimensions X,Y,Z.
  
- **tGravityAcc.mean.X, tGravityAcc.mean.Y, tGravityAcc.mean.Z**:
  - Shows the grouped average of the mean of the time-domain gravity acceleration in the three dimensions X,Y,Z.
  
- **tGravityAcc.std.X, tGravityAcc.std.Y, tGravityAcc.std.Z**:
  - Shows the grouped average of the standard deviation of the time-domain gravity acceleration in the three dimensions X,Y,Z.
  
- **tBodyAccJerk.mean.X, tBodyAccJerk.mean.Y, tBodyAccJerk.mean.Z**:
  - Shows the grouped average of the mean of the time-domain value of jerk of body acceleration in the three dimensions X,Y,Z.
  
- **tBodyAccJerk.std.X, tBodyAccJerk.std.Y, tBodyAccJerk.std.Z**:
  - Shows the grouped average of the standard deviation of the time-domain value of jerk of body acceleration in the three dimensions X,Y,Z.
  
- **tBodyGyro.mean.X, tBodyGyro.mean.Y, tBodyGyro.mean.Z**:
  - Shows the grouped average of the mean of the time-domain body gyro in the three dimensions X,Y,Z.
  
- **tBodyGyro.std.X, tBodyGyro.std.Y, tBodyGyro.std.Z**:
  - Shows the grouped average of the standard deviation of the time-domain body gyro in the three dimensions X,Y,Z.
  
- **tBodyGyroJerk.mean.X, tBodyGyroJerk.mean.Y, tBodyGyroJerk.mean.Z**:
  - Shows the grouped average of the mean of the time-domain value of the jerk of body gyro in the three dimensions X,Y,Z.
  
- **tBodyGyroJerk.std.X, tBodyGyroJerk.std.Y, tBodyGyroJerk.std.Z**:
  - Shows the grouped average of the standard deviation of the time-domain value of the jerk of body gyro in the three dimensions X,Y,Z:
  
- **tBodyAccMag.mean**:
  - Shows the grouped average of the mean of the time-domain magnitude of body acceleration.
  
- **tBodyAccMag.std**:
  - Shows the grouped average of the standard deviation of the time-domain magnitude of body acceleration.
  
- **tGravityAccMag.mean**:
  - Shows the grouped average of the mean of the time-domain magnitude of the gravity acceleration.
  
- **tGravityAccMag.std**:
  - Shows the grouped average of the standard deviation of the time-domain magnitude of the gravity acceleration.
  
- **tBodyAccJerkMag.mean**:
  - Shows the grouped average of the mean of the time-domain magnitude of the jerk of body acceleration.
  
- **tBodyAccJerkMag.std**:
  - Shows the grouped average of the standard deviation of the time-domain magnitude of the jerk of body acceleration.
  
- **tBodyGyroMag.mean**:
  - Shows the grouped average of the mean of the time-domain magnitude of body gyro.
  
- **tBodyGyroMag.std**:
  - Shows the grouped average of the standard deviation of the time-domain magnitude of body gyro.
  
- **tBodyGyroJerkMag.mean**:
  - Shows the grouped average of the time-domain magnitude of the jerk of body gyro.
  
- **tBodyGyroJerkMag.std**:
  - Shows the grouped average of the standard deviation of the time-domain magnitude of the jerk of body gyro.
  
- **fBodyAcc.mean.X, fBodyAcc.mean.Y, fBodyAcc.mean.Z**:
  - Shows the grouped average of the mean of the frequency-domain body acceleration in the three dimensions X,Y,Z.
  
- **fBodyAcc.std.X, fBodyAcc.std.Y, fBodyAcc.std.Z**:
  - Shows the grouped average of the standard deviation of the frequency-domain body acceleration in the three dimensions X,Y,Z.
  
- **fBodyAccJerk.mean.X, fBodyAccJerk.mean.Y, fBodyAccJerk.mean.Z**:
  - Shows the grouped average of the mean of the frequency-domain jerk of body acceleration in the three dimensions X,Y,Z.
  
- **fBodyAccJerk.std.X, fBodyAccJerk.std.Y, fBodyAccJerk.std.Z**:
  - Shows the grouped average of the standard deviation of the frequency-domain jerk of body acceleration in the three dimensions X,Y,Z.
  
- **fBodyGyro.mean.X, fBodyGyro.mean.Y, fBodyGyro.mean.Z**:
  - Shows the grouped average of the mean of the frequency-domain body gyro in the three dimensions X,Y,Z.
  
- **fBodyGyro.std.X, fBodyGyro.std.Y, fBodyGyro.std.Z**:
  - Shows the grouped average of the standard deviation of the frequency-domain body gyro in the three dimensions X,Y,Z.
  
- **fBodyAccMag.mean**:
  - Shows the grouped average of the mean of the frequency-domain magnitude of body acceleration.
  
- **fBodyAccMag.std**:
  - Shows the grouped average of the standard deviation of the frequency-domain magnitude of body acceleration.
  
- **fBodyAccJerkMag.mean**:
  - Shows the grouped average of the mean of the frequency-domain magnitude of jerk of body acceleration.
  
- **fBodyAccJerkMag.std**:
  - Shows the grouped average of the standard deviation of the frequency-domain magnitude of jerk of body acceleration.

- **fBodyGyroMag.mean**:
  - Shows the grouped average of the mean of the frequency-domain magnitude of body gyro.

- **fBodyGyroMag.std**:
  - Shows the grouped average of the standard deviation of the frequency-domain magnitude of body gyro.

- **fBodyGyroJerkMag.mean**:
  - Shows the grouped average of the mean of the frequency-domain magnitude of jerk of body gyro.

- **fBodyGyroJerkMag.std**:
  - Shows the grouped average of the standard deviation of the frequency-domain magnitude of jerk of body gyro.
