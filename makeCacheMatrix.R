makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  get <- function() x
  setmatrix_inv <- function(solve) m <<- solve
  getmatrix_inv <- function() m
  list(set = set, get = get,
       setmatrix_inv = setmatrix_inv,
       getmatrix_inv = getmatrix_inv)
}