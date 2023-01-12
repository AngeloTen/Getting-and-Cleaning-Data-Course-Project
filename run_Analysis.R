library(dplyr)

# Reading data and assigning to data frames

subject_test <- read.table("G:/R/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("G:/R/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("G:/R/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("G:/R/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("G:/R/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("G:/R/UCI HAR Dataset/train/y_train.txt", col.names = "code")
features <- read.table("G:/R/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("G:/R/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Step 01 - Merging training and testing data sets

setX <- rbind(x_train, x_test)
setY <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
MergedData <- cbind(Subject, setY, setX)

# Step 02 - Extracting only the measurements on the mean and standard deviation for each measurement

TidyData <- MergedData %>% select(subject, code, contains("mean"), contains("std"))

# Step 03 - Adding descriptive activity names to name the activities in the data set

TidyData$code <- activities[TidyData$code, 2]

# Step 04 - Appropriately labeling the data set with descriptive variable names

names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "Standard Deviation", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

# Step 05 - Creating a second, independent tidy data set with the average of each variable for each activity and each subject, from the data set in step 04.

FinalTidyData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalTidyData, "FinalTidyData.txt", row.name=FALSE)