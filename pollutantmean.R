pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ##get files names
  file_names <- character(length(id));
  for(i in id){
    if(i < 10){
      file_names[i] <- paste(directory, "/00",i,".csv", sep="")
    }
    else if(i < 100){
      file_names[i] <- paste(directory, "/0",i,".csv", sep="")
    }
    else{
      file_names[i] <- paste(directory, "/", i,".csv", sep="")
    }
  }
  
  ##set variables to calculate mean manually
  total_sum <- 0
  total_length <- 0
  
  ##get sum of all item and number of all items
  for(i in id){   
    curr_file <- read.csv(file_names[i]);
    curr_pollutant <- curr_file[pollutant]
    total_sum <- total_sum + sum(curr_pollutant[!is.na(curr_pollutant)])
    total_length <- total_length + length(curr_pollutant[!is.na(curr_pollutant)])
  }
  
  ##calculate the mean
  total_mean <- total_sum / total_length
  total_mean
}