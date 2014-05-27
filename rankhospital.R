rankhospital <-function(state,outcome,num="best"){
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if (! state %in% data$State ){
    stop('Invalid State')
  }
  
  titleHead <- '^Hospital.30.Day.Death..Mortality..Rates.from.'
  col <- paste(titleHead,gsub(" ",".",outcome),sep='')
  cnames <- colnames(data)
  col <- cnames[grep(col,cnames,ignore.case=TRUE)]
  
  
  if (is.null(col) | length(col)==0){
    stop('invalid outcome')
  }
  
  ft <- data[data$State == state,c("Hospital.Name",col)]
  ft[,2] <- as.numeric(ft[,2])
  ftc <- ft[complete.cases(ft),]
  
  ord = ftc[order(ftc[2],ftc[1]),]
  
  if (num =="best"){
    num = 1
  }else if (num == 'worst'){
    num = dim(ftc)[1]
  }
  return(ord[num,1])
  
  
}