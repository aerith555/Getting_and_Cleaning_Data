# Getting_and_Cleaning_Data
Course project for Getting and Cleaning Data

Original assignment:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Steps:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

R script explanation

0. Initial steps
Set working directory and install packages data.table and dplyr. Make sure that you run library("data.table") and library("dplyr") before starting.

1. Merging the data sets
Read the data from the files into six separate data sets using read.table. To merge them, use rbind three times: one for the subject (sub_Train and sub_Test), one for the activities (y_Train and y_test), and one for the features (X_Train and X_Test). Then read the feature names from features.txt and set them as the column names for the features dataset. Set the column name for the activities dataset as "Activity" and the column name for the subjects dataset as "Subject". Then make the large dataset using cbind on all three separate smaller datasets.

2. Extracting columns with only mean and standard deviation
Use grep for "mean|STD" (mean or standard deviation) to return the indices of the columns with mean or standard deviation. Then add the indices of the last two columns on from the large dataset (the activity and subject columns) and create a new dataset called smallData with these indices. 

3. Naming the activities in the dataset
The activity column is column 87. Factor the data in that column as characters and then relabel them using the levels given in the activity_labels.txt file ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING") (credit to Ray Jones from the course discussion forums for this line of code).

4. Use descriptive variable names for the rows
To clarify some of the confusing notation, replace it using the gsub() function.

^t --> Time
tBody --> TimeBody
^f --> Frequency
BodyBody --> Body

5. Factor the subject column. Make the smallData dataset into a data table. Use the aggregate() function to determine the average of each variable for the activity and subject. 


