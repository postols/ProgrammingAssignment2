## These functions allow caching the inverse of a matirx

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	xinv<-NULL
	set<-fucntion(y) {
                x <<- y
                xinv <<- NULL
        }
        get <- function() x
        setinv <- function(solve) xinv <<- solve
        getinv <- function() xinv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and the
## matrix has not changed), then the cachesolve should retrieve the inverse 
## from the cache.

cacheSolve <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
