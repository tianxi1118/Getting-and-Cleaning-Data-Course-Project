##Check file path
getwd()
path<-getwd()
path 

##Download zip file and unzip to file path
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- "Dataset.zip"
if (!file.exists(path)) {dir.create(path)}
download.file(url, file.path(path, f))
unzip(zipfile="C:/Users/lw/Documents/Dataset.zip")
path_rf <- file.path(path , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)



##Read data from each text file
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)


##Row binding for subject, activity and features

dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

##Column binding for subject, activity and features

names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames<-read.table(file.path(path_rf, "features.txt"),head=FALSE)$V2
names(dataFeatures)<-dataFeaturesNames

Data <- cbind(dataFeatures, dataSubject, dataActivity)

##Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

## Extracts only the measurements on the mean and standard deviation for each measurement
DataFeaturesNames<-dataFeaturesNames[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames)]
Names<-c(as.character(DataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=Names)


##Appropriately labels the data set with descriptive variable names. 
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("^t", "time", names(Data))


##Creates a second, independent tidy data set called data.txt with the average of each 
##variable for each activity and each subject
library(plyr)
library(Rcpp)
Data <- data.frame(Data)
averageData = colMeans(Data)
write.table(averageData, file = "data.txt",row.name=FALSE)
