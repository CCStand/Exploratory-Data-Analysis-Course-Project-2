question5 <- function(){
  library(ggplot2)
  
  #Filtering data to only motor vehicle sources in Baltimore
  pm25BaltVehicles <- pm25Emissions[pm25Emissions$fips=="24510" & pm25Emissions$type=="ON-ROAD", ]
  
  #Calculating sum of emissions from motor vehicle sources in Baltimore
  pm25BaltVehicleTotals <- aggregate(pm25BaltVehicles$Emissions, list(year=pm25BaltVehicles$year), sum)
 
  #Creating plot
  g <- ggplot(pm25BaltVehicleTotals, aes(year, x)) + geom_point() + geom_smooth(method="lm", se=FALSE, color="cyan")
  g <- g + ggtitle("Change in Total PM2.5 Emissions from Motor Vehicle Sources in Baltimore (1999-2008)") + xlab("Year") + ylab("Total PM2.5 Emissions from Motor Vehicle Sources (Tons)")

  #Creating png
  png(file = "./plots/plot5.png")
  print(g)
  dev.off()
  }