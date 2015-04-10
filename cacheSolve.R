cacheSolve <- function(x, ...) {
  m <- x$getmatrix_inv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix_inv(m)
  m
}