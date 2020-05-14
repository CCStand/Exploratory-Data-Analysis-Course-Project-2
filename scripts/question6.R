question6 <- function(){
  library(ggplot2)
  library(tidyverse)
  
  #Filtering data to only motor vehicle sources in Baltimore and LA
  pm25BaltVehicles <- pm25Emissions[pm25Emissions$fips=="24510" & pm25Emissions$type=="ON-ROAD", ]
  pm25LAVehicles <- pm25Emissions[pm25Emissions$fips=="06037" & pm25Emissions$type=="ON-ROAD", ]
  
  #Calculating sum of emissions from motor vehicle sources in Baltimore
  pm25BaltVehicleTotals <- aggregate(pm25BaltVehicles$Emissions, list(pm25BaltVehicles$year), sum)
  pm25LAVehicleTotals <- aggregate(pm25LAVehicles$Emissions, list(pm25LAVehicles$year), sum)
  
  #Renaming columns
  pm25BaltVehicleTotals <- setNames(pm25BaltVehicleTotals, c("Year", "Baltimore"))
  pm25LAVehicleTotals <- setNames(pm25LAVehicleTotals, c("Year", "LA"))
  
  #Merging totals into single data fram
  vehicleTotals <- merge(pm25BaltVehicleTotals,pm25LAVehicleTotals, by="Year")
  
  #Tidying data frame
  vehicleTotals <- vehicleTotals %>% pivot_longer(c("Baltimore", "LA"), names_to = "State", values_to = "Emissions")
  
  #Creating plot
  g <- ggplot(vehicleTotals, aes(Year, Emissions, color=State)) + geom_point() + geom_smooth(method="lm", se=FALSE)
  g <- g + ggtitle("Change in Total PM2.5 Emissions from Motor Vehicle Sources in Baltimore and LA (1999-2008)") + xlab("Year") + ylab("Total PM2.5 Emissions from Motor Vehicle Sources (Tons)")

  #Creating png
  png(file = "./plots/plot6.png")
  print(g)
  dev.off()
  }