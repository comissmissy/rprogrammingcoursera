## The assignment is to write a pair of functions that cache the
## inverse of a matrix.

#  Create a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

# compute the inverse of the special "matrix" created with makeCacheMatrix
# If the inverse has already been calculated (and the matrix has not changed),
# then the cachesolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  # Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)) {
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
}
