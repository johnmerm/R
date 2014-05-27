rankall <-function(outcome,num="best"){
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  
  titleHead <- '^Hospital.30.Day.Death..Mortality..Rates.from.'
  col <- paste(titleHead,gsub(" ",".",outcome),sep='')
  cnames <- colnames(data)
  col <- cnames[grep(col,cnames,ignore.case=TRUE)]
  
  if (is.null(col) | length(col)==0){
    stop('invalid outcome')
  }
  
  
  ft <- data[,c("State","Hospital.Name",col)]
  ft[,3] <- as.numeric(ft[,3])
  ftc <- ft[complete.cases(ft),]
  
  ftcs <- split(ftc,ftc$State)
  
  rankstate <- function(piece){
    if (num =="best"){
      num = 1
    }else if (num == 'worst'){
      num = dim(piece)[1]
    }
    ord = piece[order(piece[3],piece[2]),]
    return(ord[num,2])
  }
  
  ret <- lapply(ftcs,rankstate)
  allstates <- unique(data$State)
  
  ret <- ret[allstates]
  
  ret <- matrix(unlist(ret))
  ret <- cbind(ret,allstates)
  
  colnames(ret) <- c('hospital','state')
  rownames(ret) <- allstates
  
  
  return(data.frame(ret))
  
  
  
  
  
  
  
}