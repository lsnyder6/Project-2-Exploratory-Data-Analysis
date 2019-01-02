## Set wd where unzipped files are stored

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Use dir() to ensure you have the files. Bring up NEI and SCC in View() to aid in analysis.## Question 2
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Base plotting system again required.

BCityNEI  <- NEI[NEI$fips=="24510", ]

ByYear <- aggregate(Emissions ~ year, BCityNEI, sum)

png('plot2.png')
barplot(height=ByYear$Emissions, names.arg=ByYear$year, xlab="Years", ylab="PM 2.5 level Baltimore City, tons",main="Total PM 2.5 in Baltimore City by year collected in tons")
dev.off()

## CONCLUSION: The plot suggests that the total emissions from PM 2.5 have decreased overall in Baltimore City.
## The data is in 4 time periods. 1999 is the highest, then 2005, then 2002, and the lowest by far is 2012.
## Further data collection would be needed to better determine whether emissions were truly decreasing.
