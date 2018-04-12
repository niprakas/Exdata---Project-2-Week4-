#-------------------------------------------------------------------------------------------------
# Coursera Project - Exploratory Data (Week 4)
# Nikhil Prakash
#
# FILE
#   plot2.R
#
# OVERVIEW
# 	1. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008 
# 	2. Use the base plotting system to make a plot answering this question.
#-------------------------------------------------------------------------------------------------- 

plot2<- function(){
	## read data
        NEI <- readRDS("./summarySCC_PM25.rds")
	  SCC <- readRDS("./Source_Classification_Code.rds")
        subsetNEI  <- NEI[NEI$fips=="24510", ]     
	## Yearly emissions 
  	  totalEmissions <- aggregate(Emissions ~ year, subsetNEI, sum)

	## Base plot
	  png('plot2.png')
	  barplot(height=totalEmissions$Emissions, names.arg=totalEmissions$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' Yearly emissions in Baltimore city'), col = "red")
	  dev.off()
}
plot2()