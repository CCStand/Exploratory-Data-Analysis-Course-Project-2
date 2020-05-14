question1 <- function() {
  
  #Getting total PM2.5 emissions in each year
  yearpm25Totals <- tapply(pm25Emissions$Emissions, pm25Emissions$year, sum)
  
  #Plotting values and creating png
  png(file = "./plots/plot1.png")
  plot(names(yearpm25Totals), yearpm25Totals/10^6, type="l", main="Total PM2.5 Emissions in the United States (1999-2008)", xlab="Year", ylab="Total PM2.5 Emissions (Millions of Tons)")
  dev.off()
  }