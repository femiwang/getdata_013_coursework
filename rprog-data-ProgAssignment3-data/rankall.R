rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ##read general outcome file
  oocm <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  possible_outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  if(outcome %in% possible_outcomes == FALSE){
    stop("invalid outcome")
  }
  
  #get real keyword for accessing the data
  if(outcome == "heart attack"){
    outcome_query <- 11
  }
  else if(outcome == "heart failure"){
    outcome_query <- 17
  }
  else if(outcome == "pneumonia"){
    outcome_query <- 23
  }
  
  ##get hospitals that have value on outcome
  oocmr <- oocm[oocm[,outcome_query] != "Not Available",]
  
  ##split data with split() into states
  df <-  as.data.frame(oocmr[, c(2, outcome_query, 7)])
  
  dfx <- split(df, df$State)
  
  final <- data.frame()
  
  for(df in dfx){
    if(num == "best"){
      min_df <- df[order(as.numeric(df[, 2]), df[, 1]), ]
      final <- rbind(final, data.frame("hospital" = min_df[1,1], "state" = min_df[1,3])) 
    }
    
    else if(num == "worst"){
      max_df <- df[order(as.numeric(df[, 2]), df[, 1]), ]
      ind <- sum(as.numeric(max_df[,2]) == max(as.numeric(max_df[,2])))
      ind <- ind - 1
      final <- rbind(final, data.frame("hospital" = max_df[nrow(max_df) - ind, 1],  "state" = max_df[nrow(max_df) - ind, 3]))
      
    }
    
    else{
      num <- as.numeric(num)
      
      rank_df <- df[order(as.numeric(df[, 2]), df[, 1]), ]
      
      final <- rbind(final, data.frame("hospital" = rank_df[num,1], "state" = rank_df[num,3]))
      
    }
  }

  final
}