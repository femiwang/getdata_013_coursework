##Getting and Cleaning Data Coursework

##Variables

1. y_test : Used to store the values from the y_test.txt file in the test folder

2. x_test : Used to store the values from the x_test.txt file in the test folder

3. subj_test : Used to store the values from the subject_test.txt file in the test folder

4. variable_names : used to store variable names read in from the features.txt file 

5. x_grep : used to store the indices of the mean and standard deviation values in the x_test file

6. data_test : a combined data set of the data in the test folder

7. y_train : Used to store the values from the y_train.txt file in the train folder

8. x_train : Used to store the values from the x_train.txt file in the train folder

9. subj_train : Used to store the values from the subject_train.txt file in the train folder

10. variable_names : used to store variable names read in from the features.txt file 

11. x_grep : used to store the indices of the mean and standard deviation values in the x_train file

12. data_train : a combined data set of the data in the train folder

13. combined_data : Used to store the values of data_train and data_test merged

14. descpt_names : Used to store the descriptive name for each activity read from the activity_labels.txt file

15. final_data_set: Used to store the final tidy data with the average of each variable for each activity and each subject.


##Data Tidying

1. The first step involved merging the train and test sets into one data set and naming the activities and variables appropraitely

2. The second step involved getting only the values on the mean and standard deviation variables

3. The third step involved gathering the variables from step 2 by Activity and Subject

4. The fourth step involved grouping the data set from step 3 by Activity and Subject

5. The fifth and final step involved summarizing this data by including an average of each variable for each activity and each subject.