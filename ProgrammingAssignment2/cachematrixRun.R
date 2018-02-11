setwd("/Users/dye/Desktop/RRef/DataScienceCoursera/ProgrammingAssignment2/")
source("cachematrix.R")

my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
my_matrix$get()
my_matrix$getinverse()
cacheSolve(my_matrix)
my_matrix$getinverse()
