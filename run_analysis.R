# Install packages
install.packages("dplyr")
# Load libraries
library(dplyr)

# Download zip
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip download file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Read train data
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
Subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Read test data
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
Subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Read features description
Features <- read.table("./data/UCI HAR Dataset/features.txt")

# Read activity labels
Activity_labels = read.table("./data/UCI HAR Dataset/activity_labels.txt")

# Merge train and test data
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Subject_total <- rbind(Subject_train, Subject_test)

# Mean and standard deviation for each measurement
Selected_features <- Features[grep(".*mean\\(\\)|std\\(\\)", Features[,2], ignore.case = FALSE),]
X_total      <- X_total[,Selected_features[,1]]

# Name columns
colnames(X_total)   <- Selected_features[,2]
colnames(Y_total)   <- "activity"
colnames(Subject_total) <- "subject"

# Merge final data
Total <- cbind(Subject_total, Y_total, X_total)
Total

# Turn activity & subject into factor
Total$activity <- factor(Total$activity, levels = Activity_labels[,1], labels = Activity_labels[,2]) 
Total$subject  <- as.factor(Total$subject) 

# create a summary independent tidy dataset from final dataset 
# with the average of each variable for each activity and each subject. 
Total_mean <- Total %>% group_by(activity, subject) %>% summarize_all(funs(mean)) 

# Export summary dataset
# Read tidy dataset
write.table(Total_mean, file = "./data/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE) 
tidydata <- read.table("./data/UCI HAR Dataset/tidydata.txt")
tidydata
