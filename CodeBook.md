<h1>This codebook refers to the run_analysis.R script.</h1>

<h2>01. Reading data and assigning to data frames</h2>
	<li>features <- features.txt : 561 rows, 2 columns
	<br>The features are the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
	<li>activities <- activity_labels.txt : 6 rows, 2 columns
	<br>The activities contains a list and their corresponding measurements and its codes (labels)
	<li>subject_test <- test/subject_test.txt : 2947 rows, 1 column
	<br>The test data of 9/30 volunteer test subjects being observed
	<li>x_test <- test/X_test.txt : 2947 rows, 561 columns
	<br>contains recorded features test data
	<li>y_test <- test/y_test.txt : 2947 rows, 1 columns
	<br>contains test data of activities’code labels
	<li>subject_train <- test/subject_train.txt : 7352 rows, 1 column
	<br>The train data of 21/30 volunteer subjects being observed
	<li>x_train <- test/X_train.txt : 7352 rows, 561 columns
	<br>contains recorded features train data
	<li>y_train <- test/y_train.txt : 7352 rows, 1 columns
	<br>contains train data of activities’code labels

<h2>02. Step 01 - Merging training and testing data sets</h2>
	Using the rbind() function;<br>
		<li> 1. setX (10299 rows, 561 columns) is created by merging x_train and x_test
		<li> 2. setY (10299 rows, 1 column) is created by merging y_train and y_test
		<li> 3. Subject (10299 rows, 1 column) is created by merging subject_train and subject_test

<br>Using the cbind() function;
		<li>MergedData (10299 rows, 563 column) is created by merging Subject, setY and setX

<h2>03. Step 02 - Extracting only the measurements on the mean and standard deviation for each measurement</h2>
	TidyData (10299 rows, 88 columns) is created by subsetting MergedData, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

<h2>04. Step 03 - Adding descriptive activity names to name the activities in the data sets</h2>
	Entire numbers in code column of the TidyData replaced with relevant activity from second column of the activities variable

<h2>05. Step 04 - Appropriately labeling the data set with descriptive variable names</h2>
		<li> code column in TidyData renamed into activities
		<li> All Acc in column’s name replaced by Accelerometer
		<li> All Gyro in column’s name replaced by Gyroscope
		<li> All BodyBody in column’s name replaced by Body
		<li> All Mag in column’s name replaced by Magnitude
		<li> All start with character f in column’s name replaced by Frequency
		<li> All start with character t in column’s name replaced by Time

<h2>06. Step 05 - Creating a second, independent tidy data set with the average of each variable for each activity and each subject, from the data set in step 04.</h2>
	FinalTidyData (180 rows, 88 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.
	<br>Export FinalTidyData into FinalTidyData.txt file.
