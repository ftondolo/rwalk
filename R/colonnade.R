extractor<- function(entirety) {
  file <- read.csv(entirety)
  if (length(file)!=1){
    for (x in seq(length(file))){
      tmp <-na.omit(file[[x]])
      write.csv(tmp, paste0("./output/", tools::file_path_sans_ext(entirety), '_', x, '.csv'))
    }
  }
  else{
    tmp <-na.omit(file[[x]])
    write.csv(tmp, paste0("./output/", tools::file_path_sans_ext(entirety), '.csv'))
  }
}

spider <- function() {
  files <- list.files(path="./input", pattern="*.csv", full.names=TRUE, recursive=FALSE)
  for (val in files){
    extractor(val)
  }
}

spider()

