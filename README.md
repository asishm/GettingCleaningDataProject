# Getting and Cleaning Data Course Project
Course Project repository for Getting and Cleaning Data (part of Data Science Specialization on Coursera)
*********************************************************************************************************

The purpose of this project is to collect, work with, and clean a data set and prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Important information for running the script

- Requires the dplyr library/package
- Please note that the script can take 20 seconds to execute
- The script produces the wide-form of tidy data

## Assumptions

- The script assumes that the data has been extracted from the zip file. Click [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to access the zipped data files for this analysis.
- Assumes that the UCI HAR Dataset directory is in the current working directory i.e. `file.exists("UCI HAR Dataset") == TRUE`
- The UCI HAR Dataset has been unzipped.
- Run the script by using `source("run_analysis.R")` after ensuring that the script and the data directory are in the same folder.

## Steps taken

- **First step** is to merge together the `X_test` and `X_train` datasets into one dataset. This was achieved by using `read.table` and subsequently using `rbind` to merge the datasets together.

- **Second step** involved extracting only the measurements on the mean and standard deviation. Reading the README available in the *UCI HAR Dataset* folder, only those measurements that have **mean()** or **std()** represent measurements on the mean and standard deviation. They were selected using `grepl` on the `features` data set. The features that had **angle()** were not considered when filtering because they are not an actual measurement, but rather, are calculated angles between the relevant vectors. The merged dataset was filtered by these columns.

- **Third step** asks to use descriptive activity names in the dataset. A *function* was created that converted the integer labels 1-6 to the corresponding activity name derived from the `activity_labels` dataset. This function was then applied to the merged data set of `ytest` and `ytrain` to have descriptive names. This merged dataset was finally added to the original dataset with the variable name `activities`.

- **Fourth step** requires using appropriate variable names for the variables in the dataset. The filtered columns that were selected in step 2 was assigned to the names of the dataset by assigning to `names(merged_data)`. The conversion to `as.character` was necessitated because the original labels were factors.

- **Fifth and final step** entailed creating a new dataset of the means of the filtered variables grouped by the subject and activity. This was done by using the `dplyr` package and the functions `group_by` and `summarise_each`.