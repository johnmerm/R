# TODO: Add comment
# 
# Author: grmsjac6
###############################################################################

pollutantmean <- function(directory, pollutant, id = 1:332) {
	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files
	
	## 'pollutant' is a character vector of length 1 indicating
	## the name of the pollutant for which we will calculate the
	## mean; either "sulfate" or "nitrate".
	
	## 'id' is an integer vector indicating the monitor ID numbers
	## to be used
	
	## Return the mean of the pollutant across all monitors list
	## in the 'id' vector (ignoring NA values)
	p_data <- data.frame()
  fs = list.files(path=directory)
	print(pollutant)
	for (i in id){
    fname = sprintf('%s/%03d.csv',directory,i)

	  p_data <- rbind(p_data,read.csv(fname))

	}
  m <- mean(p_data[[pollutant]],na.rm=TRUE)
	return(m)
	

}

