# Introduction

The script "run_analysis.R"performs the steps 1 to 5 given in the instructions for project submission

1. All the similar data is merged using the "rbind()" function. 
2. Take only those columns with the mean and standard deviation measures. After extracting these columns, they are given the correct names, taken from "features.txt".
3. added descriptive activity names to name the activities in the data set.
4. Add correct names to columns.
5. created a new tidy dataset holding all the average measures for each subject and activity type. The file is called "tidy_averages_data.txt".

# Variables Description

1. "x_train", "y_train", "x_test", "y_test", "subject_train" and "subject_test" contain the data from the downloaded files.
2.  x_data is created merging x_train and x_test
3.  y_data is created merging y_train and y_test 
4.  subject_data is created merging subject_train and subject_test
5. "features" contains the correct names for the "x_data" dataset, which are applied to the column names stored in "mean_and_std_features".
6. Similar method is applied for activity names through the "activities" variable.
7. "all_data" merges "x_data", "y_data" and "subject_data" in a final dataset.
8.  "tidy_averages_data.txt" contains the relevant averages which will be later stored in a ".txt" file. "ddply()" from the plyr package is used to apply "colMeans()" and ease the development.
