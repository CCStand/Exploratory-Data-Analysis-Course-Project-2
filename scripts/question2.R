question2 <- function(){
  #Filtering data to only sources in Baltimore
  pm25Balt <- pm25Emissions[pm25Emissions$fips=="24510", ]
  
  #Getting total PM2.5 emissions in each year
  yearpm25TotalsBalt <- tapply(pm25Balt$Emissions, pm25Balt$year, sum)
  
  #Plotting values and creating png
  png(file = "./plots/plot2.png")
  plot(names(yearpm25TotalsBalt), yearpm25TotalsBalt, type="l", main="Total PM2.5 Emissions in Baltimore (1999-2008)", xlab="Year", ylab="Total PM2.5 Emissions (Tons)")
  dev.off()
  }