## Set wd where unzipped files are stored

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Use dir() to ensure you have the files. Bring up NEI and SCC in View() to aid in analysis. 

## Question 3
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## Start by making sure ggplot2 is available (library).

library(ggplot2)

BCityNEI  <- NEI[NEI$fips=="24510", ]

ByYearandType <- aggregate(Emissions ~ year + type, BCityNEI, sum)

png("plot3.png")
g <- ggplot(ByYearandType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Year") +
  ylab("PM 2.5 level Baltimore City, tons") +
  ggtitle('Total PM 2.5 in Baltimore City by year collected in tons')
print(g)
dev.off()

## CONCLUSION: The plot suggests that nonpoint, non-road and on-road sources have seen clear decreases in emissions in Baltimore City.
## The data is in 4 time periods for Baltimore City, each data year showing a decrease from the previous data year.
## The final source, point, shows steep increases for the first two time periods, and then decreasing sharply in 2008. 

