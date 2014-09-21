run_analysis <- function() {
  data <- PrepareData() # return data frame of mean/std subset of merged labeled data
  results <- ProcessData(data) # process data and return
  results
}

PrepareData <- function () {
  
  print("Reading input files and merging data...\n")

  test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors=FALSE)
  train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors=FALSE)
  merged <- rbind(train, test) # merges data sets into single file

  print("Parsing row and column labels...\n")  
  
  act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") # activity labels
  features <- read.table("./UCI HAR Dataset/features.txt") # features
  names(merged) <- t(features[2]) # assign features as column names

  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  subject <- c(subject_train$V1, subject_test$V1) # merge subject data
  y <- sapply(c(y_train$V1, y_test$V1), function(x) act_labels[x,2]) # replace numbers with labels
  labels <- data.frame(subject = subject, activity = y, stringsAsFactors = FALSE) # row labels

  print("Subseting mean and std data...\n")
  
  sub_merged <- subset( # subset labeled mean/std data
    merged,
    select = grep("mean\\(|std\\(", names(merged), value=TRUE) # extract mean/std headers
  ) 
  subMerged <- cbind(labels, sub_merged) # merge activity labels with subset data and return
  subMerged$subject <- factor(subMerged$subject)
  subMerged
}

ProcessData <- function(subMerged) {

  print("Processing data and outputting results\n")
  
  labels <- matrix(, nrow=0, ncol=2) # out mean values as list
  values <- matrix(, nrow=0, ncol=66)
  
  for(subj in levels(subMerged$subject)) { # each subject
    for(act in levels(subMerged$activity)) { # each activity
      labels <- rbind(labels, c(subj, act))
      data <- subset(subMerged, subMerged$subject == subj & subMerged$activity == act) # pull out subset
      values <- rbind(values, colMeans(data[,3:68]))
      #    labels <- rbind(labels, c(subj, act, colMeans(data[,3:68])))
    }
  }
  labels <- as.data.frame(labels)
  colnames(labels)[1:2] <- c("Subject", "Activity")
  output <- cbind(labels, values)
  output
}