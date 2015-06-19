# This section establishes variables for the paths to various files
# Main_URL is the path to the data set folder
# the other variables are the relative paths with respect to the data set folder

Main_URL <- "./GettingCleaningData/UCI HAR Dataset"
x_testurl <- "test/X_test.txt"
y_testurl <- "test/y_test.txt"
x_trainurl <- "train/X_train.txt"
y_trainurl <- "train/y_train.txt"
subtesturl <- "test/subject_test.txt"
subtrainurl <- "train/subject_train.txt"
featuresurl <- "features.txt"
activityurl <- "activity_labels.txt"

# load the main test and train data set and merge them

x_test_data <- read.table(paste(Main_URL, x_testurl, sep = "/"))
x_train_data <- read.table(paste(Main_URL, x_trainurl, sep = "/"))

merged_data <- rbind(x_train_data, x_test_data)

# read the feature names and assign the names to the merged data set

features <- read.table(paste(Main_URL, featuresurl, sep = "/"))

names(merged_data) <- features[[2]]

# select those measurements that are either mean() or std() as required

acceptedvars <- grepl("mean\\(\\)|std\\(\\)", names(merged_data))
merged_data <- merged_data[, acceptedvars]

# load the subjects data, merge the test and train sets and add to the merged data set

sub_test_data <- read.table(paste(Main_URL, subtesturl, sep = "/"))
sub_train_data <- read.table(paste(Main_URL, subtrainurl, sep = "/"))

sub_data <- rbind(sub_train_data, sub_test_data)

merged_data$subject <- sub_data$V1

# load the test and train data for activity, merge them and load the activity labels

y_test_data <- read.table(paste(Main_URL, y_testurl, sep = "/"))
y_train_data <- read.table(paste(Main_URL, y_trainurl, sep = "/"))

activitylabel <- read.table(paste(Main_URL, activityurl, sep = "/"))
activities <- rbind(y_train_data, y_test_data)

# define function to convert the numeric activity data to activity names

num_to_label_activity <- function(n){as.character(activitylabel[n,2])}

# add activity data to the merged data set and convert activity numeric data to names

merged_data$activities <- num_to_label_activity(activities$V1)

library(dplyr)

# group the merged data by activities and then by subject

grouped_data <- group_by(merged_data, activities, subject)

# summarise the grouped data and calculate the means of the other variables grouped by activity and subject

final_data <- summarise_each(grouped_data, funs(mean))
