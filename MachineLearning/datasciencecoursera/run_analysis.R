library(data.table)

# read the features, activity labels
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, as.is = TRUE, col.names = c("id", "name"))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, as.is = TRUE, col.names=c("activityID", "activity"))
activities$activity <- as.factor(activities$activity)

# load test and training sets and the activities
test.data <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, col.names = features$name, check.names = FALSE)
test.activity <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = c("activityID"))
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("subjectID"))

train.data <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, col.names = features$name, check.names = FALSE)
train.activity <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = c("activityID"))
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = c("subjectID"))

# keep only columns with mean() and std()
columnsToKeep <- grep(".*mean|.*Mean|.*mean\\(\\)|.*std\\(\\)", features$name)
test.data <- test.data[ , columnsToKeep]
train.data <- train.data[ , columnsToKeep]

# include (bind) activity and subject column
test.data$activityID <- test.activity$activityID
train.data$activityID <- train.activity$activityID

test.data$subjectID <- test.subject$subjectID
train.data$subjectID <- train.subject$subjectID

# merge training and test set
merged.data <- rbind(test.data, train.data)

# join activity and data to add a column for descriptive activity name
merged.data <- merge(merged.data, activities, by.x = "activityID", by.y = "activityID", all = TRUE)

# generate tidy data set through write.table. Output set was grouped by subject and activity and column means were taken
tidy.data <- aggregate(. ~activity + subjectID, merged.data, mean)
write.table(tidy.data, file = "tidy-data.txt", row.names = FALSE)
