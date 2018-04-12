#-------------------------------------------------------------------------------------------------
# Coursera Project - Exploratory Data (Week 4)
# Nikhil Prakash
#
# FILE
#   plot4.R
#
# OVERVIEW
# 	1. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
#-------------------------------------------------------------------------------------------------- 

install.packages("ggplot2")
library(ggplot2)

plot4<- function(){
	## read data
        NEI <- readRDS("./summarySCC_PM25.rds")
	  SCC <- readRDS("./Source_Classification_Code.rds")
	  NEISCC <- merge(NEI, SCC, by="SCC")
	
	# fetch all records with Short.Name (SCC) Coal
	  matches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
	  subsetNEISCC <- NEISCC[matches, ]
     
	## Yearly emissions 
  	  totalEmissions <- aggregate(Emissions ~ year, subsetNEISCC, sum)

	## ggplot
	  png('plot4.png', width=640, height=480)
	  g <- ggplot(totalEmissions, aes(factor(year), Emissions))
	  g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  	  ggtitle('Total Emissions from coal sources from 1999 to 2008')
	  print(g)
	  dev.off()
}
plot4()

