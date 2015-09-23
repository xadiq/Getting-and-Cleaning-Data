Introduction

The script run_analysis.R does following as per instruction in course project.

1 -  Read all files for subject data, training data and test data.

2 -  Merge training dataset with test dataset for measurement and create data set by name DataX
3 -  Merge training dataset with test dataset for activities  and create data set by name DataY
4 -  Merge training dataset with test dataset for subjects and create data set by name Subjects. Also, changes to appropriate column name
5 -  Read features file to idetify indices for mean and standard deviation function. Indices are stored in vector featuresMS
6 -  Using indices from vector featuresMS, subset DataX frame to get measurement column only for mean and standard deviation
7 -  Read activity file to get description for each activity
8 -  Update activity dataset (DataY) with appropriate description from step 7.
9 -  Update column name for activity data set
10 - merge all DataX, DataY and Subjects dataset using cbind into FinalData data set
11 - Create Tidy data set with the average of each variable for each activity and each subject.
12 - run_analysis finally returs dataset AverageDF
