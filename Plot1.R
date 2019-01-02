## Set wd where unzipped files are stored

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Use dir() to ensure you have the files. Bring up NEI and SCC in View() to aid in analysis.


## Question 1
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
## Aggregate splits data into subsets and computes summary statistics for each.
## names.arg will label the aggregated bars in the barplot
## Base plotting system is required for question 1. Launch the device (png) and then use plot or hist to graph.
ByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=ByYear$Emissions, names.arg=ByYear$year, xlab="Years", ylab="PM 2.5 level, tons",main="Total PM 2.5 by year collected in tons")
dev.off()

## CONCLUSION: The plot suggests that the total emissions from PM 2.5 have decreased.
## The data is in 4 time periods in multiple US locations, each data year showing a decrease from the previous data year.

