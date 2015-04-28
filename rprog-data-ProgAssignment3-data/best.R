best <- function(state, outcome) {
  ## Read outcome data
    ##read general outcome file
    oocm <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ##check if outcome and state name are in file, stop if not in file
    if(state %in% oocm[,"State"] == FALSE){
      stop("invalid state")
    }
    
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
    
    ##create character list to query the data
    data_query <- numeric(2)
    data_query[1] <- 2 
    data_query[2] <- outcome_query
    
    ##get required data: outcomes and state
    req_data <- oocm[oocm[,"State"] == state, data_query]
    
      ##required data without NA
    req_data_nna <- req_data[!(req_data[,2] == "Not Available"),]
    
    ##get hospital(s) with lowest value
      ##required data without NA
      min_hosp <- req_data_nna[req_data_nna[, 2] == min(as.numeric(req_data_nna[, 2]), na.rm = TRUE), ]
    
    ##check if more than one hospital, if yes return alphabetical first
    if(nrow(min_hosp) > 1){
      
      return(sort(min_hosp[,1], decreasing = FALSE)[1])
    }

  ## Return hospital name in that state with lowest 30-day death
  ## rate
    return(min_hosp[1,1])
}