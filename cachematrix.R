## This function creates a special 'matrix' object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    
    myCacheMatrix <<- x
    myCacheInverse <<- solve(x)        ## Solve(x) computes the inverse of a square matrix x
}

## This function computes the inverse of the special 'matrix' 
## returned by makeCacheMatrix(). If the inverse has already 
## been calculated and the matrix hasn't changed, then retrieve
## the inverse from the cache.
cacheSolve <- function(x, ...) {
    
    ## Return a matrix that is the inverse of 'x'
    
    if (exists("myCacheMatrix") && x == myCacheMatrix) {
        #print("pull from cache")
        myCacheInverse   
    }
    else {
        makeCacheMatrix(x)
        myCacheInverse   
    }
    
    ## Test cases:
    ## mm <- rbind(c(1, -1/4), c(-1/4, 1))
    ## myinverse <- cacheSolve(mm)     # may be slow because it must cache the value
    ## myinverse <- cacheSolve(mm)     # should be faster
    ## myinverse <- cacheSolve(mm+1) # should be slower because the cache is dirty
}
