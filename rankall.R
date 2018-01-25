# hospital performace measured using 30 day mortality
# for all states,
# per outcome, per ranking
# in:   outcome, rank
# out:  dataframe(hospital state)

rankall <- function(outcome, rank = 'best') {
  ## Read outcome data
  data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
  data <- data[,c(2,           # hospital
                  7,           # state
                  11,          # heart attack
                  17,          # heart failure
                  23           # pneumonia
                  )]
  colnames(data) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
  ## Check that outcome is valid using stop function
  if( !(outcome %in% c("heart attack", "heart failure", "pneumonia"))) stop("Invalid outcome")
  
  # pull out data per outcome
    if(outcome == "heart attack")       {data = data[,c(1,2,3)]} 
    else if(outcome == "heart failure") {data = data[,c(1,2,4)]} 
    else                                {data = data[,c(1,2,5)]} 
    
  # remove NA
    data[,3] <- suppressWarnings(as.numeric(data[,3]) )
    data <- na.omit(data)
    
  # get hospital info per rank per state
  # create column with ranked hospitals per state
    
  # sort by state, sort by ranking
    data <- data[order(data[ , 2], data[ , 3]), ]
    
  # aggregate by state, choosing the row that corresponds to the rank num
    ranksbystate <- aggregate(data, by=list(data$state), function(x) {
        if (!is.numeric(rank)) {
            if (rank == "best") {
                rank <- 1
            } else if (rank == "worst") {
                rank <- length(x)
            } else {
                stop('NA, invalid rank', call. = FALSE)
            } 
        }
        x[rank]
    })
    
    hospital.list <- ranksbystate[, c(-4)]
    
    return(hospital.list)
}
    

  