## first function creates a "matrix" (e.g. list of functions to operate with a matrix)
## second one is to obtain an inverse of the matrix from the first function

## this function provide list of functions to set and get values of matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(i) inv <<- i
        getinv <- function() inv
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## this fuction calculates or returns existing value of an inverse of the argument

cacheSolve <- function(x, ...) {
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}