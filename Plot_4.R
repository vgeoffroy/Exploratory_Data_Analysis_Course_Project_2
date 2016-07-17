# EXPLORATORY DATA ANALYSIS - PROJECT 2 - PLOT 4:

# Read the files previously unziped from Datapm25.zip using readRDS:
NEI <- readRDS("summarySCC_PM25.rds"); SCC <- readRDS("Source_Classification_Code.rds")

# Merge both data together:
SCCNEI <- merge(NEI, SCC, by="SCC")

library(ggplot2)  # Load the ggplot2 library

# Search for any data related to coal combustion:
CoalSCCNEI  <- grepl("coal", SCCNEI$Short.Name, ignore.case = TRUE)

# Create a data set of emissions from coal combustion-related sources across the United States:
subSCCNEI <- SCCNEI[CoalSCCNEI, ]

# Create a table of summed emissions from coal combustion according to years in the United States:
TotalEmissionsByYearsBaltCity <- aggregate(Emissions ~ year, subSCCNEI, sum)

# Create a plot of the total emissions from coal combustion in the United States:
png("Plot_4.png", width = 640, height = 480)                                           # Open the plotting device
g <- ggplot(TotalEmissionsByYearsBaltCity, aes(factor(year), Emissions))               # Create the plot
g <- g + geom_bar(stat = "identity", width = 0.3, fill="#000000", colour = "black") +  # Add black bars of width 0.3
        xlab("year") +                                                                 # label the x axis
        ylab(expression('Total emissions from PM'[2.5]*' due to coal')) +              # Label the y axis
        ggtitle('Total emissions from coal sources from 1999 to 2008')                 # Create a title
print(g)                                                                               # Print the plot
dev.off()                                                                              # Close the plotting device

# QUESTION: Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# ANSWER: Across the United States, emissions from coal combustion-related sources seem to decrease from 1999 to 2008.
