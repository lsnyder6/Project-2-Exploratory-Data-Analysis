## Set wd where unzipped files are stored

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Use dir() to ensure you have the files. Bring up NEI and SCC in View() to aid in analysis.## Question 2
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Base plotting system again required.

## Question 6
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

## Start by making sure ggplot2 is available (library).

library(ggplot2)

Both <- merge(NEI, SCC, by="SCC")

## The EPA website states that "NEI onroad sources include emissions from onroad vehicles that use gasoline, diesel, and other fuels."
## The question asks about motor vehicle sources.
## fips ID numbers are given in the assignment.

onroadNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

ByYearAndFips <- aggregate(Emissions ~ year + fips, onroadNEI, sum)
ByYearAndFips$fips[ByYearAndFips$fips=="24510"] <- "Baltimore, MD"
ByYearAndFips$fips[ByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=840, height=480)
g <- ggplot(ByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("Year") +
  ylab("PM 2.5 level in Baltimore City and LA, tons") +
  ggtitle('Total Emissions from motor vehicle in Baltimore City vs LA')
print(g)
dev.off()

## CONCLUSION: Both cities have seen significant changes.
## Baltimore City levels are much lower, and have been steadily decreasing.
## LA levels are over 10 x as high, and increased until 2012, where the dropped some.
