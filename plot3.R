#-------------------------------------------------------------------------------------------------
# Coursera Project - Exploratory Data (Week 4)
# Nikhil Prakash
#
# FILE
#   plot3.R
#
# OVERVIEW
# 	1. Four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# 	   which of these four sources have seen decreases in emissions from 1999 2008 for Baltimore City? 
# 	2. Which have seen increases in emissions from 1999 2008? 
# 	3. Use the ggplot2 plotting system to make a plot.
#-------------------------------------------------------------------------------------------------- 

install.packages("ggplot2")
library(ggplot2)

plot3<- function(){
	## read data
        NEI <- readRDS("./summarySCC_PM25.rds")
	  SCC <- readRDS("./Source_Classification_Code.rds")

	## Baltimore is 24510
        subsetNEI  <- NEI[NEI$fips=="24510", ]     
	## Yearly emissions 
  	  totalEmissions <- aggregate(Emissions ~ year + type, subsetNEI, sum)

	## ggplot2
	  png('plot3.png', width=640, height=480)
	  g <- ggplot(totalEmissions, aes(year, Emissions, color = type))
	  g <- g + geom_line() +
  	  xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
 	  ggtitle("Emissions in Baltimore City, Maryland from 1999 to 2008")
	  print(g)
	  dev.off()
}
plot3()




