## Put comments here that give an overall description of what your
## functions do

## List the set and get functions

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  setMatrix <- function(y){
    x <<- y
    inv <<- NULL #Flushing the cache
  }
  getMatrix <- function()x
  setInverse <- function(solve) {inv <<- solve}
  getInverse <- function()inv
  #Return list of function
  list(setMatrix = setMatrix, getMatrix = getMatrix, 
       setInverse = setInverse, getInverse = getInverse)
}


## Return cached matrix or calculate new matrix

cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    if(!is.null(inv)){
      message('getting cached data')
      return(inv)
    }
    inv <-solve(x$getMatrix())
    x$setInverse(inv) #Save Cache
    inv
}
