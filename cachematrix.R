## Creates a special 'cachable' matrix data structure capable of caching the
  ## inverse of a matrix.
  makeCacheMatrix <- function(x = matrix()) {
 -  i <- NULL # The computed inverse of the matrix.
 +  i <- NULL # The inverse of the matrix, initially NULL
    
 -  # Setter function
 +  # Setter function for the matrix
    set <- function(y) {
      x <<- y
      i <<- NULL
    }
    
 -  # Getter function
 +  # Getter function for the matrix
    get <- function() { 
      x 
    }
    
 -  # Compute the inverse of the matrix
 +  # Stores the inverse of the matrix as a part of the data structure
    setinverse <- function(inverse) {
      i <<- inverse
    }
 @@ -40,13 +40,23 @@ makeCacheMatrix <- function(x = matrix()) {
  ## Computes and caches the inverse of a given matrix. We assume that the user
  ## of the function always provides a squre matrix. 
  cacheSolve <- function(x, ...) {
 +  ## Retrive the inverse of the matrix from the makeCacheMatrix object passed 
 +  ## in to the function by invoking the object's getinverse() method. 
    i <- x$getinverse()
 +  
 +  ## If the inverse of the matrix is not null (i.e. has been computed already)
 +  ## then simply return the computed inverse.
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }
 +  
 +  ## If the inverse of the matrix is null (i.e. not yet computed) then 
 +  ## retrieve the original matrix, compute the inverse using the native R 
 +  ## sort() method and then store it to the makeCacheMatrix object. 
 +  ## Return the computed inverse.   
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
 -  i ## Return a matrix that is the inverse of 'x'
 +  i
  }
