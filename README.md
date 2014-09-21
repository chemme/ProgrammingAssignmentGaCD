ProgrammingAssignmentGaCD
=========================

This is the README file for run_analysis.R.  The script assumes that the UCI HAR Dataset folder (with all associated subfolders and files) is in your working directory.  The script is split between two functions.

The first function, PrepareData(), reads the input files from the test and trian subfolders, merges them together into a single dataframe, adds the appropriate row and column names from the subject and y files for both train and test, converts the activity code to activity name using activity_label.txt, and returns a dataframe of labeled subset of this data containing only rows associated with mean and std.

The second function, ProcessData(x), takes the prepared data frame as input and converts it to a new data frame containing means of each column from the original data frame.  The final data frame is organized by subject and activity such that each subject has the six associated activities and the associated means for each column.