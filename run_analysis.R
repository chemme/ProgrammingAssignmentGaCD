run_analysis <- function() {
  data <- PrepareData() # return data frame of mean/std subset of merged labeled data
  results <- ProcessData(merged) # process data and return
}

PrepareData <- function () {
  
  test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, stringsAsFactors=FALSE)
  train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, stringsAsFactors=FALSE)
  merged <- rbind(train, test) # merges data sets into single file
  
  act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") # activity labels
  features <- read.table("./UCI HAR Dataset/features.txt") # features
  names(merged) <- t(features[2]) # assign features as column names

  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

  subject <- c(subject_train$V1, subject_test$V1) # merge subject data
  y <- sapply(c(y_train$V1, y_test$V1), function(x) act_labels[x,2]) # replace numbers with labels
  labels <- data.frame(subject = subject, activity = y) # row labels
  sub_merged <- subset( # subset labeled mean/std data
    merged,
    select = grep("mean\\(|std\\(", names(merged), value=TRUE) # extract mean/std headers
  ) 
  sub_merged <- cbind(labels, sub_merged) # merge activity labels with subset data and return
  sub_merged$subject <- as.factor(sub_merged$subject) # convert subject column to factor
  sub_merged
}

ProcessData <- function(merged) {
}