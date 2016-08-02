setwd("C:/R Projects/CleanData/Assignment")
install.packages("reshape2")
library(reshape2)

# read data into data frames
# read Activity Files
act_train <- read.table("C:/R Projects/CleanData/Assignment/UCI HAR Dataset/train/Y_train.txt", header=FALSE)
act_test <-  read.table("C:/R Projects/CleanData/Assignment/UCI HAR Dataset/test/Y_test.txt", header=FALSE)

# read Subject files
subject_train <- read.table("C:/R Projects/CleanData/Assignment/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subject_test <-  read.table("C:/R Projects/CleanData/Assignment/UCI HAR Dataset/test/subject_test.txt", header=FALSE)

# read features files
feature_train <- read.table("C:/R Projects/CleanData/Assignment/UCI HAR Dataset/train/X_train.txt", header=FALSE)
feature_test <-  read.table("C:/R Projects/CleanData/Assignment/UCI HAR Dataset/test/X_test.txt", header=FALSE)

# Structure of the files
str(act_test)
str(act_train)

str(feature_test)
str(feature_train)

str(subject_test)
str(subject_train)


# Merge the data tables by rows
SubjectFile <- rbind(subject_train, subject_test)
ActivityFile <- rbind(act_train, act_test)
FeaturesFile <- rbind(feature_train, feature_test)

#Set names to variables
names(SubjectFile) <- c("subject")
names(AcitivityFile)<- c("activity")

FeaturesNames <- read.table("C:/R Projects/CleanData/Assignment/UCI HAR Dataset/features.txt",header=FALSE)
names(FeaturesFile)<- FeaturesNames$V2

# The final merge

SubActFile <- cbind(SubjectFile, ActivityFile)
MergedDataFile <- cbind(FeaturesFile, SubActFile)

