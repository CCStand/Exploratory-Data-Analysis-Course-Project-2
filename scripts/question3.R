question3 <- function(){
  library(ggplot2)
  
  #Filtering data to only sources in Baltimore
  pm25Balt <- pm25Emissions[pm25Emissions$fips=="24510", ]
  
  #Getting sum of emissions from each type of source
  typeTotalsBalt <- aggregate(pm25Balt$Emissions, list(type=pm25Balt$type, year=pm25Balt$year), sum)
  
  #Creating plot
  g <- ggplot(typeTotalsBalt, aes(year, x)) + geom_point() + geom_smooth(method="lm", se=FALSE, color="cyan") + facet_wrap(vars(type), ncol = 2)
  g <- g + ggtitle("Change in Total PM2.5 Emissions by Source Type in Baltimore (1999-2008)") +xlab("Year") + ylab("Total PM2.5 Emissions (Tons)")
  
  #Creating png
  png(file = "./plots/plot3.png")
  print(g)
  dev.off()
  }