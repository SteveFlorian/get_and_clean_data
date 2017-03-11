#load necessary packages
library(dplyr)

#download zipped file, unzip, delete old zipped folder, and set the working
#directory to the folder containing all the unzipped data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              "UCI_HAR_Dataset.zip")
unzip(zipfile="UCI_HAR_Dataset.zip")
unlink("UCI_HAR_Dataset.zip")
setwd("UCI HAR Dataset")

#read all necessary tables into R
testx      <- read.table("./test/X_test.txt")
testy      <- read.table("./test/y_test.txt")
testsub    <- read.table("./test/subject_test.txt")
trainx     <- read.table("./train/X_train.txt")
trainy     <- read.table("./train/y_train.txt")
trainsub   <- read.table("./train/subject_train.txt")
features   <- read.table("./features.txt")
activities <- read.table("./activity_labels.txt")

#rename column names to be descriptive. note that the column in testy and trainy
#right now would be more accurately "activityID", but these values will shortly be
#replaced by actual activity names, and naming them just "activity" here saves a
#step of renaming the column again later.
colnames(trainx)     <- features$V2
colnames(testx)      <- features$V2
colnames(testsub)    <- "subject"
colnames(trainsub)   <- "subject"
colnames(testy)      <- "activity"
colnames(trainy)     <- "activity"
colnames(activities) <- c("activityID", "activity")

#combine test files into single table with matching subject, activity, and test
#results. do the same for all train files.
testall  <- cbind(testsub, testy, testx)
trainall <- cbind(trainsub, trainy, trainx)
#combine all data into a single frame, now containg every activity done by every
#subject, and the corresponding test results.
allData <- rbind(testall, trainall)

#subset to just columns that contain "mean" or "std", as well as the subject
#and activity identifier columns
selectcols <- allData[ , grep("subject|activity|mean|std", colnames(allData))]
#if you want to also remove meanFreq values, add the following to the code:
###selectcols <- selectcols[ , !grepl("meanFreq", colnames(selectcols))]

#replaces activity ID numbers with actual activity name
selectcols$activity <-
     activities$activity[match(selectcols$activity, activities$activityID)]

#clean up column names by removing instances of ()
colnames(selectcols) <- gsub("\\(\\)", "", colnames(selectcols))

#create new dataframe with caluclated mean of each variable for each activity
#and each subject
final <- selectcols %>%
          group_by(subject, activity) %>%
          summarize_all(funs(mean))

#write final table to a txt file named "finalframe"
write.table(final, file="finalframe.txt", row.names=FALSE)



