
# You must have installed the dplyr package to run this script ie (install.packages("dplyr"))

#Warning, this script will output the data as "TidyDataSetingram.txt" file into your working directory!

#for inspection, the tidy data set can then be read back into R as data frame 'X' as follows:
# X <- read.table("TidyDataSetingram.txt", header = TRUE)

# The script assumes all required files are in the "UCI HAR Dataset" folder in your working directory
# ie the downloaded data set from course project page, unzipped and unaltered in your working directory.

#1st loads all the required tables from files

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#names all the columns using the feature table for variable names

names(X_train) <- features[ ,2]
names(X_test) <- features[ ,2]

#extracts only the measurements on the mean and standard deviation for each measurement.

varNameInds <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,
  294:296,345:350,373:375,424:429,452:454,503,504,513,516,517,526,529,530,539,542,543,552,555:561)

X_train <- X_train[ , varNameInds]
X_test <- X_test[ , varNameInds]

#converts y test and y train number codes into activity labels by coverting them to factors
#and adjusting factor levels to the activity labels provided.

#then joins the appropriate subject number and y activity labels as columns at the front of the x train
#and x test data frames

Activity <- factor(y_train[,1],labels=activity_labels[ , 2])
train <- cbind(Activity, X_train)
Subject <- subject_train[ , 1]
train <- cbind(Subject, train)

Activity <- factor(y_test[,1],labels=activity_labels[ , 2])
test <- cbind(Activity, X_test)
Subject <- subject_test[ , 1]
test <- cbind(Subject, test)

#Joins the test data frame rows onto the bottom of the train data frame and orders rows by Subject then Activity

DF <- rbind(train, test)
DF <- DF[order(DF$Subject,DF$Activity),]

#loads dplyr, groups the data by Subject and Activity and then calculates the mean of each column by group by chaining

library(dplyr)
DF <- DF %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

#Lastly, outputs the data as "TidyDataSetingram.txt" file into your working directory!

write.table(DF, file = "TidyDataSetingram.txt", row.name=FALSE)

#the table has 180 rows and 88 columns
