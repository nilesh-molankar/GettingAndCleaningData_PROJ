# Nilesh.Molankar
# Getting And Cleaning Data Project
# 17 May 2015

###################### Point 1  ######################
# 1.Merges the training and the test sets to create one data set.
# Read all the 3 train files x, y and subject
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Read all the 3 test files x, y and subject
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Merge the respective files to create one consolidated data set.
# x_train merges with x_test
x_data <- rbind(x_train, x_test)

# y_train merges with y_test
y_data <- rbind(y_train, y_test)

# subject_train merges with subject_test
subject_data <- rbind(subject_train, subject_test)

## do some QC that data has been loaded and merged correctly.
# head(x_data), tail(x_data)
# Head(y_data), tail(y_data)
#head(subject_data), tail(subject_data)


###################### Point 2  ######################
#2. Extracts only the measurements on the mean and standard deviation for 
# each measurement. 

# load the data from features.txt to table features.
features <- read.table("features.txt")

# get only columns with mean() or std() in their names
# the name should contain mean(): Mean value or std(): Standard deviation
# have to avoid names like meanFreq(): Weighted average of the frequency components to obtain a mean frequency
# use data from column 2 of the table
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])


# get the names of the columns that qualify as per the point 2 rule
names(x_data) <- features[mean_and_std_features, 2]

# QC that each name contains mean() and std() as part of it

###################### Point 3  ######################
#3 Uses descriptive activity names to name the activities in the data set
#column 1 of y_data and column 1 of activities needed to be connected as keys 
#then use column 2 of the matched row to replace the value in col 1 of Y-data
y_data[, 1] <- activities[y_data[, 1], 2]

# give a appropriate column name to the y_data.
names(y_data) <- "activity_names"

###################### Point 4  ######################
#Appropriately labels the data set with descriptive variable names. 

# x-data and y-data have proper column names so only subject_data needs one corrected
names(subject_data) <- "Subject"

# merge all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

###################### Point 5  ######################
#From the data set in step 4, 
#creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

library(plyr)
tidy_averages_data <- ddply(all_data, .(Subject, activity_names), function(x) colMeans(x[, 1:66]))
write.table(tidy_averages_data, "tidy_averages_data.txt", row.name=FALSE)
