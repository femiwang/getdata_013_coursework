corr <- function(directory, threshold = 0) {
  
  #get all items in complete directory
  comp <- complete(directory)
  
  #get id for items that meet the threshold
  meet_thresh_bool <- comp[,2] > threshold
  
  meet_thresh_id <- comp[meet_thresh_bool,][1]
  
  meet_thresh_no <- dim(meet_thresh_id)[1]
  
  #if no items meet the threshold return 0!
  if(meet_thresh_no == 0){
    return(numeric(0))
  }
  
  #get all files id that meet the threshold 
  file_names <- character(meet_thresh_no) 
  curr_index <- 1 
  
  for(i in meet_thresh_id[1:meet_thresh_no,1]){
    file_names[curr_index] <- paste(directory,"/", dir(directory)[i], sep = "")
    curr_index <- curr_index + 1
  }
  
  #get sulfite and Nitrate details for items meeting the threshold
  cor_values <- numeric(meet_thresh_no)
  
  for(i in 1:meet_thresh_no){
    curr_file <- read.csv(file_names[i]);
    good_value <- (!is.na(curr_file[,3]) & !is.na(curr_file[,2]))
    cor_values[i] <- cor(curr_file[good_value, 2], curr_file[good_value, 3])
  }
  
  #return result
  final_result <- c(cor_values[1:meet_thresh_no])
  
}
  