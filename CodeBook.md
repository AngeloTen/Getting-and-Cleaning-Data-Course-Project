#This codebook refers to the run_analysis.R script.

#01. Reading data and assigning to data frames
	#features <- features.txt : 561 rows, 2 columns
	#The features are the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
	#activities <- activity_labels.txt : 6 rows, 2 columns
	#The activities contains a list and their corresponding measurements and its codes (labels)
	#subject_test <- test/subject_test.txt : 2947 rows, 1 column
	#The test data of 9/30 volunteer test subjects being observed
	#x_test <- test/X_test.txt : 2947 rows, 561 columns
	#contains recorded features test data
	#y_test <- test/y_test.txt : 2947 rows, 1 columns
	#contains test data of activities’code labels
	#subject_train <- test/subject_train.txt : 7352 rows, 1 column
	#The train data of 21/30 volunteer subjects being observed
	#x_train <- test/X_train.txt : 7352 rows, 561 columns
	#contains recorded features train data
	#y_train <- test/y_train.txt : 7352 rows, 1 columns
	#contains train data of activities’code labels

#02. Step 01 - Merging training and testing data sets
#	Using the rbind() function;
#		1. setX (10299 rows, 561 columns) is created by merging x_train and x_test
#		2. setY (10299 rows, 1 column) is created by merging y_train and y_test
#		3. Subject (10299 rows, 1 column) is created by merging subject_train and subject_test

	Using the cbind() function;
		MergedData (10299 rows, 563 column) is created by merging Subject, setY and setX

03. Step 02 - Extracting only the measurements on the mean and standard deviation for each measurement
	TidyData (10299 rows, 88 columns) is created by subsetting MergedData, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

04. Step 03 - Adding descriptive activity names to name the activities in the data sets
	Entire numbers in code column of the TidyData replaced with relevant activity from second column of the activities variable

05. Step 04 - Appropriately labeling the data set with descriptive variable names
		code column in TidyData renamed into activities
		All Acc in column’s name replaced by Accelerometer
		All Gyro in column’s name replaced by Gyroscope
		All BodyBody in column’s name replaced by Body
		All Mag in column’s name replaced by Magnitude
		All start with character f in column’s name replaced by Frequency
		All start with character t in column’s name replaced by Time

06. Step 05 - Creating a second, independent tidy data set with the average of each variable for each activity and each subject, from the data set in step 04.
	FinalTidyData (180 rows, 88 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.
	Export FinalTidyData into FinalTidyData.txt file.