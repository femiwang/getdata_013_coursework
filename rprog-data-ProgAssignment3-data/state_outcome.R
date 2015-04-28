state_outcome <- function(df, num = "best"){
  
  if(num == "best"){
    min_df <- df[order(as.numeric(df[, 2]), df[, 1]), ]

    result <- c(min_df[1,1], min_df[1,3])
    return(result)
    
  }
  
  if(num == "worst"){
    max_df <- df[order(as.numeric(df[, 2]), df[, 1]), ]
    
  ##  max_df <- max_df[as.numeric(max_df[,2]) == as.numeric(max(max_df[,2])),]
    ind <- sum(as.numeric(max_df[,2]) == max(as.numeric(max_df[,2])))
    ind <- ind - 1
    result <- data.frame("hospital" = max_df[nrow(max_df) - ind, 1],  "state" = max_df[nrow(max_df) - ind, 3])
    return(result)
  }
  
  num <- as.numeric(num)

  rank_df <- df[order(as.numeric(df[, 2]), df[, 1]), ]
  
  if(num > nrow(rank_df)){
    return(NA)
  }
  
  result <- c(rank_df[num,1], rank_df[num,3])
  return(result)
  
  
  
}