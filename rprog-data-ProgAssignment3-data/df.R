df <- function(info, x = "yeah"){
  if(x == "yeah"){
    return("yeah")
  }
  else{
    return("nayss")
  }
}

source("rankall.R")

source("state_outcome.R")

tail(rankall("pneumonia", "worst"), 3)