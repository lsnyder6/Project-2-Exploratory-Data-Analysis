## Set wd where unzipped files are stored

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Use dir() to ensure you have the files. Bring up NEI and SCC in View() to aid in analysis.

## Question 4
## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

## Start by making sure ggplot2 is available (library).

library(ggplot2)

## SCC is the name of the source as indicated by a digit string, is unique, and allows merging of NEI and SCC data.
Both <- merge(NEI, SCC, by="SCC")

# ID records with coal in the name.
coalID  <- grepl("coal", Both$Short.Name, ignore.case=TRUE)
coalBoth <- Both[coalID, ]

ByYear <- aggregate(Emissions ~ year, coalBoth, sum)

png("plot4.png", width=840, height=480)
g <- ggplot(ByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("Year") +
  ylab("PM 2.5 Level, tons") +
  ggtitle('Total Emissions from coal sources')
print(g)
dev.off()

## CONCLUSION: the plot suggests that emissions from coal has decreased steadily and slowly across the US.
## Data is taken 4 times, in the years between 1999 and 2008.
