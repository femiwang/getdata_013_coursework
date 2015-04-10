complete <- function(directory, id = 1:332) {
  
  ##get files names
  file_names <- character(length(id));
  curr_ind <- 1
  for(i in id){
    
    if(i < 10){
      file_names[curr_ind] <- paste(directory, "/00",i,".csv", sep="")
    }
    else if(i < 100){
      file_names[curr_ind] <- paste(directory, "/0",i,".csv", sep="")
    }
    else{
      file_names[curr_ind] <- paste(directory, "/", i,".csv", sep="")
    }
    curr_ind <- curr_ind + 1
  }
  
  ##file for storing complete results
  comp_result <- matrix(,length(id),2)
  
  ##start computation
  
  for(i in 1:length(id)){
    
    total_comp <- 0
    curr_file <- read.csv(file_names[i]);
    
    for(j in 1:dim(curr_file)[1]){
      if(!is.na(sum(curr_file[j, 2:4]))){
        total_comp <- total_comp + 1
      }
    }
    comp_result[i,1] <- id[i]
    comp_result[i,2] <- total_comp
    
    
  }
  
  ##final_result <- data.frame(comp_result[1:length(id),1], comp_result[1:length(id),2])
  final_result <- as.data.frame(comp_result, row.names = list("id", "nobs") )
  dimnames(final_result)[[2]] <- c("id", "nobs")
  final_result

}