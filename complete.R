complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  d=  data.frame()
  for (i in id){
    name = sprintf('%s/%03d.csv',directory,i)
    dt = read.csv(name)
    nobs = dim(dt[complete.cases(dt),])[1]
    r = data.frame(id=i,nobs=nobs)
    d=  rbind(d,r)
    
  }
  return(d)
}