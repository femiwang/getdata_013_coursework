##script to complete course work on Getting and Cleaning data

  ##read all the data for test set
  ##Rename subject_test and y_test columns to "subject" and "activity" respectively
  
  y_test <- tbl_df(read.table("./test/y_test.txt", col.names = "activity"))
  x_test <- tbl_df(read.table("./test/X_test.txt"))
  subj_test <- tbl_df(read.table("./test/subject_test.txt", col.names = "subject"))
  
  ##get variable names 
  variable_names <- read.table("./features.txt")
 
  ##Appropriately labels the data set with descriptive variable names. 
  colnames(x_test) <- variable_names[,2]
  
  ##Extract only the measurements on the mean and standard deviation 
  ##for each measurement. 
  x_grep <- grep("mean[(][)]|std[(][)]", colnames(x_test))
  x_test <- x_test[,x_grep]
  
  ##remove the minus and bracket signs from variables names to avoid errors 
  colnames(x_test) <- gsub("[-,()]","",colnames(x_test))
  
  ##bind all the test data into a single data set
  data_test <- bind_cols(subj_test, y_test, x_test)
  
  ##read all the data for train set
  ##Rename subject_train and y_train columns to "subject" and "activity" respectively
  y_train <- tbl_df(read.table("./train/y_train.txt", col.names = "activity"))
  x_train <- tbl_df(read.table("./train/X_train.txt"))
  subj_train <- tbl_df(read.table("./train/subject_train.txt", col.names = "subject"))
  
  ##Appropriately labels the data set with descriptive variable names. 
  colnames(x_train) <- variable_names[,2]
  
  ##Extract only the measurements on the mean and standard deviation 
  ##for each measurement.
  x_grep <- grep("mean[(][)]|std[(][)]", colnames(x_train))
  x_train <- x_train[, x_grep]
  
  ##remove the minus and bracket signs from variables names to avoid errors 
  colnames(x_train) <- gsub("[-,()]","",colnames(x_train))
  
  ##bind above read data into a single data set
  data_train <- bind_cols(subj_train, y_train, x_train)
  
  ##combine test and train data sets
  combined_data <- bind_rows(data_test, data_train)
    
  ##Use descriptive activity names to name the activities in the data set 
  
  ##retrieve the values for the descriptive name for each activity
  descpt_names <- read.table("./activity_labels.txt")
  descpt_names <- descpt_names[,2]
  
  combined_data[combined_data[,2] == 1,2] <- as.character(descpt_names[1])
  combined_data[combined_data[,2] == 2,2] <- as.character(descpt_names[2])
  combined_data[combined_data[,2] == 3,2] <- as.character(descpt_names[3])
  combined_data[combined_data[,2] == 4,2] <- as.character(descpt_names[4])
  combined_data[combined_data[,2] == 5,2] <- as.character(descpt_names[5])
  combined_data[combined_data[,2] == 6,2] <- as.character(descpt_names[6])
  
  ##creates a second, independent tidy data set 
  ##with the average of each variable for each activity and each subject.
  final_data_set <- combined_data %>%
    gather(variables, result, tBodyAccmeanX:fBodyBodyGyroJerkMagstd) %>%
      group_by(subject, activity, variables) %>%
        summarise(average = mean(result))
  
  final_data_set 
  
  
