#-------------------------------------------------------------------------------------------------
# Coursera Project - Exploratory Data (Week 4)
# Nikhil Prakash
#
# FILE
#   plot5.R
#
# OVERVIEW
# 	1. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
# 	2. Baltimore City is 24510 from question 2.
#-------------------------------------------------------------------------------------------------- 

install.packages("ggplot2")
library(ggplot2)

plot5<- function(){
	## read data
        NEI <- readRDS("./summarySCC_PM25.rds")
	  SCC <- readRDS("./Source_Classification_Code.rds")
	  NEISCC <- merge(NEI, SCC, by="SCC")
	
	## Emissions from motor vehicle sources 
	  subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD", ]
	  totalEmissions <- aggregate(Emissions ~ year, subsetNEI, sum)

	## ggplot
	  png("plot5.png", width=840, height=480)
	  g <- ggplot(totalEmissions, aes(factor(year), Emissions))
	  g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
	  print(g)
	  dev.off()
}
plot5()
