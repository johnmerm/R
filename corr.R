corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  fl = list.files(path=directory)
  cr = c()
  for (f in fl){
    name = paste(directory,f,sep='/')
    dt = read.csv(name)
    dtc = dt[complete.cases(dt),]
    nobs = dim(dtc)[1]
    if (nobs>threshold){
      c = cor(dtc$nitrate,dtc$sulfate)
      cr = append(cr,c)
    }
  }
  return(cr)
}