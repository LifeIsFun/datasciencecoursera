# hospital performace measured using 30 day mortality
# per state, per outcome, per ranking

rankhospital <- function(state, outcome, rank) {
  ## Read outcome data
  data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
  data <- data[,c(2,           # hospital
                  7,           # state
                  11,          # heart attack
                  17,          # heart failure
                  23           # pneumonia
                  )]
  colnames(data) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
  ## Check that state and outcome are valid using stop function
  if( !(state %in% data$state)) stop("Invalid state")
  if( !(outcome %in% c("heart attack", "heart failure", "pneumonia"))) stop("Invalid outcome")

  ## Return hospital name in that state with lowest 30-day death rate per outcome
  ## if tie, sort alphabetically
  
  # extract data for the state
  state.data <- data[data$state == state, ]
  
  # pull out data per outcome
    if(outcome == "heart attack")       {outcome.data = state.data[,c(1,3)]} 
    else if(outcome == "heart failure") {outcome.data = state.data[,c(1,4)]} 
    else                                {outcome.data = state.data[,c(1,5)]} 
    
  # remove NA
    outcome.data[,2] <- suppressWarnings(as.numeric(outcome.data[,2]) )
    outcome.data <- na.omit(outcome.data)
  
  # order low to high    
    outcome.data <- outcome.data[order(outcome.data[ , 2], outcome.data[ , 1]), ]
  
  # how many hospitals per state
    n <- nrow(outcome.data)
    
  # get hospital info per rank
    if(rank == 'best')          {hospital <- outcome.data[1,1]} 
    else if(rank == 'worst')    {hospital <- outcome.data[n,1]}
    else if(rank <= n)          {hospital <- outcome.data[rank,1]}
    else                        {stop('NA, invalid rank', call. = FALSE)}
    
  return(hospital)
  
  }