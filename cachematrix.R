## Put comments here that give an overall description of what your
## functions do

## These pair of functions take matrices as their input and create
## special matrix objects that can cache their inverse for quicker
## retrieval. The second function checks to see if the special matrix 
## has its inverse cached or if it needs to determine it.

## Write a short comment describing this function

## makeCacheMatrix is basically a function that is
## a list of functions set the value of the matrix
## get the value of the matrix, set the Inverse, and
## get the Inverse assuming matrix is square and 
## inverse
makeCacheMatrix <- function(x = matrix()) {                     ## Function to create special matrix with function objects attached
        
        Inv < - NULL                                            ## create Inv variable that will hold the inverse value
        set <- function(y) {                                    ## function named set that assigns the value of y to x.
                
                x <<- y                                         ## <<- operator used  to assign a new value in parent env.
                Inv <<- NULL                                    ## If the set function is used Inv is reset to NULL
        }
        
        get <- function() x                                     ## simple function to return the value of input variable
        setInverse <- function(inverse) Inv <<- inverse         ## assigns the value of inverse to Inv in the parent env.
        getInverse <- function() Inv                            ## simple function to return Inv
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)            ## Put the function objects in a list 
                                                                                                ## with names as to more easily reference them

}


## Write a short comment describing this function
## Function to check if Inverse exists for current
## input, if it does it is retrieved, if not it is 
## determined and set it
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        Inv <- x$getInverse()                                   ## retreive the inverse of input
        if(!is.null(Inv)) {                                     ## check if inverse exists in cache
                message("getting cached data")                  ## if it does, message displayed
                return(m)                                       ## and inverse returned from cache
        }
        data <- x$get()                                         ## assign the value of input to data
        Inv <- solve(data, ...)                                 ## use solve function to determine inverse
        x$setInverse(Inv)                                       ## set the value of the inverse in the cache
        Inv                                                     ## Return the value of the inverse
}
