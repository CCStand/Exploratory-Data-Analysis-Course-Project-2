question4 <- function(){
  library(ggplot2)
  
  #Filtering data to only coal sources
  coalSources <- sourceClassCodes[grep("*Coal*",sourceClassCodes$EI.Sector),]
  coalAt <- match(as.character(coalSources$SCC), pm25Emissions$SCC)
  coalAt <- coalAt[!is.na(coalAt)]
  pm25Coal <- pm25Emissions[coalAt,]
  
  #Calculating sum of emissions from coal sources
  pm25CoalTotals <- aggregate(pm25Coal$Emissions, list(year=pm25Coal$year), sum)
  
  #Creating plot
  g <- ggplot(pm25CoalTotals, aes(year, x)) + geom_point() + geom_smooth(method="lm", se=FALSE, color="cyan")
  g <- g + ggtitle("Change in Total PM2.5 Emissions from Coal Sources in the United States (1999-2008)") + xlab("Year") + ylab("Total PM2.5 Emissions from Coal Sources (Tons)")

  #Creating png
  png(file = "./plots/plot4.png")
  print(g)
  dev.off()
  }