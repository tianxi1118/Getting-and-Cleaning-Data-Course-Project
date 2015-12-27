#Getting and Cleaning Data Course Project

## Project Information

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## run_analysis.R does the following: 

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Documents delivered for this project

1) a tidy data set.  
2) a link to a Github repository with run_analysis.R for performing the analysis.
3) a code book that describes the variables, the data, and any transformations or work that is performed to clean up the data called CodeBook.md. 
4) a README.md in the repo with scripts. This repo explains how all of the scripts work and how they are connected.  

## How run_analysis.R works

1)It downloads the UCI HAR Dataset data set from the URL given in zip file in working directrory. 
2)It unzips the file into a folder called the UCI HAR Dataset.
3)It reads data from each text file.
4)It performs row binding for subject, activity and features.
5)It performs column binding for subject, activity and features.
6)It uses descriptive activity names to name the activities in the data sets
7)It extracts only the measurements on the mean and standard deviation for each measurements
8)It appropriately labels the data set with descriptive variable names. 
9)It creates a second, independent tidy data set called data.txt with the average of each variable for each activity and each subjects
