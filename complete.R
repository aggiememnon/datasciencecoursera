complete <- function(directory, id = 1:332) {
      
      working_dir <- getwd()
      
      setwd(directory)
      
      monitors <- list.files()

      sample.data <- read.csv(monitors[id[1]])
      
      sample.id <- id[1]
      
      sample.nobs <- sum(complete.cases(sample.data))
      
      add.nobs <- NULL
      
      add.id <- NULL
      
      for(i in seq_along(id)) {
            
            if(i == 1) {
                  next
            }
            
            add.sample <- read.csv(monitors[id[i]])
            
            add.nobs <- c(add.nobs, sum(complete.cases(add.sample)))
            
            add.id <- c(add.id, id[i])
                  
            
      }
      
      setwd(working_dir)
      
      final.nobs <- c(sample.nobs, add.nobs)
      
      final.id <- c(sample.id, add.id)
      
      df.obs <- data.frame(final.id, final.nobs)
      
      names(df.obs) <- c("id", "nobs")
      
      return(df.obs)
}