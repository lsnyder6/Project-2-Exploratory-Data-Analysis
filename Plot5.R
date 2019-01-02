## Set wd where unzipped files are stored

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Use dir() to ensure you have the files. Bring up NEI and SCC in View() to aid in analysis.

## Question 5
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

## Start by making sure ggplot2 is available (library).

library(ggplot2)

Both <- merge(NEI, SCC, by="SCC")

## The EPA website states that "NEI onroad sources include emissions from onroad vehicles that use gasoline, diesel, and other fuels."
## The question asks about motor vehicle sources.
## The EPA website states that nonroad sources "Source types include construction equipment, lawn and garden equipment, aircraft ground support equipment, locomotives, and commercial marine vessels."
## Nonroad sources are not standard motor vechicle sources, therefore are not included.

onroadNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

ByYear <- aggregate(Emissions ~ year, onroadNEI, sum)

png("plot5.png", width=840, height=480)
g <- ggplot(ByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab("PM 2.5 level, tons") +
  ggtitle('Total Emissions from motor vehicles in Baltimore City')
print(g)
dev.off()

## CONCLUSION: The plot suggests that emissions from onroad vehicles in Baltimore City have decreased.
## Data is taken 4 times, in the years between 1999 and 2008. There is an especially sharp drop from 1999-2008.
