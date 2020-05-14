loadData <- function() {
  if(!dir.exists("./data")) {
    dir.create("./data")
  }
  
  if(!dir.exists("./plots")) {
    dir.create("./plots")
  }
  
  if(!file.exists("./data/summarySCC_PM25.rds") | !file.exists("./data/Source_Classification_Code.rds")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", "./data/Data for Peer Assessment.zip")
    unzip("./data/Data for Peer Assessment.zip", exdir="./data")
  }
  
  assign("pm25Emissions", readRDS("./data/summarySCC_PM25.rds"), envir=globalenv())
  assign("sourceClassCodes", readRDS("./data/Source_Classification_Code.rds"), envir=globalenv())
}