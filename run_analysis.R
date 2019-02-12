
## Read all training and test data into R
x_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

x_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")

## Read feature and activity information into R
features <- read.table(".\\UCI HAR Dataset\\features.txt")
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
features <- features[ ,2]

## Assign descriptive variable names and concatenate
colnames(x_test) <- features
colnames(x_train) <- features
colnames(y_test) <- "activity_id"
colnames(y_train) <- "activity_id"
colnames(subject_test) <- "subject_id"
colnames(subject_train) <- "subject_id"
colnames(activity_labels) <- c("activity_id", "activity_name")

train <- cbind(x_train, y_train, subject_train)
test <- cbind(x_test, y_test, subject_test)
data <- rbind(train, test)

## Filter based on column names containing mean or std
mean_std_filter <- grepl("mean|std|subject_id|activity_id", colnames(data))
data <- data[ ,mean_std_filter]

## Filter again to remove 'meanFreq()' picked up by previous
meanfreq_filter <- grepl("meanFreq", colnames(data))
data <- data[ ,!meanfreq_filter]

## Merge activity_labels to be more descriptive and remove id
data <- merge(data, activity_labels, by = "activity_id")
data$activity_id <- NULL

## Find mean of each subject + activity combination
data_tidy <- aggregate(. ~subject_id + activity_name, data, mean)
data_tidy <- data_tidy[order(data_tidy$subject_id, data_tidy$activity_name), ]


## Save table
write.table(data_tidy, file=".\\UCI HAR Dataset\\tidydata.txt", row.names=FALSE, col.names=TRUE)