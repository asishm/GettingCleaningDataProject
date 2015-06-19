############################################################
### COURSE PROJECT: Getting and Cleaning Data            ###
### AUTHOR: Asish Mahapatra                              ###
### GITHUB: kluge-iitk                                   ###
############################################################


### Please refer to the README.md for instructions on how
### to utilize this script
### NOTE: This script can take upto 20 seconds to run.
### DEPENDENCIES: This script requires the dplyr package to run

## SETUP ##
##################################################################################
# This section establishes variables for the paths to various files              #
# Main_URL is the path to the data set folder                                    #
# the other variables are the relative paths with respect to the data set folder #
##################################################################################

Main_URL <- "./GettingCleaningData/UCI HAR Dataset"
x_testurl <- "test/X_test.txt"
y_testurl <- "test/y_test.txt"
x_trainurl <- "train/X_train.txt"
y_trainurl <- "train/y_train.txt"
subtesturl <- "test/subject_test.txt"
subtrainurl <- "train/subject_train.txt"
featuresurl <- "features.txt"
activityurl <- "activity_labels.txt"

##########################################################################
## STEP1: Merges the training and the test sets to create one data set. ##
##########################################################################

x_test_data <- read.table(paste(Main_URL, x_testurl, sep = "/"), colClasses = "numeric")
x_train_data <- read.table(paste(Main_URL, x_trainurl, sep = "/"), colClasses = "numeric")

merged_data <- rbind(x_train_data, x_test_data)

# read the feature names

features <- read.table(paste(Main_URL, featuresurl, sep = "/"))

#####################################################################################################
## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. ##
## Used a filter that accepts only feature names that have "mean()" or "std()"                     ##
#####################################################################################################

acceptedvars <- grepl("mean\\(\\)|std\\(\\)", features[[2]])
merged_data <- merged_data[, acceptedvars]

## load the subjects data, merge the test and train sets and add to the merged data set

sub_test_data <- read.table(paste(Main_URL, subtesturl, sep = "/"), colClasses = "integer")
sub_train_data <- read.table(paste(Main_URL, subtrainurl, sep = "/"), colClasses = "integer")

sub_data <- rbind(sub_train_data, sub_test_data)

merged_data$subject <- sub_data$V1

#########################################################################################
## STEP 3: Uses descriptive activity names to name the activities in the data set      ##
## load the test and train data for activity, merge them and load the activity labels  ##
#########################################################################################

y_test_data <- read.table(paste(Main_URL, y_testurl, sep = "/"), colClasses = "integer")
y_train_data <- read.table(paste(Main_URL, y_trainurl, sep = "/"), colClasses = "integer")

activitylabel <- read.table(paste(Main_URL, activityurl, sep = "/"))
activities <- rbind(y_train_data, y_test_data)

#########################################################################################
## define function to convert the numeric activity data to activity names              ##
## add activity data to the merged data set and convert activity numeric data to names ##
#########################################################################################

num_to_label_activity <- function(n){as.character(activitylabel[n,2])}
merged_data$activities <- num_to_label_activity(activities$V1)

#########################################################################################
## STEP 4: Appropriately labels the data set with descriptive variable names.          ##
## Selects appropriate feature names and assigns them to names(merged_data)            ##
#########################################################################################

names(merged_data) <- c(as.character(features[[2]][acceptedvars]), "subject", "activities")

library(dplyr)

#########################################################################################
## STEP 5: From the data set in step 4, creates a second, independent tidy data set    ##
## with the average of each variable for each activity and each subject.               ##
## group the merged data by activities and then by subject                             ##
## summarise the grouped data and calculate the means of the other variables           ##
## grouped by activity and subject                                                     ##
#########################################################################################

grouped_data <- group_by(merged_data, activities, subject)
final_data <- summarise_each(grouped_data, funs(mean))
