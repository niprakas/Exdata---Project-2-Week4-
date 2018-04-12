#-------------------------------------------------------------------------------------------------
# Coursera Project - Exploratory Data (Week 4)
# Nikhil Prakash
#
# FILE
#   plot6.R
#
# OVERVIEW
# 	1. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
#	   sources in Los Angeles County, California (fips == "06037"). 
#     2. Which city has seen greater changes over time in motor vehicle emissions?
#-------------------------------------------------------------------------------------------------- 

install.packages("ggplot2")
library(ggplot2)

plot6<- function(){
	## read data
        NEI <- readRDS("./summarySCC_PM25.rds")
	  SCC <- readRDS("./Source_Classification_Code.rds")
	  NEISCC <- merge(NEI, SCC, by="SCC")
	
	## Comparison between motor vehicle related emissions, Baltimore City vs LA County 
	## Fips of Baltimore is 24510
	## fips of California is 06037
	  subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
	  totalEmissions <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
	  totalEmissions$fips[totalEmissions$fips=="24510"] <- "Baltimore, MD"
	  totalEmissions$fips[totalEmissions$fips=="06037"] <- "Los Angeles, CA"

	## ggplot
	  png("plot6.png", width=840, height=480)
	  g <- ggplot(totalEmissions, aes(factor(year), Emissions))
	  g <- g + facet_grid(. ~ fips)
	  g <- g + geom_bar(stat="identity")  + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  	  ggtitle('Total Emissions in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
	  print(g)
  	  dev.off()
}
plot6()
