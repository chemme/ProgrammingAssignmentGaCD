---
title: "CODEBOOK"
author: "CH"
date: "Sunday, September 21, 2014"
output: html_document
---

1.  data

  Variable Label: Labeled subset of merged train/test data returned from PreparingData() function of     run_analysis.R.  Used as input for ProcessData() function.
  Values: Data frame consisting of subject code, activity name (derived from activity code), and mean/std values subset from the original merged dataset.  subject and activity are factors, all other data is numeric.
  
2.  results

  Variable Label: Final data frame returned from ProcessData() function and run_analysis.R.  Results is a data frame consisting of the subject code, the activity name and the mean of each associated mean/std data column from data.  subject and activity are factors.  Each row indicates a specific activity for a specific subject, with six activities per subject.  Each data point represent the mean of the specific measurement for that subject with that activity.
  
3.  test

  Variable Label: Holds raw test data from X_test.txt as a data frame
 
4.  train

  Variable Label: Holds raw train data from X_train.txt as a data frame

5.  merged

  Variable Label:  Data frame representing merged test and train data.  Data merged using rbind with train data first
  
6.  act_labels

  Variable Label:  Activity names read from activity_labels.txt as a data frame.  Used to convert activity codes to activity names
  
7.  features

  Variable Label: Feature names read from features.txt as a data frame.  Used as row labels for numerical data

8.  subject_train

  Variable Label: Subject data for train data set read from subject_train.txt as a data frame

9.  subject_test

  Variable Label: Subject data for test data set read from subject_test.txt as a data frame

10.  y_train

  Variable Label: Activity data for train data set read from y_train.txt as a data frame

11.  y_test

  Variable Label: Activity data for test data set read from y_test.txt as a data frame
  
12. subject

  Variable Label: Merged subject data from subject_train and subject_test

13. y

  Variable Label: Merged activity data from y_train and y_test with activity codes replaced by activity names

14. labels

  Variable Label: Data frame of subject and activity data that will be merged with the measurment data and will serve as de facto row labels

15. sub_merged

  Variable Label: Labeled subset of merged data that includes subject code, activity name and measurment data for mean and std.  Serves as the output of PrepareData() function
  
16. output

  Variable Label: The output data frame returned by ProcessData().  Originally is a file where each row of processed data is added iteratively.  The final variable is converted to a data frame and returned
  
17. data

  Variable Label: subset of subMerged for individual subject and individual activity (e.g. Subject 1, Activity STANDING).  Data is used for the final mean calculation.
