## These two functions create a special object that 
## stores a matrix and caches the inverse of it



## This first function contains different functions to:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse matrix
## 4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  s<-NULL
  set <- function(y){
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}



## This second function calculates the inverse of the matrix created 
## with the above function. It first checks if it has already been 
## calculated, if so it gets the inverse matrix from the cahce and 
## skips the computation. Otherwise, it calculates and sets the 
## inverse matrix.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
  
}