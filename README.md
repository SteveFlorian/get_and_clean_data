Getting and Cleaning Data - SFlorian
====================================

This repository contains all the necessary documents to complete the
Week 4 Assignment of the "Getting and Cleaning Data" course hosted on
coursera.com. The goals of this project are to:  
1. Merge the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for
each measurement.  
3. Use descriptive activity names to name the activities in the data
set.  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data
set with the average of each variable for each activity and each
subject.

Source Data
-----------

An experiment was carried out with a group of 30 volunteers within an
age bracket of 19-48 years. Each person performed six activities
(WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING,
LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using
its embedded accelerometer and gyroscope, the researchers captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.  
Additional information about the original data set can be found here:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>  
The raw data for this project can be found here:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Files Contained in This Repo
----------------------------

1.  README.md - overview of data and project documents, and discussion
    on process and results

2.  run\_analysis.R - R script that completes necessary steps

3.  CodeBook.md - document that lists and describes all variables

Discussion of Process and End Result
------------------------------------

The R script contains detailed explanatory comments for each step of the
process. However, there are several things to note:

1.  Merge the training and the test sets to create one data set. I have
    chosen to include the variables that show "meanFreq". There is
    debate among both Coursera students and mentors whether these
    variables should be included or not. Without a specific question to
    be answered from the data, no conclusive decision can be made. My
    approach was that it was better to have the data available, in case
    it does become necessary during a hypothetical analysis phase. Worst
    case, it can just be ignored or filtered out if not needed. But if
    it's not included, and does end up being needed, the analyst would
    need to go backwards and redo the initial data cleaning, which is
    not ideal.  
    However, I have also included code, "hidden" within a comment line
    in the script, that would exclude these variables. The user is free
    to leave this code as a comment, or to integrate it into the active
    commands - the script will work both ways.

2.  There is also debate about whether a long or a wide data form is, in
    this case, a "tidy" dataset. Once again, in drawing a conclusion we
    are limited by the fact that no specific analysis or question is
    being requested or posed. However, as mentioned in the rubric,
    either long or wide form is acceptable, and I have chosen to use a
    wide data form. This satisfies Wickham's 3 principles of tidy data
    [as described here](vita.had.co.nz/papers/tidy-data.pdf):
    1.  Each variable forms a column.  
    2.  Each observation forms a row.  
    3.  Each type of observational unit forms a table.

And also David Hood's "personal checklist" for tidy data [as described
here](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/):  
1. It has headings so it's known which columns are which.  
2. The variables are in different columns.  
3. There are no duplicate columns.
