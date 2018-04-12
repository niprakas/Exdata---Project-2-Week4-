#-------------------------------------------------------------------------------------------------
# Coursera Project - Exploratory Data (Week 4)
# Nikhil Prakash
#
# FILE
#   plot1.R
#
# OVERVIEW
# 	1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008 
# 	2. Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# 	   for each of the years 1999, 2002, 2005, and 2008.
#-------------------------------------------------------------------------------------------------- 

plot1<- function(){
                
      ## read data
        NEI <- readRDS("./summarySCC_PM25.rds")
	  SCC <- readRDS("./Source_Classification_Code.rds")
             
	## Yearly emissions 
  	  totalEmissions <- aggregate(Emissions ~ year, NEI, sum)

	## Base plot
	  png('plot1.png')
	  barplot(height=totalEmissions$Emissions, names.arg=totalEmissions$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'), col = "red")
	  dev.off()
}
plot1()
