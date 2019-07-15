peakrawchecker <- function() {
  '%!in%' <- function(x,y)!('%in%'(x,y))
  peakfiles <- list.files(path=input_dir, pattern="*_peakdetection.csv", full.names=TRUE, recursive=FALSE)
  rawfiles1 <- list.files(path=input_dir, pattern="*_1.csv", full.names=TRUE, recursive=FALSE)
  rawfiles2 <- list.files(path=input_dir, pattern="*_2.csv", full.names=TRUE, recursive=FALSE)
  rawfiles3 <- list.files(path=input_dir, pattern="*_3.csv", full.names=TRUE, recursive=FALSE)
  rawfiles4 <- list.files(path=input_dir, pattern="*_4.csv", full.names=TRUE, recursive=FALSE)
  rawfiles5 <- list.files(path=input_dir, pattern="*_5.csv", full.names=TRUE, recursive=FALSE)
  rawfiles6 <- list.files(path=input_dir, pattern="*_6.csv", full.names=TRUE, recursive=FALSE)
  rawfiles <- c(rawfiles1, rawfiles2, rawfiles3, rawfiles4, rawfiles5, rawfiles6)
  for (val in peakfiles){
    if (str_sub(val,1, -17) %!in% names(rawfiles)){
      return 0
    }
  }
  for (val in rawfiles){
    if (paste0((str_sub(val, 1, -4)), "_peakdetection.csv") %!in% names(peakfiles)){
      return 0
    }
  }
  return 1
}

multisweephelper<- function(entirety) {
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

multisweephandler <- function() {
  files <- list.files(path="./input", pattern="*.csv", full.names=TRUE, recursive=FALSE)
  for (val in files){
    multisweephelper(val)
  }
}

spider()

