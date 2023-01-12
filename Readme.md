This repo contains project of [AngeloTen](https://github.com/AngeloTen) done for Getting and Cleaning Data Course.

Dataset
<br>[Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Files
<br><li>CodeBook.md a code book that describes the variables, the data, and any transformations or work done

<li>run_analysis.R performs the data preparation and then followed by the 5 steps:
<br>&nbsp 1. Merges the training and the test sets to create one data set.
<br>&nbsp 2. Extracting only the measurements on the mean and standard deviation for each measurement
<br>&nbsp 3. Adding descriptive activity names to name the activities in the data set
<br>&nbsp 4. Appropriately labeling the data set with descriptive variable names
<br>&nbsp 5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject, from the data set in step 04.
<br><li>FinalTidyData.txt is the exported final data after going through all the sequences described above.
