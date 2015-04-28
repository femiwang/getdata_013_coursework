df2 <- function(x){
  for(i in x){
    res <- strsplit(x, "/")
    return(data.frame("hospital" = as.character(res[1]), "state" = as.character(res[2])))
  }
}
