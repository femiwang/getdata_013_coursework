## makeCacheMatrix creates a special function that contains a lists with
## getter and setter function for the matrix
## cacheSolve gets the inverse of the matrix and stores caches it for 
## future use

## makeCacheMatrix creates a special function that contains a lists with
## getter and setter function for the matrix

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


## cacheSolve gets the inverse of the matrix and stores caches it for 
## future use

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