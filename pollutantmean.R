pollutantmean <- function(directory, pollutant, id = 1:332) {
      
      working_dir <- getwd()
      
      setwd(directory)
            
      monitors <- list.files()
      
      sample.data <- read.csv(monitors[id[1]])
      
      add.data <- NULL
      
      for(i in seq_along(id)) {
            
            if(i == 1) {
                  next
            }
            
            add.data <- read.csv(monitors[id[i]])
            
            sample.data <- rbind(sample.data, add.data)
            
      }
      
      sample.mean <- mean(sample.data[ ,pollutant], na.rm = TRUE)
      
      setwd(working_dir)
      
      return(sample.mean)
      
}