# Getting and Cleaning Data Week 4 Project

## Overview

This repo contains an R file titled 'run_analysis.R' which performs the actual transformation of data as well as 'Codebook.md' which goes over the information presented in the original dataset as well as the final 'tidy' dataset. 

### Codebook
'Codebook.md' goes over the information presented in the original dataset such as the original sources of the information as well as the procedure used for obtaining the data. It also describes the data presented in the final 'tidy' dataset produced by the R script.

### run_analysis.R
'run_analysis.R' is the script used to read, transform, and save the data and final representation of the data. It operates under the assumption that the original dataset which can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) has been extracted into the user's working directory. 
Listed below are the goals of the script:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
