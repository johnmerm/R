best <- function(state,outcome){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if (! state %in% data$State ){
    stop('Invalid State')
  }
  
  titleHead <- 'Hospital.30.Day.Death..Mortality..Rates.from.'
  col <- paste(titleHead,gsub(" ",".",outcome),sep='')
  if (is.null(data[[col]])){
    stop('invalid outcome')
  }
  
  ft <- data[data$State == state,c("Hospital.Name",col)]
  ft[,2] <- as.numeric(ft[,2])
  ftc <- ft[complete.cases(ft),]
  
  ord = ftc[order(ftc[2]),]
  return(ord[1,1])
  
}