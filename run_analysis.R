library(plyr)

#Read files for test and train 
TrainDataX <- read.table("./UCI HAR Dataset/train/X_train.txt")
TrainDataY <- read.table("./UCI HAR Dataset/train/Y_train.txt")
TrainSub   <- read.table("./UCI HAR Dataset/train/subject_train.txt")

TestDataX  <- read.table("./UCI HAR Dataset/test/X_test.txt")
TestDataY  <- read.table("./UCI HAR Dataset/test/Y_test.txt")
TestSub    <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Merge X (features), Y (activity) data set and subjects
DataX <- rbind(TrainDataX, TestDataX)
DataY <- rbind(TrainDataY, TestDataY)

Subjects <- rbind(TrainSub, TestSub)
names(Subjects) <- "Subject"

#Get feature data for X - select indices only for Mean and STD
featuresDF <- read.table("./UCI HAR Dataset/features.txt")
featuresMS <- grep("mean\\(\\)|std\\(\\)", featuresDF[,2])

#Subset only mean and STD for X data set
DataX <- DataX[, featuresMS]

#Update column names for X DATA
names(DataX) <- featuresDF[featuresMS,2]

#Update labels for activies 
ActivitiesY <- read.table("./UCI HAR Dataset/activity_labels.txt")
DataY[,1] <- ActivitiesY[DataY[,1], 2]
names(DataY) <- "Activity"

FinalData <- cbind(Subjects, DataX, DataY)

#Tidy Data Set (Average) 
AverageDF <- ddply(FinalData, .(Subject, Activity), function(x) colMeans(x[, 2:67]))
AverageDF
